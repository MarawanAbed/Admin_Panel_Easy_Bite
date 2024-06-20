import 'package:json_annotation/json_annotation.dart'; 

part 'create_category_params.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class CreateCategoryParams {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'categoryName')
  String? categoryName;
  @JsonKey(name: 'image')
  String? image;

  CreateCategoryParams({this.id, this.categoryName, this.image});

   factory CreateCategoryParams.fromJson(Map<String, dynamic> json) => _$CreateCategoryParamsFromJson(json);

   Map<String, dynamic> toJson() => _$CreateCategoryParamsToJson(this);
}

