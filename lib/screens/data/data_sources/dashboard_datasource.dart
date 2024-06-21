import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/utils/constants.dart';
import '../models/order_dto.dart';
import '../models/order_statistics.dart';

part 'dashboard_datasource.g.dart';

@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  DashboardDatasource{

  @factoryMethod
  factory DashboardDatasource(Dio dio) = _DashboardDatasource;

  @GET('/orders/statistics')
  Future<OrderStatistics> ordersStatistics();

  @GET('/orders')
  Future<List<OrderDto>> fetchEmployees();

}