import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../features/auth/services/authrepo.dart';
import '../../models/user/user.dart';
import '../../shared/services/network_info.dart';
import '../../shared/services/notification.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const _Initial()) {
    on<AuthEvent>((event, emit) {
      event.map(
          appstarted: _onAppStarted,
          loggedIn: _onLoggedIn,
          loggedOut: _onLoggedOut,
          updateuser: _onUpdateUser);
    });
  }

  FutureOr<void> _onAppStarted(
    _AppStarted event,
  ) async {
    try {
      emit(const _Loading());
      final isConnected = await NetworkInfo.isConnected;
      if (!isConnected) {
        emit(const _Failure('No Internet Connection'));
        return;
      }

      final token = await AuthRepo.token;
      print(token);
      if (token != null) {
        final Response response = await AuthRepo.getUser(token);
        if (response.statusCode != 200) {
          emit(const _Unauthenticated());
          return;
        }
        setuser(response.data['user']);
      } else {
        emit(const _Unauthenticated());
      }
    } catch (e) {
      print(e);
      emit(const _Failure('Something went wrong'));
    }
  }

  FutureOr<void> _onLoggedIn(
    _LoggedIn event,
  ) async {
    try {
      emit(const _Loading());

      await AuthRepo.persistData(event.token);
      setuser(event.data);

      // await NotificationServices.init();
    } catch (e) {
      print(e);

      emit(const _Unauthenticated());
    }
  }

  FutureOr<void> _onLoggedOut(
    _LoggedOut event,
  ) async {
    try {
      emit(const _Loading());
      await AuthRepo.deleteData();
      await NotificationServices.deleteToken();
      await NotificationServices.leaveChannel();
      emit(const _Unauthenticated());
    } catch (e) {
      print(e);
      emit(const _Unauthenticated());
    }
  }

  FutureOr<void> _onUpdateUser(
    _UpdateUser event,
  ) async {
    try {
      setuser(event.data);
    } catch (e) {
      print(e);
      emit(const _Unauthenticated());
    }
  }

  void setuser(Map<String, dynamic> data) {
    try {
      _user = User.fromJson(data);
      emit(_Authenticated(user));
    } catch (e) {
      print(e);
      throw e;
    }
  }

  User _user = const User(
    email: '',
    firstname: '',
    lastname: '',
  );

  User get user => _user;
}
