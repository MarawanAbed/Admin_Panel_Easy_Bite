import 'package:flutter/material.dart';
import 'package:admin/core/extensions/extensions.dart';
import 'package:admin/core/widgets/buttons/primary_button.dart';

class RowButtons extends StatelessWidget {
  final String? title1;
  final String? title2;
  final Function()? onPressed1;
  final Function()? onPressed2;
  final EdgeInsetsGeometry? margin;

  const RowButtons(
      {Key? key,
      this.title1,
      this.title2,
      this.onPressed1,
      this.onPressed2,
      this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Row(
        children: [
          PrimaryButton(
            title: title1,
            height: 40,
            backgroundColor: theme.colorScheme.primaryContainer,
            radius: 15,
            onPressed: onPressed1,
            width: 200,
          ),
          10.pw,
          PrimaryButton(
            title: title2,
            height: 40,
            backgroundColor: theme.colorScheme.errorContainer,
            radius: 15,
            onPressed: onPressed2,
            width: 200,
            ),
        ],
      ),
    );
  }
}
