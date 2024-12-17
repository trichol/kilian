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

Future<bool> doesCollectionExist(String? collectionName) async {
  // Add your function code here!
  try {
    // Reference to the "message" collection
    final CollectionReference messageCollection =
        FirebaseFirestore.instance.collection(collectionName!);

    // Query the collection to check if it has any documents
    final QuerySnapshot snapshot = await messageCollection.limit(1).get();

    // If the query returns documents, the collection exists
    return snapshot.docs.isNotEmpty;
  } catch (e) {
    // Handle potential errors (e.g., insufficient permissions)
    print('Error checking for collection existence: $e');
    return false; // Assume the collection does not exist
  }
}
