import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../logic/auth_bloc/auth_bloc.dart';
import '../../auth/services/authrepo.dart';
import '../../events/services/eventapi.dart';
import '../services/user_repo.dart';

part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthBloc authBloc;
  UserBloc(
    this.authBloc,
  ) : super(const _Initial()) {
    on<UserEvent>((event, emit) {
      event.map(
          updateUser: _onUpdateUser,
          updateUserImage: _onUpdateUserImage,
          updateUserPassword: _onUpadteUserPassword,
          submiteOrganizer: _onSubmiteOrganizer,
          sendReport: _onSendReport,
          sendFeedback: _onSendFeedback);
    });
  }

  String bugType = 'Bug';
  Future<void> _onSubmiteOrganizer(_SubmiteOrganizer event) async {
    try {
      emit(const UserState.loading());
      final token = await AuthRepo.token;
      if (token == null) {
        emit(const UserState.failure('Token not found'));
        return;
      }
      final res = await EventApi.submiteOrganizer(
          event.motivation, event.eventId, token);
      if (res.statusCode != 200) {
        emit(const UserState.failure('Something went wrong'));
        return;
      }
      emit(const UserState.success());
    } catch (e) {
      print(e);
      emit(const UserState.failure('Something went wrong'));
    }
  }

  FutureOr<void> _onSendFeedback(_SendFeedback event) async {
    try {
      emit(const UserState.loading());
      final token = await AuthRepo.token;
      if (token != null) {
        final res = await UserRepo.sendFeedback(token, event.feedback);

        print(res.data);
        if (res.statusCode == 201) {
          emit(const UserState.success());
        } else {
          emit(UserState.failure(res.data['error'] ?? 'Something went wrong'));
        }
      } else {
        emit(const UserState.failure('Token not found'));
      }
    } catch (e) {
      emit(const UserState.failure('Something went wrong'));
    }
  }

  void setBugType(String type) {
    bugType = type;
  }

  FutureOr<void> _onUpdateUser(_UpdateUser event) async {
    try {
      final String? token = await AuthRepo.token;
      if (token == null) emit(const UserState.failure('Token not found'));
      emit(const UserState.loading());
      final res = await UserRepo.updateUser(token!, event.data);
      if (res.statusCode == 200) {
        authBloc.add(AuthEvent.updateuser(res.data['user']));
        emit(const UserState.success());
      } else {
        emit(UserState.failure(res.data['error'] ?? 'Something went wrong'));
      }
    } catch (e) {
      print(e);
      emit(const UserState.failure('Something went wrong'));
    } finally {
      emit(const UserState.initial());
    }
  }

  FutureOr<void> _onUpdateUserImage(_UpdateUserImage event) async {
    try {
      emit(const UserState.loading());
      final token = await AuthRepo.token;
      if (token != null) {
        final res = await UserRepo.updateimage(
          token,
          event.path,
        );
        if (res['success'] == true) {
          authBloc.add(AuthEvent.updateuser(res['user']));
          emit(const UserState.success());
        } else {
          emit(UserState.failure(res['error'] ?? 'Something went wrong'));
        }
      } else {
        emit(const UserState.failure('Token not found'));
      }
    } catch (e) {
      print(e);
      emit(const UserState.failure('Something went wrong'));
    }
  }

  FutureOr<void> _onUpadteUserPassword(_UpdateUserPassword event) async {
    try {
      emit(const UserState.loading());
      final token = await AuthRepo.token;
      if (token != null) {
        final res = await UserRepo.updatePassword(
            token, event.oldpassword, event.newpassword);
        if (res.statusCode == 201) {
          emit(const UserState.success());
        } else {
          emit(UserState.failure(res.data['error'] ?? 'Something went wrong'));
        }
      } else {
        emit(const UserState.failure('Token not found'));
      }
    } catch (e) {
      print(e);
      emit(const UserState.failure('Something went wrong'));
    }
  }

  FutureOr<void> _onSendReport(_SendReport event) async {
    try {
      emit(const UserState.loading());
      final token = await AuthRepo.token;
      if (token != null) {
        final res = await UserRepo.reportBug(
            event.message, bugType, token, event.image);
        print(res);
        if (res['success'] == true) {
          emit(const UserState.success());
        } else {
          emit(UserState.failure(res['error'] ?? 'Something went wrong'));
        }
      } else {
        emit(const UserState.failure('Token not found'));
      }
    } catch (e) {
      print(e);
      emit(const UserState.failure('Something went wrong'));
    }
  }
}
