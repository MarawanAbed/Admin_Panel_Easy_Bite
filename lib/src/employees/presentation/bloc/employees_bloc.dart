import 'package:admin/src/profile/data/models/profile_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/use_cases/employees_usecase.dart';

@Injectable()
class EmployeesCubit extends BaseCubit {
  final EmployeesUseCase usecase;

  EmployeesCubit(this.usecase);

  void fetchInitialData() async {
    // executeSuccess(() => usecase.fetchUsers());
    emit(DataSuccess<List<ProfileDto>>([
      ProfileDto(
        id: '1',
        userName: "John Doe",
        email: "johnm@.cvp",
      ),
    ]));
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
