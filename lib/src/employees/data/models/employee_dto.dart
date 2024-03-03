import 'package:json_annotation/json_annotation.dart';

part 'employee_dto.g.dart';

@JsonSerializable()
class EmployeeDto {
  @JsonKey(name: "id")
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

  EmployeeDto ({
    this.id,
    this.employeeName,
    this.email,
    this.address,
    this.position,
    this.birthDate,
    this.hireDate,
    this.terminationDate,
  });

  factory EmployeeDto.fromJson(Map<String, dynamic> json) {
    return _$EmployeeDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$EmployeeDtoToJson(this);
  }
}


