import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../core/firebase/chat_firebase_service.dart';
import '../../data/data_sources/employees_datasource.dart';
import '../../data/models/employee_dto.dart';
import '../../data/models/employee_params.dart';

@Injectable()
class EmployeesUseCase {
  final EmployeesDatasource apiProvider;

  EmployeesUseCase(this.apiProvider);

  Future<List<EmployeeDto>> fetchEmployees() async {
    return await apiProvider.fetchEmployees();
  }

  Future<String> createUser(EmployeeParams params) async {
    String file = await ChatFirebaseService.handleImage(
          params.id!,
          file: File(params.image!),
          image: params.image!,
        ) ??
        '';
    params.image = file;
    await apiProvider.createEmployee(params);
    return 'Success create employee';
  }

  Future<String> deleteUser(id) async {
     await apiProvider.deleteEmployee(id);
    return 'Success delete employee';
  }

  Future<String> updateUser(EmployeeParams params) async {
    String file = await ChatFirebaseService.handleImage(
          params.id,
          file: File(params.image!),
          image: params.image!,
        ) ??
        '';
    params.image = file;
    await apiProvider.updateEmployee(params.id, params);
    return 'Success update employee';
  }
}
