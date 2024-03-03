import 'package:admin/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../components/base_stateless_widget.dart';

///  Created by harbey on 7/11/2023.
class CustomRadioList extends BaseStatelessWidget {
  final String value;
  final String groupValue;
  final void Function(String?)? onChanged;
  final String title;
  final TextStyle? titleStyle;
  final String? subTitle;
  final TextStyle? subTitleStyle;
  final Color? color;
  final Widget? textWidget;

   CustomRadioList({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
    this.titleStyle,
    this.subTitle,
    this.subTitleStyle,
    this.color,
    this.textWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 5.paddingBottom,
      child: Column(
        children: [
          Row(
            crossAxisAlignment:  CrossAxisAlignment.center,
            children: [
              Radio(
                value: value,
                groupValue: groupValue,
                visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                onChanged: onChanged,
              ),
              SizedBox(width: 10),
              textWidget ?? Expanded(child: Text(
                title,
                style: titleStyle ?? labelMedium.copyWith(fontSize: 14),
              ),),
            ],
          ),
          if (subTitle != null && subTitle!.isNotEmpty) Flexible(
            child: Padding(
              padding: 30.paddingStart,
              child: Text(
                subTitle!,
                style: subTitleStyle ?? labelMedium.copyWith(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
