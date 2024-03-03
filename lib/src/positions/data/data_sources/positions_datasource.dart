import 'package:admin/src/profile/data/models/profile_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/utils/constants.dart';
import '../models/create_user_params.dart';

part 'positions_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  PositionsDatasource{

  @factoryMethod
  factory PositionsDatasource(Dio dio) = _PositionsDatasource;

  @GET('/positions/create')
  Future<ProfileDto> createPosition(@Body() CreateUserParams params);

  @GET('/positions/update/{id}')
  Future<ProfileDto> updatePosition(@Path('id') id, @Body() CreateUserParams params);

  @GET('/positions')
  Future<List<ProfileDto>> fetchPositions();

  @GET('/positions/update/{id}')
  Future<ProfileDto> deletePosition(@Path('id') id);

}