import 'package:flutter/material.dart';

import 'app_icon.dart';

class PrimaryIconButton extends StatelessWidget {
  final String? title;
  final TextStyle? titleStyle;
  final Function()? onPressed;
  final double? height;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final String icon;
  final Color? iconColor;
  final Decoration? decoration;
  final EdgeInsetsGeometry? padding;
  const PrimaryIconButton(
      {Key? key,
      this.title,
      this.onPressed,
      this.height,
      this.backgroundColor,
      this.borderRadius,
      required this.icon,
      this.iconColor,
      this.titleStyle,
      this.decoration,
      this.padding
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: decoration ?? BoxDecoration(color: backgroundColor ?? theme.primaryColor),
      child: InkWell(
        onTap: onPressed,
        radius: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 10,
                child: Text(title!,
                    style: titleStyle ?? theme.textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                )),
            Expanded(
                flex: 1,
                child: AppIcon(icon: icon, color: iconColor ?? theme.primaryColor, size: 25)),
          ],
        ),
      ),
    );
  }
}
