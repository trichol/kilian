// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> generateAndSaveDeviceToken(String? userId) async {
  // Add your function code here!
  try {
    print("###### KILIAN appel generateAndSaveDeviceToken");
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // Request notification permissions (iOS-specific)
    print("###### KILIAN Request notification permissions (iOS-specific)");
    await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // Get the device token
    print("###### KILIAN Get the device token : ");
    String? token = await messaging.getToken();

    if (token != null) {
      print('###### KILIAN Device Token: $token');

      // Save the token to Firestore
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'deviceToken': token,
      });

      print('###### KILIAN Device token saved to Firestore.');
      return true;
    } else {
      print('###### KILIAN Failed to generate device token');
      return false;
    }
  } catch (e) {
    print('###### KILIAN Error saving device token: $e');
    return false;
  }
}
