// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductParams _$ProductParamsFromJson(Map<String, dynamic> json) =>
    ProductParams(
      id: json['_id'] as String?,
      itemName: json['itemName'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      categoryId: json['category'] as String?,
      price: json['price'] as int?,
      stock: json['stock'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$ProductParamsToJson(ProductParams instance) {
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
  val['category'] = instance.categoryId;
  val['price'] = instance.price;
  val['stock'] = instance.stock;
  val['createdAt'] = instance.createdAt;
  val['updatedAt'] = instance.updatedAt;
  val['__v'] = instance.v;
  return val;
}
