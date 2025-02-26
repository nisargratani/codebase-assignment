// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserListEntity _$UserListEntityFromJson(Map<String, dynamic> json) =>
    UserListEntity(
      (json['data'] as List<dynamic>)
          .map((e) => UserDetailsEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserListEntityToJson(UserListEntity instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
