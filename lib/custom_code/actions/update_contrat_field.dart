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

import 'package:cloud_firestore/cloud_firestore.dart';

Future updateContratField(
  String? docId,
  String? fieldName,
  String? newValue,
) async {
  // Add your function code here!
  try {
    // Reference the Firestore document
    final docRef = FirebaseFirestore.instance.collection('contrats').doc(docId);

    // Update the specified field with the new value
    await docRef.update({fieldName!: newValue});

    print('Field "$fieldName" updated successfully with value: $newValue');
  } catch (e) {
    print('Error updating field "$fieldName": $e');
  }
}
