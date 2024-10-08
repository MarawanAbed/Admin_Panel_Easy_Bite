import 'package:admin/src/profile/data/models/profile_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:admin/core/utils/constants.dart';
import 'package:admin/src/auth/data/models/login_params.dart';
import 'package:admin/core/network/api_response.dart';

import '../models/register_params.dart';
import '../models/showroom_login_params.dart';

part 'auth_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  AuthDataSource{

  @factoryMethod
  factory AuthDataSource(Dio dio) = _AuthDataSource;

  @POST('/users/login')
  Future<ProfileDto> loginAsUser(@Body() LoginParams params);

  @POST('/showroom/login')
  Future<ApiResponse<ProfileDto>> loginAsShowroom(@Body() ShowroomLoginParams params);

  @POST('/register')
  Future<ApiResponse<ProfileDto>> register(@Body() RegisterParams params);

}