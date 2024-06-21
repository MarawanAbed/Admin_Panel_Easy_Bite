// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeParams _$EmployeeParamsFromJson(Map<String, dynamic> json) =>
    EmployeeParams(
      id: json['_id'] as String?,
      employeeName: json['employeeName'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      position: json['position'] as String?,
      birthDate: json['birthDate'] as String?,
      hireDate: json['hireDate'] as String?,
      terminationDate: json['terminationDate'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$EmployeeParamsToJson(EmployeeParams instance) =>
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
    };
