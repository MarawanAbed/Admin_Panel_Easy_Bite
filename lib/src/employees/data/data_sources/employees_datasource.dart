import 'package:admin/src/employees/data/models/deduction_params.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/utils/constants.dart';
import '../models/additional_pay_params.dart';
import '../models/employee_dto.dart';
import '../models/employee_params.dart';

part 'employees_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  EmployeesDatasource{

  @factoryMethod
  factory EmployeesDatasource(Dio dio) = _EmployeesDatasource;

  @POST('/employees/register')
  Future createEmployee(@Body() EmployeeParams params);

  @PUT('/employees/update/{id}')
  Future updateEmployee(@Path('id') id, @Body() EmployeeParams params);

  @GET('/employees')
  Future<List<EmployeeDto>> fetchEmployees();

  @DELETE('/employees/delete/{id}')
  Future<String> deleteEmployee(@Path('id') id);

  @PATCH('/employees/{id}/additionalpay')
  Future<String> addBonus(@Body() AdditionalPayParams params, @Path('id') id);

  @PATCH('/employees/{id}/deduction')
  Future<String> addDeduction(@Body() DeductionParams params, @Path('id') id);

}