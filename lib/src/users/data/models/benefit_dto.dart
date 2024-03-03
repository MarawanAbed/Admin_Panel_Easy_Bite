import 'package:json_annotation/json_annotation.dart';

import 'benefit_type_dto.dart';

part 'benefit_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class BenefitDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'thread')
  BenefitTypeDto? thread;

  BenefitDto({this.id, this.image, this.thread});

   factory BenefitDto.fromJson(Map<String, dynamic> json) => _$BenefitDtoFromJson(json);

   Map<String, dynamic> toJson() => _$BenefitDtoToJson(this);
}

