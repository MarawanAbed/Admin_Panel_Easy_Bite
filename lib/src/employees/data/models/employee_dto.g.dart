// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeDto _$EmployeeDtoFromJson(Map<String, dynamic> json) => EmployeeDto(
      id: json['id'] as String?,
      employeeName: json['employeeName'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      position: json['position'] as String?,
      birthDate: json['birthDate'] as String?,
      hireDate: json['hireDate'] as String?,
      terminationDate: json['terminationDate'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$EmployeeDtoToJson(EmployeeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employeeName': instance.employeeName,
      'email': instance.email,
      'address': instance.address,
      'position': instance.position,
      'birthDate': instance.birthDate,
      'hireDate': instance.hireDate,
      'terminationDate': instance.terminationDate,
      'image': instance.image,
    };
