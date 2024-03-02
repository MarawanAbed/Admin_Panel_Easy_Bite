import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../../../core/resources/data_state.dart';
import '../../domain/entities/benefit_dto.dart';
import '../../domain/use_cases/benefits_usecase.dart';

@Injectable()
class BenefitsCubit extends BaseCubit {
  final BenefitsUseCase usecase;

  BenefitsCubit(this.usecase);

  List<Benefit>  benefits = [];
  void fetchInitialData() async {
    executeDoubleSuccess(() => usecase.fetchBenefitsTypes(), () => usecase.fetchBenefits(),
      onSuccess: (data1, data2) {
        benefits = data2 as List<Benefit>;
        emit(DoubleDataSuccess(data1: data1, data2: benefits));
      }
    );
  }

}
