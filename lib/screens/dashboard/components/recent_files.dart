import 'package:admin/models/RecentFile.dart';
import 'package:admin/src/main_index.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../widgets/order_item.dart';
import 'header.dart';

class RecentOrders extends StatelessWidget {
  const RecentOrders({
    Key? key,
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
        const SearchField(),
        const SizedBox(height: 10),
        Expanded(
          child: GridView.builder(
            itemCount: 5,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 360,
              crossAxisSpacing: defaultPadding,
              mainAxisSpacing: defaultPadding,
              mainAxisExtent: 310,
            ),
            itemBuilder: (context, index) =>
                Orders(),
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
