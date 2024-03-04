// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) => ProductDto(
      id: json['_id'] as String?,
      itemName: json['itemName'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      category: json['category'] as String?,
      price: json['price'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$ProductDtoToJson(ProductDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'itemName': instance.itemName,
      'description': instance.description,
      'image': instance.image,
      'category': instance.category,
      'price': instance.price,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };
