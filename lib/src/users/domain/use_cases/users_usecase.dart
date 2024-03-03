import 'package:admin/src/profile/data/models/profile_dto.dart';
import 'package:injectable/injectable.dart';

import '../../data/data_sources/users_datasource.dart';
import '../../data/models/create_user_params.dart';

@Injectable()
class UsersUseCase {
  final UsersDatasource  apiProvider;
  UsersUseCase(this.apiProvider);

  Future<List<ProfileDto>> fetchUsers() async {
    return  await apiProvider.fetchUsers();
  }

  Future<ProfileDto> createUser(CreateUserParams params) async {
    return  await apiProvider.createUser(params);
  }

  Future<ProfileDto> deleteUser(id) async {
    return  await apiProvider.deleteUser(id);
  }

  Future<ProfileDto> updateUser(CreateUserParams params) async {
    return  await apiProvider.updateUser(params.id, params);
  }


}