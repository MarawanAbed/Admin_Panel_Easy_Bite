import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';


class ChatFirebaseService {
  // for accessing cloud firestore database
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  // for accessing firebase storage
  static FirebaseStorage storage = FirebaseStorage.instance;

  // to return current user

  // for accessing firebase messaging (Push Notification)
  static FirebaseMessaging fMessaging = FirebaseMessaging.instance;

  //send chat image
  static Future<String> saveImage(File file) async {
    //getting image file extension
    try {
      final ext = file.path.split('.').last;

      //storage file ref with path
      final ref = storage.ref().child(
          'images/${DateTime.now().millisecondsSinceEpoch}.$ext');

      //uploading image
      await ref
          .putFile(file, SettableMetadata(contentType: 'image/$ext'))
          .then((p0) {
        log('Data Transferred: ${p0.bytesTransferred / 1000} kb');
      });

      //updating image in firestore database
      final imageUrl = await ref.getDownloadURL();
      print('imageUrl $imageUrl');
      return imageUrl;
    } on Exception catch (e) {
      rethrow;
    }
  }

  // update image in storage
  static Future<void> updateImage(File file, String imageUrl) async {
    try {
      final ext = file.path.split('.').last;
      final ref = storage.ref().child(
          'images/${DateTime.now().millisecondsSinceEpoch}.$ext');
      await ref
          .putFile(file, SettableMetadata(contentType: 'image/$ext'))
          .then((p0) {
        log('Data Transferred: ${p0.bytesTransferred / 1000} kb');
      });
      final newImageUrl = await ref.getDownloadURL();
      print('newImageUrl $newImageUrl');
    } on Exception catch (e) {
      rethrow;
    }
  }
}

