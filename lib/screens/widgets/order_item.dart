
import 'package:admin/core/extensions/dimension.dart';
import 'package:admin/core/widgets/buttons/primary_button.dart';
import 'package:admin/src/main_index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class OrderBody extends StatelessWidget {
  const OrderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Orders',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              '11:29 AM',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 50),
        Orders(),
      ],
    );
  }
}

class Orders extends StatelessWidget {
  const Orders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: context.cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Order:351',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Text(
                      'User: Ahmed Mohamed',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                const Text(
                  '11:29 AM',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          const Divider(
            color: Colors.grey,
          ),
          SizedBox(
            height: 10.h,
          ),
          const Males(
            quantity: '1',
            name: 'Chicken Shawarma',
          ),
          SizedBox(
            height: 10.h,
          ),
          const Males(
            quantity: '1',
            name: 'Chicken Shawarma',
          ),
          SizedBox(
            height: 10.h,
          ),
          const Males(
            quantity: '1',
            name: 'Chicken Shawarma',
          ),
          SizedBox(
            height: 10.h,
          ),
          const Males(
            quantity: '1',
            name: 'Chicken Shawarma',
          ),
          SizedBox(
            height: 20.h,
          ),
          Spacer(),
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