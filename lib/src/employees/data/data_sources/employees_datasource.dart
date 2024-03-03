import 'package:admin/src/profile/data/models/profile_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/utils/constants.dart';
import '../models/employee_dto.dart';

part 'employees_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  EmployeesDatasource{

  @factoryMethod
  factory EmployeesDatasource(Dio dio) = _EmployeesDatasource;

  @GET('/users/register')
  Future<EmployeeDto> createEmployee(@Body() EmployeeDto params);

  @GET('/users/update/{id}')
  Future<EmployeeDto> updateEmployee(@Path('id') id, @Body() EmployeeDto params);

  @GET('/users')
  Future<List<EmployeeDto>> fetchEmployees();

  @GET('/users/update/{id}')
  Future<EmployeeDto> deleteEmployee(@Path('id') id);

}