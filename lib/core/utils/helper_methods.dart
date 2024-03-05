import 'dart:convert';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../src/profile/data/models/profile_dto.dart';
import 'keys_constant.dart';

class HelperMethods {
  static Future<void> launchWhatsApp(String phoneNumber) async {
    Uri whatsUpUrl = Uri.parse("whatsapp://send?phone=$phoneNumber");
    if (await canLaunchUrl(whatsUpUrl)) {
      await launchUrl(whatsUpUrl);
    } else {
      // showErrorToast('حدث خطأ اثناء الاتصال بالواتساب');
    }
  }

  // show date picker
  static Future<String> datePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      return picked.toString();
    }
    return '';
  }

  static String formatDate(String date) {
    final DateTime dateTime = DateTime.parse(date);
    final String formatter = DateFormat('yyyy-MM-dd').format(dateTime);
    return formatter;
  }

  static setLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', language);
  }

  static Future<String> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('language') ?? 'en';
  }

  // save ProfileDto to shared preferences
  static saveProfile(ProfileDto profile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (profile.accessToken == null || profile.accessToken!.isEmpty) {
      String token = await getToken();
      profile.accessToken = token;
      prefs.setString('profile', jsonEncode(profile.toJson()));
    } else {
      prefs.setString('profile', jsonEncode(profile.toJson()));
    }
  }

  // get ProfileDto from shared preferences
  static Future<ProfileDto?>? getProfile() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final data = ProfileDto.fromJson(
          jsonDecode(prefs.getString('profile') ?? '{}') ?? {});
      // print('getProfile ${data.toJson()}');
      if (data.id == null) return null;
      return data;
    } on Exception catch (e) {
      print('getProfile ${e.toString()}');
      return null;
    }
  }

  // share text
  // static Future<void> shareText(String text) async {
  //   await Share.share(text);
  // }

  static removeProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('profile');
  }

  static Future<String> getToken() async {
    try {
      ProfileDto? profile = await getProfile();
      if (profile?.accessToken == null || profile!.accessToken!.isEmpty)
        return '';
      return profile.accessToken!;
    } on Exception catch (e) {
      print('profile?.token ${e.toString()}');
      return '';
    }
  }

  static Future<bool> isAuth() async {
    String token = await getToken();
    if (token.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  static Future<void> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  // share text
  // static Future<void> shareText(String text) async {
  //   await Share.share(text);
  // }

  static void showToast({required String message, Color? backgroundColor}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: backgroundColor ?? Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static Future<XFile?> getImagePicker() async {
    // XFile? imageFile;
    return await ImagePicker().pickImage(source: ImageSource.gallery);
    // return await ImageCropper().cropImage(
    //   sourcePath: imageFile!.path,
    //   //  aspectRatio: const CropAspectRatio(ratioX: 2, ratioY: 1),
    //   uiSettings: [
    //     AndroidUiSettings(
    //         toolbarColor: Colors.black,
    //         toolbarWidgetColor: Colors.white,
    //         initAspectRatio: CropAspectRatioPreset.original,
    //         lockAspectRatio: true),
    //   ],
    // );
  }

  static Future<File> getImageFromGallery() async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    return File(pickedFile!.path);
  }

  static Future<void> saveMushaf(int id) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt('mushaf', id);
    } on Exception catch (e) {
      print('save Mushaf Id Error ${e.toString()}');
      rethrow;
    }
  }

  static Future<int?> fetchSavedMushaf() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getInt('mushaf') ?? 0;
    } on Exception catch (e) {
      print('get Mushaf Id Error ${e.toString()}');
      rethrow;
    }
  }
}
