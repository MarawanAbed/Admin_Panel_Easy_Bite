import 'package:admin/src/categories/data/models/category_dto.dart';
import 'package:admin/src/profile/data/models/profile_dto.dart';
import 'package:injectable/injectable.dart';

import '../../data/data_sources/categories_datasource.dart';
import '../../data/models/create_category_params.dart';

@Injectable()
class CategoriesUseCase {
  final CategoriesDatasource  apiProvider;
  CategoriesUseCase(this.apiProvider);

  Future<List<CategoryDto>> fetchCategories() async {
    return  await apiProvider.fetchCategories();
  }

  Future<CategoryDto> createUser(CreateCategoryParams params) async {
    return  await apiProvider.createCategory(params);
  }

  Future<String> deleteUser(id) async {
    return  await apiProvider.deleteCategory(id);
  }

  Future<CategoryDto> updateUser(CreateCategoryParams params) async {
    return  await apiProvider.updateCategory(params.id, params);
  }


}