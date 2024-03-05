import 'package:flutter/gestures.dart';

import 'package:admin/src/main_index.dart';


class CustomRichText extends StatelessWidget {
  final String label;
  final String value;
  final TextAlign textAlign;
  final TextStyle? labelStyle;
  final Color? labelColor;
  final Color? valueColor;
  final TextStyle? valueStyle;
  final Function()? valueOnTap;

  const CustomRichText({
    Key? key,
    required this.label,
    required this.value,
    this.textAlign = TextAlign.center,
    this.labelStyle,
    this.valueStyle,
    this.labelColor,
    this.valueColor,
    this.valueOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        children: [
          TextSpan(
            text: '$label: ',
            style: labelStyle ??
                context.textTheme.displaySmall!.copyWith(
                  color: labelColor,
                ),
          ),
          TextSpan(
            text: value,
            style: valueStyle ??
                context.textTheme.labelMedium!.copyWith(
                  color: valueColor ?? Colors.black,
                ),
            recognizer: TapGestureRecognizer()..onTap = valueOnTap,
          ),
        ],
      ),
    );
  }
}
