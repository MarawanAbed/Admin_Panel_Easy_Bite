import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/api_response.dart';
import '../../../../core/utils/constants.dart';
import '../models/about_us_dto.dart';

part 'settings_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  SettingsDatasource{

  @factoryMethod
  factory SettingsDatasource(Dio dio) = _SettingsDatasource;

  @GET('/about-us')
  Future<ApiResponse<List<AboutUsDto>>> fetchAboutUs();

  @GET('/terms')
  Future<ApiResponse<List<AboutUsDto>>> fetchTermsAndConditions();

  // not used
  @GET('/privacy')
  Future<ApiResponse<List<AboutUsDto>>> fetchPrivacy();
}