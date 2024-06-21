import 'package:admin/models/RecentFile.dart';
import 'package:admin/src/main_index.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../data/models/order_dto.dart';
import '../../widgets/order_item.dart';
import 'header.dart';

class RecentOrders extends StatelessWidget {
  final StreamStateInitial<List<OrderDto>?> orders;
  final void Function(String)? onChanged;
  const RecentOrders({
    Key? key,
    required this.orders,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recent Orders",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 5),
        SearchField(
          onChanged: onChanged,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: StreamBuilder<List<OrderDto>?>(
              stream: orders.stream,
              builder: (context, snapshot) {
                return GridView.builder(
                  itemCount: snapshot.data?.length ?? 0,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 360,
                    crossAxisSpacing: defaultPadding,
                    mainAxisSpacing: defaultPadding,
                    // mainAxisExtent: 350,
                  ),
                  itemBuilder: (context, index) =>
                      Orders(
                        order: snapshot.data![index],
                        index: (snapshot.data!.length - index),
                      ),
                );
              }
          ),
        ),
      ],
    );
  }
}

DataRow recentFileDataRow(RecentFile fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              fileInfo.icon!,
              height: 30,
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(fileInfo.title!),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.date!)),
      DataCell(Text(fileInfo.size!)),
    ],
  );
}
