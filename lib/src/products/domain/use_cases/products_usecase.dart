import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../core/firebase/chat_firebase_service.dart';
import '../../data/data_sources/products_datasource.dart';
import '../../data/models/product_dto.dart';

@Injectable()
class ProductsUseCase {
  final ProductsDatasource  apiProvider;
  ProductsUseCase(this.apiProvider);

  Future<List<ProductDto>> fetchUsers() async {
    return  await apiProvider.fetchProducts();
  }

  Future<ProductDto> createUser(ProductDto params) async {
    print('params: ${params.toJson()}');
    String file = await ChatFirebaseService.handleImage(
      params.id!,
      file: File(params.image!),
      image: params.image!,
    ) ?? '';
    return  await apiProvider.createProduct(
      params.itemName!,
      params.price ?? 0,
      file,
      File(params.image!),
      params.categoryId!,
    );
  }

  Future<String> deleteUser(id) async {
    return  await apiProvider.deleteProduct(id);
  }

  Future<ProductDto> updateUser(ProductDto params) async {
    String file = await ChatFirebaseService.handleImage(
      params.id!,
      file: File(params.image!),
      image: params.image!,
    ) ?? '';
    params.image = file;
    return  await apiProvider.updateProduct(params.id, params);
  }


}