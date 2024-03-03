import 'package:admin/src/profile/data/models/profile_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/network/api_response.dart';
import '../../../../../core/utils/constants.dart';
import '../models/benefit_dto.dart';
import '../models/benefit_type_dto.dart';
import '../models/create_user_params.dart';

part 'users_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  UsersDatasource{

  @factoryMethod
  factory UsersDatasource(Dio dio) = _UsersDatasource;

  @GET('/users/register')
  Future<ProfileDto> createUser(@Body() CreateUserParams params);

  @GET('/users/update/{id}')
  Future<ProfileDto> updateUser(@Path('id') id, @Body() CreateUserParams params);

  @GET('/users')
  Future<List<ProfileDto>> fetchUsers();

  @GET('/users/update/{id}')
  Future<ProfileDto> deleteUser(@Path('id') id);

}