
import 'package:injectable/injectable.dart';
import 'package:admin/src/auth/data/models/login_params.dart';

import '../../../profile/data/models/profile_dto.dart';
import '../../domain/repositories/base_auth_repo.dart';
import '../data_sources/auth_datasource.dart';
import '../models/register_params.dart';
import '../models/showroom_login_params.dart';

@Injectable(as: BaseAuthRepo)
class AuthRepo extends BaseAuthRepo{
  final AuthDataSource  apiProvider;
  AuthRepo(this.apiProvider);

  @override
  Future<ProfileDto> loginAsUser(LoginParams params) async{
    final response = await apiProvider.loginAsUser(params);
    return response;
  }

  @override
  Future<ProfileDto> loginAsShowroom(ShowroomLoginParams params) async{
    final response = await apiProvider.loginAsShowroom(params);
    return response.data!;
  }

  @override
  Future<ProfileDto> register(RegisterParams params) async{
    final response = await apiProvider.register(params);
    return response.data!;
  }

}