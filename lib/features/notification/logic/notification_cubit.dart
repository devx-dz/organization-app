import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gdg_organizers_app/shared/widgets/loading.dart';

import '../../auth/services/authrepo.dart';
import '../../settings/services/user_repo.dart';
import '../model/notification.dart';

part 'notification_cubit.freezed.dart';
part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(const NotificationState.initial());

  int newNotificationCount = 0;
  List<Notif> notifications = [];
  void getNotification() async {
    try {
      emit(const NotificationState.loading());
      final token = await AuthRepo.getToken();
      if (token == null) {
        emit(const NotificationState.failure('Token not found'));
        return;
      }
      notifications = await UserRepo.getNotification(token);
      newNotificationCount =
          notifications.where((element) => element.read == false).length;
      print(notifications);

      emit(NotificationState.success(notifications));
    } catch (e) {
      print(e);
      emit(const NotificationState.failure('Something went wrong'));
    }
  }

  void readnotification() async {
    try {
      final token = await AuthRepo.getToken();
      if (token == null) return;
      print(newNotificationCount);
      if (newNotificationCount > 0) {
        newNotificationCount = 0;

        await UserRepo.readNotification(token);
      }
    } catch (e) {
      print(e);
    }
  }
}
