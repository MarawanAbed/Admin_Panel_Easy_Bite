import 'package:admin/src/profile/data/models/profile_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/utils/constants.dart';
import '../models/position_dto.dart';

part 'positions_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  PositionsDatasource{

  @factoryMethod
  factory PositionsDatasource(Dio dio) = _PositionsDatasource;

  @POST('/positions/create')
  Future<ProfileDto> createPosition(@Body() PositionDto params);

  @PUT('/positions/update/{id}')
  Future<PositionDto> updatePosition(@Path('id') id, @Body() PositionDto params);

  @GET('/positions')
  Future<List<PositionDto>> fetchPositions();

  @DELETE('/positions/update/{id}')
  Future<String> deletePosition(@Path('id') id);

}