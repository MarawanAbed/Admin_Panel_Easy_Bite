import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/utils/constants.dart';
import '../../../categories/data/models/category_dto.dart';
import '../../../categories/data/models/create_category_params.dart';

part 'dashboard_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  DashboardDatasource{

  @factoryMethod
  factory DashboardDatasource(Dio dio) = _DashboardDatasource;

  @POST('/categories/create')
  Future<CategoryDto> createCategory(@Body() CreateCategoryParams params);

  @PUT('/categories/update/{id}')
  Future<CategoryDto> updateCategory(@Path('id') id, @Body() CreateCategoryParams params);

  @GET('/categories')
  Future<List<CategoryDto>> fetchCategories();

  @DELETE('/users/delete/{id}')
  Future<String> deleteCategory(@Path('id') id);

}