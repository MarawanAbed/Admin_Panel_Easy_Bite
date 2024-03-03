import 'package:injectable/injectable.dart';

import '../../../profile/data/models/profile_dto.dart';
import '../../domain/repositories/users_repo.dart';
import '../data_sources/users_datasource.dart';
import '../models/create_user_params.dart';

@Injectable(as: UsersRepo)
class UsersRepoImp extends UsersRepo{
  final UsersDatasource  apiProvider;
  UsersRepoImp(this.apiProvider);

  @override
  Future<List<ProfileDto>> fetchUsers() async {
    return  await apiProvider.fetchUsers();
  }

  @override
  Future<ProfileDto> createUser(CreateUserParams params) async {
    return  await apiProvider.createUser(params);
  }

  @override
  Future<ProfileDto> deleteUser(id) async {
    return  await apiProvider.deleteUser(id);
  }

  @override
  Future<ProfileDto> updateUser(CreateUserParams params) async {
    return  await apiProvider.updateUser(params.id, params);
  }


}