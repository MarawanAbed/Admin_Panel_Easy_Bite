import 'package:flutter/material.dart';
import 'package:admin/core/extensions/extensions.dart';

class RowTexts extends StatelessWidget {
  final String title;
  final String value;
  final Color? titleColor;
  final Color? valueColor;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final StrutStyle? titleStrutStyle;
  final StrutStyle? valueStrutStyle;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final bool? isSizedBox;
  final EdgeInsetsGeometry? padding;

  const RowTexts({
    Key? key,
    required this.title,
    required this.value,
    this.titleStyle,
    this.valueStyle,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.titleStrutStyle,
    this.valueStrutStyle,
    this.isSizedBox = true,
    this.padding,
    this.titleColor,
    this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: padding ?? const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: titleStyle ??
                  context.headlineSmall.copyWith(fontSize: 16,
                    color: titleColor,
                  ),
              strutStyle: titleStrutStyle),
          if (isSizedBox!)
            Text(value,
                style: valueStyle ??
                    context.headlineSmall.copyWith(fontSize: 16,
                      color: valueColor,
                    ),
                strutStyle: valueStrutStyle),
        ],
      ),
    );
  }
}
