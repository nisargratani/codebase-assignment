import 'package:json_annotation/json_annotation.dart';

part "user_details_entity.g.dart";

@JsonSerializable()
class UserDetailsEntity {
  final int id;
  final String email;

  @JsonKey(name: "first_name")
  final String firstName;

  @JsonKey(name: "last_name")
  final String lastName;

  final String avatar;

  UserDetailsEntity(
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  );

  factory UserDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailsEntityToJson(this);
}
