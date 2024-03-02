
import 'package:flutter/material.dart';

class LabelButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const LabelButton({
    Key? key,
    required this.title,
    this.onTap,
    this.color,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
