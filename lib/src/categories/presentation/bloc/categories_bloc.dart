import 'package:admin/src/profile/data/models/profile_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/use_cases/categories_usecase.dart';

@Injectable()
class CategoriesCubit extends BaseCubit {
  final CategoriesUseCase usecase;

  CategoriesCubit(this.usecase);

  void fetchInitialData() async {
    executeSuccess(() => usecase.fetchCategories());
    // emit(DataSuccess<List<ProfileDto>>([
    //   ProfileDto(
    //     id: '1',
    //     userName: "John Doe",
    //     email: "johnm@.cvp",
    //   ),
    // ]));
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
