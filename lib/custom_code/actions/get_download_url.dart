// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_storage/firebase_storage.dart';

Future<String> getDownloadUrl(String? filePath) async {
  // Add your function code here!
  try {
    if (filePath == null || filePath.isEmpty) {
      // Handle the null or empty filePath case
      print('Error: filePath is null or empty.');
      return '';
    }

    final Reference storageRef = FirebaseStorage.instance.ref().child(filePath);
    final String downloadUrl = await storageRef.getDownloadURL();
    return downloadUrl;
  } catch (e) {
    print('Error fetching download URL: $e');
    return '';
  }
}
