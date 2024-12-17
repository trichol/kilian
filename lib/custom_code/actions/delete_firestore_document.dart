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

Future deleteFirestoreDocument(
  String? collectionPath,
  String? docId,
) async {
  // Add your function code here!
  try {
    // Reference the document to delete
    final documentRef =
        FirebaseFirestore.instance.collection(collectionPath!).doc(docId);
    // Delete the document
    await documentRef.delete();
    print('Document with ID $docId deleted successfully.');
  } catch (e) {
    print('Error deleting document: $e');
    throw Exception('Failed to delete document');
  }
}
