import 'package:admin/src/profile/data/models/profile_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/widgets/drop_down/drop_down.dart';
import '../../../positions/domain/use_cases/positions_usecase.dart';
import '../../domain/use_cases/employees_usecase.dart';

@Injectable()
class EmployeesCubit extends BaseCubit {
  final EmployeesUseCase usecase;
  final PositionsUseCase positionsUseCase;

  EmployeesCubit(this.usecase, this.positionsUseCase);

  void fetchInitialData() async {
    try {
      emit(DataLoading());
      final response = await usecase.fetchEmployees();
      final positions = await positionsUseCase.fetchPositions();
      List<DropDownItem> items = positions
          .map((e) => DropDownItem(
              id: e.id, title: e.positionName, value: e.id.toString()))
          .toList();
      emit(DoubleDataSuccess(data1: response, data2: items));
    } catch (e) {
      emit(DataFailed(e));
      rethrow;
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
