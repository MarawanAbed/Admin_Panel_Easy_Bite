// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDto _$ProfileDtoFromJson(Map<String, dynamic> json) => ProfileDto(
      id: json['_id'] as String?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      isAdmin: json['isAdmin'] as bool?,
      isChef: json['isChef'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['__v'] as int?,
      accessToken: json['accessToken'] as String?,
    );

Map<String, dynamic> _$ProfileDtoToJson(ProfileDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userName': instance.userName,
      'email': instance.email,
      'isAdmin': instance.isAdmin,
      'isChef': instance.isChef,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
      'accessToken': instance.accessToken,
    };
