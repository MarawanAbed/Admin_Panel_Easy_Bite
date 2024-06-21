import 'package:admin/screens/dashboard/components/my_fields.dart';
import 'package:admin/src/main_index.dart';

import '../../../../constants.dart';
import '../../../../screens/data/models/order_dto.dart';
import '../../../../screens/data/models/order_statistics.dart';
import '../../../../screens/dashboard/components/header.dart';

import '../../../../screens/dashboard/components/recent_files.dart';

class DashboardScreen extends StatelessWidget {
  final StreamStateInitial<OrderStatistics?> ordersStatistics;
  final StreamStateInitial<List<OrderDto>?> orders;
  final void Function(String)? onChanged;

  const DashboardScreen(
      {super.key,
      required this.ordersStatistics,
      required this.orders,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(),
            const SizedBox(height: defaultPadding),
            OrdersStatistics(
              ordersStatistics: ordersStatistics,
            ),
            const SizedBox(height: defaultPadding),
            Expanded(
              child: RecentOrders(
                orders: orders,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
