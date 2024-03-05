import 'dart:io';

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

  @MultiPart()
  @POST('/items/create')
  Future<ProductDto> createProduct(
    @Part(name: 'itemName') String itemName,
    @Part(name: 'price') int price,
    @Part(name: 'description') String description,
    @Part(name: 'image') File image,
    @Part(name: 'category') String category,
  );

  @PUT('/items/update/{id}')
  Future<ProductDto> updateProduct(@Path('id') id, @Body() ProductDto params);

  @GET('/items')
  Future<List<ProductDto>> fetchProducts();

  @DELETE('/items/delete/{id}')
  Future<String> deleteProduct(@Path('id') id);
}
