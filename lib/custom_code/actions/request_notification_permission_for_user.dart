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
import 'package:firebase_auth/firebase_auth.dart';
import 'package:universal_io/io.dart';

Future<bool> requestNotificationPermissionForUser() async {
  // Add your function code here!
  try {
    if (!Platform.isAndroid && !Platform.isIOS) {
      print("Notifications are not supported on this platform.");
      return true;
    }
    // Request notification permissions
    print('Request notification permissions');
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      sound: true,
    );

    print('Authorization status: ${settings.authorizationStatus}');

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('Notification permission granted.');
    } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
      print('Notification permission denied.');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('Provisional notification permission granted.');
    } else {
      print('Notification permission status: ${settings.authorizationStatus}');
    }

/*  SET TOKEN
  if (settings.authorizationStatus == AuthorizationStatus.authorized ||
      settings.authorizationStatus == AuthorizationStatus.provisional) {
    // Get the FCM token
    print('Get the FCM token');
    String? token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      // Get the current authenticated user
      print('Get the current authenticated user.');
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        // Update Firestore with the token
        print('Update Firestore with the token.');
        await FirebaseFirestore.instance
            .collection(
                'users') // Replace 'users' with your Firestore collection
            .doc(currentUser.uid)
            .update({'deviceToken': token});
        return true;
      } else {
        print('No authenticated user found.');
        return false;
      }
    } else {
      print('FCM token is null.');
      return false;
    }
  } else {
    print('Notification permission denied.');
    return false;
  }

  */

    return true;
  } catch (e) {
    print("###### KILIAN ERROR : requestNotificationPermissionForUser : $e");
    return false;
  }
}
