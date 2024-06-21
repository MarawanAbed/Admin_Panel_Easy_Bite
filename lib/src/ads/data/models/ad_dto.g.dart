// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdDto _$AdDtoFromJson(Map<String, dynamic> json) => AdDto(
      id: json['_id'] as String?,
      categoryName: json['categoryName'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$AdDtoToJson(AdDto instance) => <String, dynamic>{
      '_id': instance.id,
      'categoryName': instance.categoryName,
      'image': instance.image,
    };
