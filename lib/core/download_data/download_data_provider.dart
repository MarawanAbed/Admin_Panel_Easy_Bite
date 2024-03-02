// import 'dart:developer';
// import 'dart:io';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// import '../consts/app_urls.dart';
//
// class DownloadDataProvider extends ChangeNotifier {
//   double progress = 0.0;
//   bool downloadCompleted = false;
//
//   Future<bool> check() async {
//     var connectivityResult = await (Connectivity().checkConnectivity());
//     if (connectivityResult == ConnectivityResult.mobile) {
//       return true;
//     } else if (connectivityResult == ConnectivityResult.wifi) {
//       return true;
//     }
//     return false;
//   }
//
//   Future<void> downloadData() async {
//     await _checkPermission().then((value)async{if(value){
//       await _downloadPages();
//     }});
//     downloadCompleted = true;
// /*    await PreferencesManager.saveBool(
//         PreferencesManager.FILES_DOWNLOADED, true);*/
//   }
//
//   Future<void> _downloadPages() async {
//     Dio dio = Dio();
// /*     final connected = await check();
//     bool online = false;
//    if (connected) {
//       try {
//         final result = await InternetAddress.lookup('example.com');
//         if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//           online = true;
//         }
//       } on SocketException catch (_) {
//         online = false;
//       }
//     } else {
//       online = false;
//     }*/
//     var dir = Platform.isIOS
//         ? await getLibraryDirectory()
//         : await getApplicationSupportDirectory();
//     final Directory appDataDir = Directory('${dir.path}/app_data');
//     bool dirExists = await appDataDir.exists();
//     log('Data Directory Exists -> $dirExists');
//     if (!dirExists) {
//       await appDataDir.create();
//     }
//     String savePath = '${dir.path}/app_data/';
//     File file = File(savePath);
//     bool exists = await file.exists();
//     //if (!exists) {
//      // if (online) {
//         try {
//           Response response = await dio.get(
//             AppUrls.baseUrl+AppUrls.kMushaf,
//             options: Options(
//                 responseType: ResponseType.bytes,
//                 followRedirects: false,
//                 validateStatus: (status) {
//                   return status! < 500;
//                 }),
//             onReceiveProgress: (received, total) {
//               log('Progress -> ${((received / total) * 100)} %');
//               progress = ((received / total) * 100);
//               notifyListeners();
//             },
//           );
//           var raf = file.openSync(mode: FileMode.write);
//           raf.writeFromSync(response.data);
//           await raf.close();
//         } catch (e) {
//           print("Error => $e");
//         }
//    //   }
//   //  }
//   }
//
//   Future<bool> _checkPermission() async {
//     if (Platform.isAndroid) {
//       final status = await Permission.storage.status;
//       if (status != PermissionStatus.granted) {
//         final result = await Permission.storage.request();
//         if (result == PermissionStatus.granted) {
//           return true;
//         }
//       } else {
//         return true;
//       }
//     } else if (Platform.isIOS) {
//       final status = await Permission.storage.status;
//       if (status != PermissionStatus.granted) {
//         final result = await Permission.storage.request();
//         if (result == PermissionStatus.granted) {
//           return true;
//         }
//       } else {
//         return true;
//       }
//     }
//     return false;
//   }
// }
