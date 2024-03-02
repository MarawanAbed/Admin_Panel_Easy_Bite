// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'benefit_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BenefitDto _$BenefitDtoFromJson(Map<String, dynamic> json) => BenefitDto(
      id: json['id'] as int?,
      image: json['image'] as String?,
      thread: json['thread'] == null
          ? null
          : BenefitTypeDto.fromJson(json['thread'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BenefitDtoToJson(BenefitDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'thread': instance.thread,
    };
