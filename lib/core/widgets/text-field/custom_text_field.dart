import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:admin/core/extensions/extensions.dart';

import '../buttons/app_icon.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final bool isPassword;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final InputDecoration? inputDecoration;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final TextAlign? textAlign;
  final Widget? prefixIcon;
  final String? iconPath;
  final Widget? suffixIcon;
  final int? maxLines;
  final Color? colorBorderSide;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? contentPadding;
  final double? radius;
  final bool? isValidator;
  final double maxHeight;
  final List<TextInputFormatter>? inputFormatters;
   const CustomTextField({Key? key, this.controller, this.hintText, this.labelText, this.isPassword = false, this.onTap, this.onChanged, this.validator, this.inputDecoration, this.keyboardType, this.fillColor, this.hintStyle, this.textAlign, this.prefixIcon, this.maxLines, this.colorBorderSide, this.margin, this.contentPadding, this.suffixIcon, this.radius, this.iconPath, this.isValidator = true, this.maxHeight = 500, this.inputFormatters}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // if
    Color borderColor = colorBorderSide ?? context.theme.inputDecorationTheme.fillColor ?? context.theme.primaryColor;
    return Padding(
      padding: margin ?? 12.paddingBottom,
      child: TextFormField(
        onTap: onTap,
        readOnly: onTap != null,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textAlign: textAlign ?? TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        maxLines: maxLines ?? 1,
        keyboardType: isPassword ? TextInputType.visiblePassword : keyboardType,
        style: context.bodySmall.copyWith(fontSize: 16),
        obscureText: isPassword,
        controller: controller,
        textInputAction: TextInputAction.next,
        cursorColor: context.primaryColor,
        inputFormatters: inputFormatters,
        cursorOpacityAnimates: true,
        decoration: inputDecoration ?? InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle ?? context.displaySmall.copyWith(fontSize: 14),
          fillColor: fillColor ?? context.theme.inputDecorationTheme.fillColor,
          filled: true,
          prefixIconConstraints: BoxConstraints(
            minWidth: 35,
            minHeight: 35,
          ),
          constraints: BoxConstraints(
            minHeight: 35,
            maxHeight: maxHeight,
          ),
          prefixIcon:  iconPath != null ? AppIcon(
            padding: const EdgeInsets.all(8),
            icon: iconPath!,  size: 20,) : prefixIcon,
          suffixIcon: suffixIcon,
          contentPadding: 16.paddingHoriz + 0.paddingTop,
          border:  OutlineInputBorder(
            borderRadius:  BorderRadius.all(Radius.circular(radius ?? 12)),
            borderSide: BorderSide(color: borderColor),
          ),
          focusedBorder:  OutlineInputBorder(
            borderRadius:  BorderRadius.all(Radius.circular(radius ?? 12)),
            borderSide: BorderSide(color: borderColor),
          ),

          enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 12)),
            borderSide: BorderSide(color: borderColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 12)),
            borderSide: BorderSide(color: context.errorColor),
          ),
        ),
        validator: (isValidator! &&  validator == null) ? (value) {
          if (value == null || value.isEmpty) {
            return 'هذا الحقل مطلوب';
          }
          return null;
        } : validator,
        onChanged: onChanged,
      ),
    );
  }
}
