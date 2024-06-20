import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../core/firebase/chat_firebase_service.dart';
import '../../data/data_sources/employees_datasource.dart';
import '../../data/models/employee_dto.dart';

@Injectable()
class EmployeesUseCase {
  final EmployeesDatasource  apiProvider;
  EmployeesUseCase(this.apiProvider);

  Future<List<EmployeeDto>> fetchUsers() async {
    return  await apiProvider.fetchEmployees();
  }

  Future<EmployeeDto> createUser(EmployeeDto params) async {
    String file = await ChatFirebaseService.handleImage(
      params.id!,
      file: File(params.image!),
      image: params.image!,
    ) ?? '';
    params.image = file;
    return  await apiProvider.createEmployee(params);
  }

  Future<String> deleteUser(id) async {
    return  await apiProvider.deleteEmployee(id);
  }

  Future<EmployeeDto> updateUser(EmployeeDto params) async {
    String file = await ChatFirebaseService.handleImage(
      params.id!,
      file: File(params.image!),
      image: params.image!,
    ) ?? '';
    params.image = file;
    return  await apiProvider.updateEmployee(params.id, params);
  }


}