import 'package:injectable/injectable.dart';

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
    return  await apiProvider.createEmployee(params);
  }

  Future<String> deleteUser(id) async {
    return  await apiProvider.deleteEmployee(id);
  }

  Future<EmployeeDto> updateUser(EmployeeDto params) async {
    return  await apiProvider.updateEmployee(params.id, params);
  }


}