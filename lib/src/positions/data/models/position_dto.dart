import 'package:json_annotation/json_annotation.dart'; 

part 'position_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class PositionDto {
  @JsonKey(name: 'positionName')
  String? positionName;
  @JsonKey(name: 'salary')
  int? salary;
  @JsonKey(name: '_id')
  String? id;

  PositionDto({this.positionName, this.salary, this.id});

   factory PositionDto.fromJson(Map<String, dynamic> json) => _$PositionDtoFromJson(json);

   Map<String, dynamic> toJson() => _$PositionDtoToJson(this);
}

