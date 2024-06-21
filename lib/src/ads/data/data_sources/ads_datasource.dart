import 'package:admin/src/ads/data/models/ad_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/utils/constants.dart';

part 'ads_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  AdsDatasource{

  @factoryMethod
  factory AdsDatasource(Dio dio) = _AdsDatasource;

  @POST('/ads/create')
  Future createAd(@Body() AdDto params);

  @PUT('/ads/update/{id}')
  Future updateAd(@Path('id') id, @Body() AdDto params);

  @GET('/ads')
  Future<List<AdDto>> fetchAds();

  @DELETE('/ads/delete/{id}')
  Future deleteAd(@Path('id') id);

}