import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/utils/constants.dart';
import '../models/category_dto.dart';
import '../models/create_category_params.dart';

part 'categories_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  CategoriesDatasource{

  @factoryMethod
  factory CategoriesDatasource(Dio dio) = _CategoriesDatasource;

  @POST('/categories/create')
  Future<CategoryDto> createCategory(@Body() CreateCategoryParams params);

  @PUT('/categories/update/{id}')
  Future<CategoryDto> updateCategory(@Path('id') id, @Body() CreateCategoryParams params);

  @GET('/categories')
  Future<List<CategoryDto>> fetchCategories();

  @DELETE('/users/delete/{id}')
  Future<String> deleteCategory(@Path('id') id);

}