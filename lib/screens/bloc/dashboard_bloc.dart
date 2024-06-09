import 'package:admin/core/commen/common_state.dart';
import 'package:admin/screens/dashboard/components/my_fields.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../data/data_sources/dashboard_datasource.dart';
import '../data/models/order_dto.dart';
import '../data/models/order_statistics.dart';

@Injectable()
class DashboardCubit extends BaseCubit {
  final DashboardDatasource api;

  DashboardCubit(this.api);

  StreamStateInitial<OrderStatistics?> ordersStatistics = StreamStateInitial();
  StreamStateInitial<List<OrderDto>?> orders = StreamStateInitial();

  Future<void> fetchOrdersStatistics() async {
    ordersStatistics.setData(null);
    try {
     final data = await api.ordersStatistics();
      ordersStatistics.setData(data);
    } catch (e) {
      ordersStatistics.setError(e.toString());
    }
  }

  Future<void> fetchOrders() async {
    orders.setData(null);
    try {
     final data = await api.fetchEmployees();
      orders.setData(data);
    } catch (e) {
      orders.setError(e.toString());
    }
  }
}
