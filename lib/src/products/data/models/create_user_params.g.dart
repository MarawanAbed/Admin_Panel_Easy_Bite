// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUserParams _$CreateUserParamsFromJson(Map<String, dynamic> json) =>
    CreateUserParams(
      id: json['id'] as String?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      isAdmin: json['is_admin'] as bool?,
    );

Map<String, dynamic> _$CreateUserParamsToJson(CreateUserParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'email': instance.email,
      'password': instance.password,
      'is_admin': instance.isAdmin,
    };
