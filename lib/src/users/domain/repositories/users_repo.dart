
import '../../../profile/data/models/profile_dto.dart';
import '../../data/models/create_user_params.dart';

abstract class UsersRepo {
  Future<ProfileDto> createUser(CreateUserParams params);
  Future<ProfileDto> updateUser(CreateUserParams params);
  Future<List<ProfileDto>> fetchUsers();
  Future<ProfileDto> deleteUser(id);
}
