import 'package:flutter/material.dart';


extension ColorsExtension on BuildContext {
  // get mode if dark or light
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  Color get gray_f8 => isDarkMode ? const Color(0xffF8F8F8) : const Color(0xffF8F8F8);

  Color get gray_fb => isDarkMode ? const Color(0xffFBFBFB) : const Color(0xffFBFBFB);

  Color get gray_ac => isDarkMode ? const Color(0xff5C5C5C) : const Color(0xffACACAC);

  Color get gray_80 => isDarkMode ? const Color(0xff404040) : const Color(0xff808080);

  Color get gray_5c => isDarkMode ? const Color(0xffE0E0E0) : const Color(0xffE0E0E0);

  Color get gray_68 => isDarkMode ? const Color(0xff686868) : const Color(0xff686868);

  Color get gray_87 => isDarkMode ? const Color(0xff878787) : const Color(0xff878787);

  Color get blue_3F => isDarkMode ? const Color(0xff03173F) : const Color(0xff03173F);

  Color get gray_F6 => isDarkMode ? const Color(0xffF6F6F6) : const Color(0xffF6F6F6);

  Color get gray_E2 => isDarkMode ? const Color(0xffE2E2E2) : const Color(0xffE2E2E2);

  Color get gray_ec => isDarkMode ? const Color(0xFFECECEC) : const Color(0xFFECECEC);

  Color get gray_7C => isDarkMode ? const Color(0xFF7C7C7C) : const Color(0xFF7C7C7C);

  Color get gray_96 => isDarkMode ? const Color(0xFF969696) : const Color(0xFF969696);

  Color get yellow_00 => isDarkMode ? const Color(0xFFFEA500) : const Color(0xFFFEA500);

  Color get yellow_03 => isDarkMode ? const Color(0xFFFCD503) : const Color(0xFFFCD503);

  Color get gray_A7 => isDarkMode ? const Color(0xffA7A7A7) : const Color(0xffA7A7A7);

  Color get gray_65 => isDarkMode ? const Color(0xff656565) : const Color(0xff656565);

  Color get gray_E1 => isDarkMode ? const Color(0xFFE1E1E1) : const Color(0xFFE1E1E1);
}
