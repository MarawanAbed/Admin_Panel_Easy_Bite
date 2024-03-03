import 'package:admin/src/profile/data/models/profile_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/utils/constants.dart';
import '../models/create_user_params.dart';

part 'users_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  UsersDatasource{

  @factoryMethod
  factory UsersDatasource(Dio dio) = _UsersDatasource;

  @POST('/users/register')
  Future<ProfileDto> createUser(@Body() CreateUserParams params);

  @PUT('/users/update/{id}')
  Future<ProfileDto> updateUser(@Path('id') id, @Body() CreateUserParams params);

  @GET('/users')
  Future<List<ProfileDto>> fetchUsers();

  @DELETE('/users/update/{id}')
  Future<ProfileDto> deleteUser(@Path('id') id);

}