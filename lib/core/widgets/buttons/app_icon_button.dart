import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:admin/core/extensions/extensions.dart';
import 'package:admin/core/routes/navigator.dart';

class AppIconButton extends StatelessWidget {
  final String icon;
  final VoidCallback? onPressed;
  final String? route;
  final dynamic arguments;
  final double? size;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  const AppIconButton({Key? key, required this.icon,  this.onPressed, this.size, this.color, this.padding, this.route, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: InkWell(
        onTap: onPressed ?? () => pushNamed(route!, arguments: arguments),
        borderRadius: BorderRadius.circular(500),
        // overlayColor: MaterialStateProperty.all(Colors.red  ),
        // hoverColor: Colors.red,
        // splashColor: Colors.red,
        // highlightColor: Colors.red,
        // focusColor: Colors.red,

        child: Padding(
          padding: 5.paddingAll + 2.paddingEnd,
          child: SvgPicture.asset(
            icon,
            height: size ?? 18,
            width: size ?? 18,
            color: color,
          ),
        )
      ),
    );
  }
}
