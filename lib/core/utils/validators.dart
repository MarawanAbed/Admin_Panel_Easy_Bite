// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/services.dart';
//
// class AppValidators{
//   static phoneNumberValidation({required String value}) {
//    // String phonePattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
//   //  RegExp regExp = RegExp(phonePattern);
//     if (value.isEmpty) {
//       return 'برجاء ادخال رقم الهاتف'.tr();
//     }/* else if (!regExp.hasMatch(value) || value.length<6) {
//       return 'رقم هاتف غير صالح'.tr();
//     }*/
//   }
//   static List<TextInputFormatter> phoneFilter=[FilteringTextInputFormatter.digitsOnly,];
//
//
//   static List<TextInputFormatter> userFullNameFilter=[
//     FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]+')),
//   ];
//
//
//   static userNameValidation({required String value}) {
//     String namePattern = '[a-zA-Z ]+';
//     RegExp regExp = RegExp(namePattern);
//     if (value.isEmpty) {
//       return 'Please enter your full name'.tr();
//     }else if (!regExp.hasMatch(value)) {
//       return 'Please enter a valid name'.tr();
//     }
//   }
//
//   static emailValidation({required String value}) {
//     String emailPattern = r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';
//     RegExp regExp = RegExp(emailPattern);
//     if (value.isEmpty) {
//       return "برجاء ادخال البريد الالكتروني";
//     } else if (!regExp.hasMatch(value) && !value.contains("@")) {
//       return "بريد الكتروني غير صالح";
//     }
//   }
//
//  static confirmPasswordValidation({required String firstValue,required String secondValue}) {
//     if (secondValue.isEmpty) {
//       return 'برجاء ادخال الرقم السرى'.tr();
//     } else if (secondValue!=firstValue) {
//       return "كلمة السر غير متطابقة";
//     }
//   }
//
//
//
// }