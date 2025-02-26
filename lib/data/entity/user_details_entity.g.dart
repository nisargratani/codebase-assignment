// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailsEntity _$UserDetailsEntityFromJson(Map<String, dynamic> json) =>
    UserDetailsEntity(
      (json['id'] as num).toInt(),
      json['email'] as String,
      json['first_name'] as String,
      json['last_name'] as String,
      json['avatar'] as String,
    );

Map<String, dynamic> _$UserDetailsEntityToJson(UserDetailsEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar': instance.avatar,
    };
