import 'package:json_annotation/json_annotation.dart'; 

part 'product_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class ProductDto {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'itemName')
  String? itemName;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'category')
  String? category;
  @JsonKey(name: 'price')
  int? price;
  @JsonKey(name: 'createdAt')
  String? createdAt;
  @JsonKey(name: 'updatedAt')
  String? updatedAt;
  @JsonKey(name: '__v')
  int? v;

  ProductDto({this.id, this.itemName, this.description, this.image, this.category, this.price, this.createdAt, this.updatedAt, this.v});

   factory ProductDto.fromJson(Map<String, dynamic> json) => _$ProductDtoFromJson(json);

   Map<String, dynamic> toJson() => _$ProductDtoToJson(this);
}

