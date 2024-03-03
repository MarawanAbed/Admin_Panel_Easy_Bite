import 'package:admin/src/profile/data/models/profile_dto.dart';
import 'package:injectable/injectable.dart';

import '../../data/data_sources/positions_datasource.dart';
import '../../data/models/create_user_params.dart';

@Injectable()
class PositionsUseCase {
  final PositionsDatasource  apiProvider;
  PositionsUseCase(this.apiProvider);

  Future<List<ProfileDto>> fetchUsers() async {
    return  await apiProvider.fetchPositions();
  }

  Future<ProfileDto> createUser(CreateUserParams params) async {
    return  await apiProvider.createPosition(params);
  }

  Future<ProfileDto> deleteUser(id) async {
    return  await apiProvider.deletePosition(id);
  }

  Future<ProfileDto> updateUser(CreateUserParams params) async {
    return  await apiProvider.updatePosition(params.id, params);
  }


}