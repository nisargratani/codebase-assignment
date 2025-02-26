import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part "user_details_entity.g.dart";

@HiveType(typeId: 1)
@JsonSerializable()
class UserDetailsEntity extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String email;
  @HiveField(2)
  @JsonKey(name: "first_name")
  final String firstName;
  @HiveField(3)
  @JsonKey(name: "last_name")
  final String lastName;
  @HiveField(4)
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
