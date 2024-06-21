import 'package:json_annotation/json_annotation.dart'; 

part 'ad_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class AdDto {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'categoryName')
  String? categoryName;
  @JsonKey(name: 'image')
  String? image;

  AdDto({this.id, this.categoryName, this.image});

   factory AdDto.fromJson(Map<String, dynamic> json) => _$AdDtoFromJson(json);

   Map<String, dynamic> toJson() => _$AdDtoToJson(this);
}

