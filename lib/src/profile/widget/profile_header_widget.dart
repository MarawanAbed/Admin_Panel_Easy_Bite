import 'package:flutter/material.dart';
import 'package:admin/src/main_index.dart';

import '../../../core/utils/helper_methods.dart';
import '../../../core/widgets/images/image_network.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: HelperMethods.getProfile(),
        builder: (context, profile) {
          // print('profile.data?.image ${profile.data?.image}');
          return profile.connectionState == ConnectionState.waiting
              ? const SizedBox.shrink()
              :
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: context.primaryColor),
            margin: 20.paddingBottom,
            accountName: Text(
              profile.data?.name ?? '',
              style: context.labelLarge,
            ),
            accountEmail: const SizedBox.shrink(),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.account_circle_rounded,
                size: 70,
                color: context.primaryColor,
              ),
            ),
          );
        }
    );
  }
}
