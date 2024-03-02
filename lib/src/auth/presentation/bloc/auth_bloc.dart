import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../data/models/login_params.dart';
import '../../data/models/register_params.dart';
import '../../data/models/showroom_login_params.dart';
import '../../domain/use_cases/auth_usecase.dart';

@Injectable()
class AuthCubit extends BaseCubit {
  final AuthUseCase usecase;

  AuthCubit(this.usecase);

  void login(LoginParams params)  {
    executeEmitterSuccess(() => usecase.loginAsUser(params));
  }


  void showRoomLogin(ShowroomLoginParams params)  {
    // executeEmitterSuccess(() => usecase.loginAsShowroom(params));
  }

  void register(RegisterParams params)  {
    executeEmitterSuccess(() => usecase.register(params));
  }

  void fetchCities() {
    // executeSuccessNotLoading(() => sellCarUseCase.fetchCities());
  }


}
