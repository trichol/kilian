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

import 'package:firebase_storage/firebase_storage.dart';

Future deleteFileByUrl(String fileUrl) async {
  // Add your function code here!
  try {
    // Extract the file path from the file URL
    final RegExp regExp = RegExp(r'%2F(.*?)\?alt');
    final RegExpMatch? match = regExp.firstMatch(fileUrl);

    if (match != null) {
      final String filePath = Uri.decodeFull(match.group(1)!);

      // Reference the file in Firebase Storage
      final storageRef = FirebaseStorage.instance.ref(filePath);

      // Delete the file
      await storageRef.delete();
      print('File successfully deleted: $filePath');
    } else {
      print('Invalid file URL format');
      throw Exception('Could not extract file path from URL');
    }
  } catch (e) {
    print('Error deleting file: $e');
    rethrow;
  }
}
