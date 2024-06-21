import 'package:json_annotation/json_annotation.dart';

import '../../../categories/data/models/category_dto.dart';

part 'product_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class ProductDto {
  @JsonKey(name: '_id', includeIfNull: false)
  String? id;
  @JsonKey(name: 'itemName')
  String? itemName;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'category', includeIfNull: false, includeToJson: false)
  CategoryDto? category;
  @JsonKey(name: 'price')
  int? price;
  @JsonKey(name: 'stock')
  int? stock;
  @JsonKey(name: 'salesCount')
  int? salesCount;
  @JsonKey(name: 'createdAt')
  String? createdAt;
  @JsonKey(name: 'updatedAt')
  String? updatedAt;
  @JsonKey(name: '__v')
  int? v;

  ProductDto({this.id, this.itemName, this.description, this.image, this.category, this.price, this.stock, this.salesCount, this.createdAt, this.updatedAt, this.v});

   factory ProductDto.fromJson(Map<String, dynamic> json) => _$ProductDtoFromJson(json);

   Map<String, dynamic> toJson() => _$ProductDtoToJson(this);
}

