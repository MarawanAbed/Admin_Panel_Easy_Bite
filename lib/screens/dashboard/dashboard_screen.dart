import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/my_fields.dart';
import 'package:admin/src/main_index.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/header.dart';

import 'components/recent_files.dart';
import 'components/storage_details.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),

            OrdersStatistics(),
            SizedBox(height: defaultPadding),
            Expanded(child: RecentOrders()),
          ],
        ),
      ),
    );
  }
}
