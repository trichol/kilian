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

Future<List<DataLabelValueStruct>> getListUrlContratSigned(
    String? userId) async {
  // Add your function code here!
  try {
    // Define the Firebase Storage path
    final String storagePath = 'users/$userId/contrats';

    print('############# KILIAN -getListUrlContratSigned $storagePath');

    // Reference to the Firebase Storage directory
    final Reference storageRef = FirebaseStorage.instance.ref(storagePath);

    // List all items (files) in the directory
    final ListResult result = await storageRef.listAll();

    // Prepare the list to store filename and URL
    List<DataLabelValueStruct> filesList = [];

    for (var item in result.items) {
      // Get the file name
      final String fileName = item.name;
      final List<String> tokens = fileName.split('_');

      print('############# 1-KILIAN $fileName');

      // Get the file download URL
      final String fileUrl = await item.getDownloadURL();

      // Add the filename and URL as a map to the list
      final dataCourant = DataLabelValueStruct(
        label: tokens[1],
        value: tokens[2],
        url: fileUrl,
      );
      filesList.add(dataCourant);

      // Print trace for each file
      print(
          '############# KILIAN getListUrlContratSigned file: $fileName, URL: $fileUrl');
    }

    // Print the complete list for tracing
    print('############# KILIAN liste contrat signé: $filesList');

    return filesList;
  } catch (e) {
    // Handle errors and print the error trace
    print('Error fetching files: $e');
    throw Exception('Failed to fetch files from Firebase Storage');
  }
}
