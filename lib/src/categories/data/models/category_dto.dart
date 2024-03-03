import 'package:json_annotation/json_annotation.dart'; 

part 'category_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class CategoryDto {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'categoryName')
  String? categoryName;

  CategoryDto({this.id, this.categoryName});

   factory CategoryDto.fromJson(Map<String, dynamic> json) => _$CategoryDtoFromJson(json);

   Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);
}

