// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeDto _$EmployeeDtoFromJson(Map<String, dynamic> json) => EmployeeDto(
      id: json['_id'] as String?,
      employeeName: json['employeeName'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      position: json['position'] == null
          ? null
          : PositionDto.fromJson(json['position'] as Map<String, dynamic>),
      birthDate: json['birthDate'] as String?,
      hireDate: json['hireDate'] as String?,
      terminationDate: json['terminationDate'] as String?,
      image: json['image'] as String?,
      additionalPay: json['additionalPay'] as int?,
      deduction: json['deduction'] as int?,
    );

Map<String, dynamic> _$EmployeeDtoToJson(EmployeeDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'employeeName': instance.employeeName,
      'email': instance.email,
      'address': instance.address,
      'position': instance.position,
      'birthDate': instance.birthDate,
      'hireDate': instance.hireDate,
      'terminationDate': instance.terminationDate,
      'image': instance.image,
      'additionalPay': instance.additionalPay,
      'deduction': instance.deduction,
    };
