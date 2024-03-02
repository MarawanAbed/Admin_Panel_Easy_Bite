import 'package:json_annotation/json_annotation.dart'; 

part 'benefit_type_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class BenefitTypeDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;

  BenefitTypeDto({this.id, this.name});

   factory BenefitTypeDto.fromJson(Map<String, dynamic> json) => _$BenefitTypeDtoFromJson(json);

   Map<String, dynamic> toJson() => _$BenefitTypeDtoToJson(this);
}

