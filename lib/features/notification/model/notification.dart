import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class Notif with _$Notif {
  factory Notif({
    required bool read,
    required String title,
    required String body,
  }) = _Notif;

  factory Notif.fromJson(Map<String, dynamic> json) => _$NotifFromJson(json);
}
