import 'package:admin/src/profile/data/models/profile_dto.dart';
import 'package:injectable/injectable.dart';

import '../../data/data_sources/products_datasource.dart';
import '../../data/models/create_user_params.dart';

@Injectable()
class ProductsUseCase {
  final ProductsDatasource  apiProvider;
  ProductsUseCase(this.apiProvider);

  Future<List<ProfileDto>> fetchUsers() async {
    return  await apiProvider.fetchProducts();
  }

  Future<ProfileDto> createUser(CreateUserParams params) async {
    return  await apiProvider.createProduct(params);
  }

  Future<ProfileDto> deleteUser(id) async {
    return  await apiProvider.deleteProduct(id);
  }

  Future<ProfileDto> updateUser(CreateUserParams params) async {
    return  await apiProvider.updateProduct(params.id, params);
  }


}