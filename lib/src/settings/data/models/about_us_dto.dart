import 'package:json_annotation/json_annotation.dart'; 

part 'about_us_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class AboutUsDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'section')
  String? section;

  AboutUsDto({this.id, this.section});

   factory AboutUsDto.fromJson(Map<String, dynamic> json) => _$AboutUsDtoFromJson(json);

   Map<String, dynamic> toJson() => _$AboutUsDtoToJson(this);
}

