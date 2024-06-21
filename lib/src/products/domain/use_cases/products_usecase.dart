import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../core/firebase/chat_firebase_service.dart';
import '../../data/data_sources/products_datasource.dart';
import '../../data/models/product_dto.dart';
import '../../data/models/product_params.dart';

@Injectable()
class ProductsUseCase {
  final ProductsDatasource apiProvider;

  ProductsUseCase(this.apiProvider);

  Future<List<ProductDto>> fetchUsers() async {
    return await apiProvider.fetchProducts();
  }

  Future<String> createUser(ProductParams params) async {
    print('params: ${params.toJson()}');
    String file = await ChatFirebaseService.handleImage(
          params.id,
          file: File(params.image!),
          image: params.image!,
        ) ??
        '';
    params.image = file;
    await apiProvider.createProduct(params);
    return 'Success created product';
  }

  Future<String> deleteUser(id) async {
    await apiProvider.deleteProduct(id);
    return 'Success deleted product';
  }

  Future<String> updateUser(ProductParams params) async {
    String file = await ChatFirebaseService.handleImage(
          params.id!,
          file: File(params.image!),
          image: params.image!,
        ) ??
        '';
    params.image = file;
    await apiProvider.updateProduct(params.id, params);
    return 'Success updated product';
  }
}
