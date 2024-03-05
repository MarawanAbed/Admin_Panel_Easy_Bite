
import 'package:flutter/material.dart';
import 'package:admin/core/extensions/extensions.dart';

class PrimaryButton extends StatelessWidget {
  final String? title;
  final Function()? onPressed;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final double? elevation;
  final double? radius;
  final EdgeInsetsGeometry? margin;
  final TextStyle? style;
  final double? fontSize;
  final bool isLoading;
  const PrimaryButton({Key? key, this.title, this.onPressed, this.height = 55, this.backgroundColor, this.borderRadius, this.elevation, this.radius, this.margin, this.style, this.fontSize, this.isLoading =false, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elevation ?? 0,
          backgroundColor: backgroundColor  ?? context.primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius ??  BorderRadius.all(Radius.circular(radius ?? 25))
          ),
          fixedSize: Size(width ?? MediaQuery.of(context).size.width, height!),
        ),
        child: !isLoading ? Text(title!, style: style ?? context.labelLarge) : const CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}
