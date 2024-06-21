import 'package:admin/core/extensions/dimension.dart';
import 'package:admin/core/widgets/buttons/primary_button.dart';
import 'package:admin/src/main_index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';
import '../data/models/order_dto.dart';

class Orders extends StatelessWidget {
  final OrderDto order;
  final int index;

  const Orders({
    super.key,
    required this.order,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    String date = order.createdAt ?? '';
    String currentFormat = DateFormat('yyyy-MM-dd').format(DateTime.parse(date));
    String newFormat = DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.parse(currentFormat));
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: context.cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order: $index',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'User: ${order.user?.userName ?? ''}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Text(
                  newFormat,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          const Divider(
            color: Colors.grey,
          ),
          Column(
            children: order.items
                    ?.map((e) => Column(
                          children: [
                            Males(
                              quantity: e.quantity.toString() ?? '',
                              name: e.item?.itemName ?? '',
                            ),
                          ],
                        ))
                    .toList() ??
                [],
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: const RoundedRectangleBorder(),
              ),
              onPressed: () {},
              child: const Text(
                'Print',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Males extends StatelessWidget {
  const Males({
    super.key,
    required this.quantity,
    required this.name,
  });

  final String quantity;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${quantity}x',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
