import 'package:json_annotation/json_annotation.dart';
import 'package:codebase_assignment/data/entity/user_details_entity.dart';

part "user_list_entity.g.dart";

@JsonSerializable()
class UserListEntity {
  @JsonKey(name: "data")
  final List<UserDetailsEntity> data;

  UserListEntity(
    this.data,
  );

  factory UserListEntity.fromJson(Map<String, dynamic> json) =>
      _$UserListEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserListEntityToJson(this);
}
