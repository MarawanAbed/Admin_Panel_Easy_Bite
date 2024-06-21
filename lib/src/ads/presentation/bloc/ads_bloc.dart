import 'package:admin/src/profile/data/models/profile_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/use_cases/ads_usecase.dart';

@Injectable()
class AdsCubit extends BaseCubit {
  final AdsUseCase usecase;

  AdsCubit(this.usecase);

  void fetchInitialData() async {
    executeSuccess(() => usecase.fetchAds());
    // emit(DataSuccess<List<ProfileDto>>([
    //   ProfileDto(
    //     id: '1',
    //     userName: "John Doe",
    //     email: "johnm@.cvp",
    //   ),
    // ]));
  }

  void createUser(params) async {
    executeEmitterListener(() => usecase.createAd(params));
  }

  void deleteUser(id) async {
    executeEmitterListener(() => usecase.deleteUser(id));
  }

  void updateUser(params) async {
    executeEmitterListener(() => usecase.updateUser(params));
  }



}
