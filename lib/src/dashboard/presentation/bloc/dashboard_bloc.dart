import 'package:admin/core/commen/common_state.dart';
import 'package:admin/screens/dashboard/components/my_fields.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/bloc/base_cubit.dart';
import '../../../../screens/data/data_sources/dashboard_datasource.dart';
import '../../../../screens/data/models/order_dto.dart';
import '../../../../screens/data/models/order_statistics.dart';

@Injectable()
class DashboardCubit extends BaseCubit {
  final DashboardDatasource api;

  DashboardCubit(this.api);

  StreamStateInitial<OrderStatistics?> ordersStatistics = StreamStateInitial();
  StreamStateInitial<List<OrderDto>?> orders = StreamStateInitial();

  Future<void> loadInitData() async {
    fetchOrdersStatistics();
    fetchOrders();
  }

  Future<void> fetchOrdersStatistics() async {
    ordersStatistics.setData(null);
    try {
      final data = await api.ordersStatistics();
      ordersStatistics.setData(data);
    } catch (e) {
      ordersStatistics.setError(e.toString());
    }
  }

  List<OrderDto> ordersList = [];

  Future<void> fetchOrders() async {
    orders.setData(null);
    try {
      ordersList = await api.fetchEmployees();
      orders.setData(ordersList);
    } catch (e) {
      orders.setError(e.toString());
    }
  }

  void searchOrder(String value) {
    if (value.isEmpty) {
      orders.setData(ordersList);
    } else {
      final ordersSearched = ordersList
          .where((user) =>
              (user.user != null && user.user!.userName!.contains(value)) ||
              (user.items != null &&
                  user.items!.any(
                      (element) => element.item!.itemName!.contains(value))))
          .toList();
      orders.setData(ordersSearched);
    }
  }
}
