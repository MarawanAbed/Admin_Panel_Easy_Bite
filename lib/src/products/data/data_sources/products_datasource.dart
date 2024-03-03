import 'package:admin/src/profile/data/models/profile_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/utils/constants.dart';
import '../models/create_user_params.dart';

part 'products_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  ProductsDatasource{

  @factoryMethod
  factory ProductsDatasource(Dio dio) = _ProductsDatasource;

  @GET('/items/create')
  Future<ProfileDto> createProduct(@Body() CreateUserParams params);

  @GET('/items/update/{id}')
  Future<ProfileDto> updateProduct(@Path('id') id, @Body() CreateUserParams params);

  @GET('/items')
  Future<List<ProfileDto>> fetchProducts();

  @GET('/items/update/{id}')
  Future<ProfileDto> deleteProduct(@Path('id') id);

}