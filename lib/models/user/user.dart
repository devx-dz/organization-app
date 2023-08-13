import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String firstname,
    required String lastname,
    String? email,
    String? phone,
    @JsonKey(name : '_id')  String? id,
    String? password,
    String? image,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
