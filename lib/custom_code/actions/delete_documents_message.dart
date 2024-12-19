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

Future<bool> deleteDocumentsMessage(
  String phoneNumber,
  String contratId,
) async {
  // Add your function code here!
  print('###### KILIAN deleteDocumentsMessage : $phoneNumber $contratId');
  try {
    // Reference to the Firestore collection
    print(
        '###### KILIAN deleteDocumentsMessage : Reference to the Firestore collection');
    final collectionRef = FirebaseFirestore.instance.collection('message');

    // Query the collection for matching documents
    print(
        '###### KILIAN deleteDocumentsMessage : Query the collection for matching documents');
    final querySnapshot = await collectionRef
        .where('phone_receiver', isEqualTo: phoneNumber)
        .where('contratId',
            isEqualTo: FirebaseFirestore.instance.doc(contratId))
        .get();

    // Iterate through the results and delete each document
    print(
        '###### KILIAN deleteDocumentsMessage : Iterate through the results and delete each document');

    for (var doc in querySnapshot.docs) {
      await doc.reference.delete();
    }
    return true;
  } catch (e) {
    // Handle any errors
    print(
        '###### KILIAN deleteDocumentsMessage : Error deleting documents: $e');
    return false;
  }
}
