import 'package:admin/src/categories/data/models/category_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../categories/data/models/create_category_params.dart';
import '../../data/data_sources/dashboard_datasource.dart';

@Injectable()
class DashboardUseCase {
  final DashboardDatasource  apiProvider;
  DashboardUseCase(this.apiProvider);

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