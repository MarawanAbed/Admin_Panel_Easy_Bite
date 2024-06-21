import 'package:json_annotation/json_annotation.dart';

import '../../../categories/data/models/category_dto.dart';

part 'product_params.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class ProductParams {
  @JsonKey(name: '_id', includeIfNull: false)
  String? id;
  @JsonKey(name: 'itemName')
  String? itemName;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'category')
  String? categoryId;
  @JsonKey(name: 'price')
  int? price;
  @JsonKey(name: 'createdAt')
  String? createdAt;
  @JsonKey(name: 'updatedAt')
  String? updatedAt;
  @JsonKey(name: '__v')
  int? v;

  ProductParams({this.id, this.itemName, this.description, this.image, this.categoryId,this.price, this.createdAt, this.updatedAt, this.v});

   factory ProductParams.fromJson(Map<String, dynamic> json) => _$ProductParamsFromJson(json);

   Map<String, dynamic> toJson() => _$ProductParamsToJson(this);
}

