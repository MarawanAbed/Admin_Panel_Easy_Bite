import 'package:admin/src/profile/data/models/profile_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/utils/constants.dart';
import '../models/product_dto.dart';

part 'products_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  ProductsDatasource{

  @factoryMethod
  factory ProductsDatasource(Dio dio) = _ProductsDatasource;

  @POST('/items/create')
  Future<ProductDto> createProduct(@Body() ProductDto params);

  @PUT('/items/update/{id}')
  Future<ProductDto> updateProduct(@Path('id') id, @Body() ProductDto params);

  @GET('/items')
  Future<List<ProductDto>> fetchProducts();

  @DELETE('/items/update/{id}')
  Future<String> deleteProduct(@Path('id') id);

}