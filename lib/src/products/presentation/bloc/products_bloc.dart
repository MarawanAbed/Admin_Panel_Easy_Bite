import 'package:admin/core/widgets/drop_down/drop_down.dart';
import 'package:admin/src/main_index.dart';
import 'package:injectable/injectable.dart';

import '../../../categories/domain/use_cases/categories_usecase.dart';
import '../../domain/use_cases/products_usecase.dart';

@Injectable()
class ProductsCubit extends BaseCubit {
  final ProductsUseCase usecase;
  final CategoriesUseCase categoriesUseCase;

  ProductsCubit(this.usecase, this.categoriesUseCase);

  void fetchInitialData() async {
    try {
      emit(DataLoading());
      final response = await usecase.fetchUsers();
      final categories = await categoriesUseCase.fetchCategories();
      List<DropDownItem> items = categories
          .map((e) => DropDownItem(id: e.id, title: e.categoryName, value: e.id.toString()))
          .toList();
      emit(DoubleDataSuccess(data1: response, data2: items));
    } catch (e) {
      emit(DataFailed(e));
    }
  }

  void createUser(params) async {
    executeEmitterListener(() => usecase.createUser(params));
  }

  void deleteUser(id) async {
    executeEmitterListener(() => usecase.deleteUser(id));
  }

  void updateUser(params) async {
    executeEmitterListener(() => usecase.updateUser(params));
  }
}
