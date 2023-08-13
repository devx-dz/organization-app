import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/user/user.dart';
import '../../tasks/models/task.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  const factory Event({
    @JsonKey(name: '_id') required String id,
    required String name,
    required String description,
    required String image,
    String? place,
    String? datedebut,
    String? datefin,
    @Default('inactive') String? state,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
