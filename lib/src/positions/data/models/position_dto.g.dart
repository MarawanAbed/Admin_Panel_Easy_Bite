// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PositionDto _$PositionDtoFromJson(Map<String, dynamic> json) => PositionDto(
      positionName: json['positionName'] as String?,
      salary: json['salary'] as int?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$PositionDtoToJson(PositionDto instance) =>
    <String, dynamic>{
      'positionName': instance.positionName,
      'salary': instance.salary,
      '_id': instance.id,
    };
