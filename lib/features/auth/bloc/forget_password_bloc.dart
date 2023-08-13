import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../services/authrepo.dart';

part 'forget_password_bloc.freezed.dart';
part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc() : super(_Initial()) {
    on<ForgetPasswordEvent>((event, emit) {
      event.map(
          emailSend: _onEmailSend,
          resetPasswordCode: _onResetPasswordCode,
          resetPassword: _onResetPassword);
    });
  }
  static String _email = '';
  static String get email => _email;

  static String code = '';
  FutureOr<void> _onEmailSend(_ForgetPassword value) async {
    emit(ForgetPasswordState.loading());
    try {
      final res = await AuthRepo.forgetPassword(value.email);
      print("object");
      print(res.data);
      print(res.statusCode);

      if (res.statusCode != 200) {
        emit(ForgetPasswordState.error(
            res.data['message'] ?? 'Something went wrong'));
        return;
      }
      _email = value.email;

      emit(ForgetPasswordState.success());
    } catch (e) {
      emit(ForgetPasswordState.error("Something went wrong"));
    }
  }

  FutureOr<void> _onResetPasswordCode(_ResetPasswordCode value) async {
    emit(ForgetPasswordState.loading());
    try {
      final res = await AuthRepo.confirmCode(value.code, email);
      if (res.statusCode != 200) {
        emit(ForgetPasswordState.error(
            res.data['message'] ?? 'Something went wrong'));
        return;
      }
      code = value.code;
      emit(ForgetPasswordState.success());
    } catch (e) {
      emit(ForgetPasswordState.error("Something went wrong"));
    }
  }

  FutureOr<void> _onResetPassword(_ResetPassword value) async {
    emit(ForgetPasswordState.loading());
    try {
      final res = await AuthRepo.resetPassword(value.password, email , code);
      if (res.statusCode != 200) {
        print(res.data);
        emit(ForgetPasswordState.error(
            res.data['message'] ?? 'Something went wrong'));
        return;
      }
      emit(ForgetPasswordState.success());
    } catch (e) {
      emit(ForgetPasswordState.error("Something went wrong"));
    }
  }
}
