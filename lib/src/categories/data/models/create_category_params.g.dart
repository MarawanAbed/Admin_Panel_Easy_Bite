// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_category_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCategoryParams _$CreateCategoryParamsFromJson(
        Map<String, dynamic> json) =>
    CreateCategoryParams(
      id: json['id'] as String?,
      categoryName: json['categoryName'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$CreateCategoryParamsToJson(
        CreateCategoryParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryName': instance.categoryName,
      'image': instance.image,
    };
