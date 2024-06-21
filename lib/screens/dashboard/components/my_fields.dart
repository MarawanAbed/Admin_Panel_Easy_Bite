import 'package:admin/models/MyFiles.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../core/commen/common_state.dart';
import '../../data/models/order_statistics.dart';
import 'file_info_card.dart';

class OrdersStatistics extends StatelessWidget {
  final StreamStateInitial<OrderStatistics?> ordersStatistics;
  const OrdersStatistics({
    super.key,
    required this.ordersStatistics,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<OrderStatistics?>(
      stream: ordersStatistics.stream,
      builder: (context, snapshot) {
        OrderStatistics? orderStatistics = snapshot.data;
        return Wrap(
          spacing: defaultPadding,
          runSpacing: defaultPadding,
          children: [
            FileInfoCard(
              title: 'Today Orders',
              totalOrders: orderStatistics?.today?.totalOrders,
              totalSales: orderStatistics?.today?.totalSales,
            ),
            FileInfoCard(
              title: 'Monthly Orders',
              totalOrders: orderStatistics?.month?.totalOrders,
              totalSales: orderStatistics?.month?.totalSales,
            ),
            FileInfoCard(
              title: 'Yearly Orders',
              totalOrders: orderStatistics?.year?.totalOrders,
              totalSales: orderStatistics?.year?.totalSales,
            ),
          ],
        );
      }
    );
  }
}


