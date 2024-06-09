import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:admin/core/utils/colors_manager.dart';

const Color primaryColor = Color(0xffFF8303);
const Color lighterDarkColor = Color(0xff69452E);
const secondaryColor = Color(0xff0083DA);
const Color kGreyColor = Color(0xff818185);
const String fontBold = 'Cairo-Bold';
const String fontMedium = 'Cairo-Medium';
const String fontRegular = 'Cairo-Regular';
const Color kWhite = Color(0xffFFFFFF);


final lightTheme = ThemeData(
  primaryColor: primaryColor,
  brightness: Brightness.light,
  primaryColorDark: const Color(0xff191919),
  scaffoldBackgroundColor: const Color(0xffF3EDE2),
  hintColor: const Color(0xffF7F6F6),
  cardColor: kWhite,
  // iconTheme: const IconThemeData(
  //   color: kYellowColor,
  // ),
  dialogTheme: const DialogTheme(
    backgroundColor: kWhite,
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontFamily: fontBold,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
  ),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.all(primaryColor),
  ),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.green,
    //   primaryColorDark: const Color(0xFF232323),
    backgroundColor: secondaryColor,
    accentColor: const Color(0xff494949),
    errorColor: const Color(0xffF67D31),
  ).copyWith(
    secondaryContainer: const Color(0xff06bd3d),
    onSecondary: const Color(0xffF67D31),
    secondary: secondaryColor,
    outline: const Color(0xff818185),
  ),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: primaryColor,
      statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: primaryColor,
    ),
    color: kWhite,
    elevation: 0,
    foregroundColor: Color(0xffF9F0E1),
    titleTextStyle: TextStyle(
      fontSize: 16,
      fontFamily: fontBold,
      fontWeight: FontWeight.w700,
      color: primaryColor,
    ),
  //  backgroundColor: secondaryColor,
    centerTitle: true,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
     fillColor: Color(0xffEBDFCF),

    hintStyle: TextStyle(
      fontSize: 14,
      fontFamily: 'Cairo-Regular',
    ),
  ),
  textButtonTheme: TextButtonThemeData(

    style: TextButton.styleFrom(
    //  primary: primaryColor,
      textStyle: const TextStyle(
        fontSize: 16,
        fontFamily: fontBold,
        fontWeight: FontWeight.w700,
      ),
    ),
  ),
  fontFamily: fontBold,
  textTheme:  const TextTheme(
    titleLarge: TextStyle(
      fontSize: 32,
      fontFamily: fontBold,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    titleMedium: TextStyle(
      fontSize: 22,
      fontFamily: fontBold,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    titleSmall: TextStyle(
      fontSize: 20.0,
      color: Colors.black,
      fontFamily: fontRegular,
      fontWeight: FontWeight.w400,
    ),

    bodyLarge: TextStyle(
      fontSize: 16.0,
      color: Colors.black,
      fontFamily: fontBold,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      color: Colors.black,
      fontFamily: fontMedium,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      fontSize: 12.0,
      color: Colors.black,
      fontFamily: fontRegular,
      fontWeight: FontWeight.w400,
    ),
    displayLarge: TextStyle(
      fontSize: 18.0,
      color: kGreyColor,
      fontFamily: fontBold,
      fontWeight: FontWeight.w600,
    ),
    displayMedium: TextStyle(
      fontSize: 16.0,
      color: kGreyColor,
      fontFamily: fontMedium,
      fontWeight: FontWeight.w500,
    ),
    displaySmall: TextStyle(
      fontSize: 14.0,
      color: kGreyColor,
      fontFamily: fontRegular,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      fontSize: 16.0,
      color: Colors.white,
      fontFamily: fontBold,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: TextStyle(
      fontSize: 14.0,
      color: Colors.white,
      fontFamily: fontMedium,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      fontSize: 12.0,
      color: Colors.white,
      fontFamily: fontRegular,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.0,
      wordSpacing: 0.0,
    ),
    headlineSmall: TextStyle(
      fontSize: 14.0,
      color: primaryColor,
      fontFamily: fontRegular,
      fontWeight: FontWeight.w400,
    ),
    headlineMedium: TextStyle(
      fontSize: 16.0,
      color: primaryColor,
      fontFamily: fontMedium,
      fontWeight: FontWeight.w500,
    ),
    headlineLarge: TextStyle(
      fontSize: 18.0,
      color: primaryColor,
      fontFamily: fontBold,
      fontWeight: FontWeight.w600,
    ),

  ),
);