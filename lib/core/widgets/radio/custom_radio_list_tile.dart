import 'package:flutter/material.dart';
import 'package:admin/core/extensions/extensions.dart';

class CustomRadioListTile extends StatelessWidget {
  final String value;
  final String title;
  final String groupValue;
  final Function(String?) onChanged;
  const CustomRadioListTile(
      {Key? key,
      required this.value,
      required this.title,
      required this.groupValue,
      required this.onChanged})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          activeColor: context.primaryColor,
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        FittedBox(child: Text(title, style: context.bodyMedium)),
      ],
    );
  }
}
