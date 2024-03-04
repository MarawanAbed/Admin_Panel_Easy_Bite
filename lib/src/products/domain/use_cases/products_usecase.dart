import 'package:injectable/injectable.dart';

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
    return  await apiProvider.createProduct(params);
  }

  Future<String> deleteUser(id) async {
    return  await apiProvider.deleteProduct(id);
  }

  Future<ProductDto> updateUser(ProductDto params) async {
    return  await apiProvider.updateProduct(params.id, params);
  }


}