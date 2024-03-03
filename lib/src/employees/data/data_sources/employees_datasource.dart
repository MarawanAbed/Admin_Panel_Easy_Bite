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

  @POST('/employees/register')
  Future<EmployeeDto> createEmployee(@Body() EmployeeDto params);

  @PUT('/employees/update/{id}')
  Future<EmployeeDto> updateEmployee(@Path('id') id, @Body() EmployeeDto params);

  @GET('/employees')
  Future<List<EmployeeDto>> fetchEmployees();

  @DELETE('/employees/delete/{id}')
  Future<String> deleteEmployee(@Path('id') id);

}