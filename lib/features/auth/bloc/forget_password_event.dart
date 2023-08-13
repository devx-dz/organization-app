part of 'forget_password_bloc.dart';

@freezed
class ForgetPasswordEvent with _$ForgetPasswordEvent {
  const factory ForgetPasswordEvent.emailSend({required String email}) =
      _ForgetPassword;
  const factory ForgetPasswordEvent.resetPasswordCode({required String code}) =
      _ResetPasswordCode;

  const factory ForgetPasswordEvent.resetPassword(
      { required String password}) = _ResetPassword;
}
