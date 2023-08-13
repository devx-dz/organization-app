part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.updateUser(Map<String, dynamic> data) = _UpdateUser;
  const factory UserEvent.updateUserImage(String path) = _UpdateUserImage;
  const factory UserEvent.updateUserPassword(
      String oldpassword, String newpassword) = _UpdateUserPassword;
  const factory UserEvent.sendFeedback(String feedback) = _SendFeedback;
  const factory UserEvent.submiteOrganizer(String eventId, String motivation) =
      _SubmiteOrganizer;
  const factory UserEvent.sendReport(String message, String? image) =
      _SendReport;
}
