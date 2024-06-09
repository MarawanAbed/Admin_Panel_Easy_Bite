import 'package:admin/models/MyFiles.dart';
import 'package:admin/responsive.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'file_info_card.dart';

class OrdersStatistics extends StatelessWidget {
  const OrdersStatistics({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoMyFiles.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        mainAxisExtent: 110,
      ),
      itemBuilder: (context, index) => FileInfoCard(info: demoMyFiles[index]),
    );
  }
}


