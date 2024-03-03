import 'package:admin/core/utils/helper_methods.dart';
import 'package:injectable/injectable.dart';

import '../../../profile/data/models/profile_dto.dart';
import '../../data/models/login_params.dart';
import '../../data/models/register_params.dart';
import '../../data/models/showroom_login_params.dart';
import '../repositories/base_auth_repo.dart';

@Injectable()
class AuthUseCase {
  final BaseAuthRepo repository ;
  AuthUseCase(this.repository);

  Future<ProfileDto> loginAsUser(LoginParams params) async {
    final data = await repository.loginAsUser(params);
    await HelperMethods.saveProfile(data);
    return data;
  }

  Future<ProfileDto> loginAsShowroom(ShowroomLoginParams params) async{
    final data = await  repository.loginAsShowroom(params);
    await HelperMethods.saveProfile(data);
    return data;
  }

  Future<ProfileDto> register(RegisterParams params) async{
    final data = await  repository.register(params);
    await HelperMethods.saveProfile(data);
    return data;
  }

}