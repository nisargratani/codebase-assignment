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
      (json['total_pages'] as num).toInt(),
    );

Map<String, dynamic> _$UserListEntityToJson(UserListEntity instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total_pages': instance.totalPages,
    };
