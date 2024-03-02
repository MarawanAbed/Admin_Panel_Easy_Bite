import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/dark_theme.dart';
import '../../../../core/theme/light_theme.dart';

class ThemeState {
  final ThemeData themeData;

  ThemeState(this.themeData);

  static ThemeState get darkThemeData =>
      ThemeState(darkTheme);

  static ThemeState get lightThemeData =>
      ThemeState(lightTheme);


  static bool isDarkTheme(ThemeData themeData) =>
      themeData == darkTheme;
}