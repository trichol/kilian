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

Future updateFirestoreField(
  String? collectionPath,
  String? documentId,
  String? fieldName,
  String? newValue,
) async {
  // Add your function code here!
  try {
    // Reference to the document
    DocumentReference docRef =
        FirebaseFirestore.instance.collection(collectionPath!).doc(documentId!);

    // Update the specified field
    await docRef.update({fieldName!: newValue!});

    print(
        "##### KILIAN Field updateFirestoreField '$fieldName' updated successfully to $newValue");
  } catch (e) {
    print("##### KILIAN Field updateFirestoreField Error updating field: $e");
    throw Exception(
        "##### KILIAN Field updateFirestoreField Failed to update Firestore document");
  }
}
