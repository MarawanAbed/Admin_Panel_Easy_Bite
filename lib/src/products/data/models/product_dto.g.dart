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
      category: json['category'] == null
          ? null
          : CategoryDto.fromJson(json['category'] as Map<String, dynamic>),
      price: json['price'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$ProductDtoToJson(ProductDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  val['itemName'] = instance.itemName;
  val['description'] = instance.description;
  val['image'] = instance.image;
  val['price'] = instance.price;
  val['createdAt'] = instance.createdAt;
  val['updatedAt'] = instance.updatedAt;
  val['__v'] = instance.v;
  return val;
}
