import 'dart:io';

import 'package:admin/src/products/data/models/product_params.dart';
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
abstract class ProductsDatasource {
  @factoryMethod
  factory ProductsDatasource(Dio dio) = _ProductsDatasource;

  @POST('/items/create')
  Future createProduct(@Body() ProductParams params);

  @PUT('/items/update/{id}')
  Future updateProduct(@Path('id') id, @Body() ProductParams params);

  @GET('/items')
  Future<List<ProductDto>> fetchProducts();

  @DELETE('/items/delete/{id}')
  Future deleteProduct(@Path('id') id);
}
