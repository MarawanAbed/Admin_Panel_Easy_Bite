import 'package:admin/src/profile/data/models/profile_dto.dart';
import 'package:injectable/injectable.dart';

import '../../data/data_sources/positions_datasource.dart';
import '../../data/models/position_dto.dart';

@Injectable()
class PositionsUseCase {
  final PositionsDatasource  apiProvider;
  PositionsUseCase(this.apiProvider);

  Future<List<PositionDto>> fetchPositions() async {
    return  await apiProvider.fetchPositions();
  }

  Future<ProfileDto> createPosition(PositionDto params) async {
    return  await apiProvider.createPosition(params);
  }

  Future<String> deleteUser(id) async {
    return  await apiProvider.deletePosition(id);
  }

  Future<PositionDto> updatePosition(PositionDto params) async {
    return  await apiProvider.updatePosition(params.id, params);
  }


}