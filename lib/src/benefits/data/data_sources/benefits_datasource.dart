import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/network/api_response.dart';
import '../../../../../core/utils/constants.dart';
import '../models/benefit_dto.dart';
import '../models/benefit_type_dto.dart';

part 'benefits_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  BenefitsDatasource{

  @factoryMethod
  factory BenefitsDatasource(Dio dio) = _BenefitsDatasource;

  @GET('/threads')
  Future<ApiResponse<List<BenefitTypeDto>>> fetchBenefitsTypes();

  @GET('/benefits')
  Future<ApiResponse<List<BenefitDto>>> fetchBenefits();

}