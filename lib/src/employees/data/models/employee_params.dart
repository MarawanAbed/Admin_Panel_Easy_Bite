import 'package:json_annotation/json_annotation.dart';

part 'employee_params.g.dart';

@JsonSerializable()
class EmployeeParams {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "employeeName")
  final String? employeeName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "address")
  final String? address;
  @JsonKey(name: "position")
  final String? position;
  @JsonKey(name: "birthDate")
  final String? birthDate;
  @JsonKey(name: "hireDate")
  final String? hireDate;
  @JsonKey(name: "terminationDate")
  final String? terminationDate;
  @JsonKey(name: 'image')
  String? image;

  EmployeeParams({
    this.id,
    this.employeeName,
    this.email,
    this.address,
    this.position,
    this.birthDate,
    this.hireDate,
    this.terminationDate,
    this.image,
  });

  factory EmployeeParams.fromJson(Map<String, dynamic> json) {
    return _$EmployeeParamsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$EmployeeParamsToJson(this);
  }
}


