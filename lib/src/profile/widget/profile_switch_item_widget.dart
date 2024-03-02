import 'package:flutter/material.dart';

import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/colors_manager.dart';
import '../../../core/utils/screen_sizer.dart';
import '../../main_index.dart';

class ProfileSwitchItemWidget extends StatelessWidget {
  final void Function(bool)? onChanged;
  const ProfileSwitchItemWidget({
    Key? key,
    required this.title,
    required this.hint,
    required this.icon,
    required this.switchValue,
    this.onChanged,
  }) : super(key: key);
  final String title;
  final String hint;
  final String icon;
  final bool switchValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppIcon(
          icon: icon,
          color: icon == AssetsManager.logOutSVG
              ? ColorsManager.redColor
              : ColorsManager.brownColor,
        ),
        10.pw,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.bodyMedium,
              ),
              Text(
                hint,
                style: context.displaySmall.copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
        Container(
          height: 22,
          width: 40,
          decoration: BoxDecoration(
              color: switchValue == true
                  ? ColorsManager.brownColor
                  : ColorsManager.greyColor848E9A,
              borderRadius: BorderRadius.circular(ScreenSizer.borderRadius28)),
          child: Switch(
              activeTrackColor: ColorsManager.brownColor,
              activeColor: ColorsManager.whiteColor,
              inactiveTrackColor: ColorsManager.greyColor848E9A,
              key: Key(icon),
              value: switchValue,
              onChanged: onChanged),
        ),
      ],
    );
  }
}
