import 'package:flutter/material.dart';
import 'package:admin/core/widgets/buttons/app_icon.dart';
import 'package:admin/src/main_index.dart';

import '../../../core/components/base_stateless_widget.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/colors_manager.dart';
import '../../../core/utils/font_sizer.dart';
import '../../../core/utils/font_weight_manager.dart';

class ProfileItemWidget extends BaseStatelessWidget {
   ProfileItemWidget({
    Key? key,
    required this.title,
     this.hint,
    required this.icon,
    required this.function,
  }) : super(key: key);
  final String title;
  final String? hint;
  final String icon;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        width: double.infinity,
        color: Colors.white,
        padding: 5.paddingAll,
        child: Row(
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
                    style: headlineLarge.copyWith(
                        fontSize: 16),
                  ),
               5.ph,
               if(hint!=null)
                    Text(
                    hint!,
                    style: displayMedium.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
            const RotatedBox(
              quarterTurns: 2,
              child: AppIcon(
                icon: AssetsManager.arrowSVG,
                color: ColorsManager.brownColor,
              ),
            ),
            10.pw,
          ],
        ),
      ),
    );
  }
}
