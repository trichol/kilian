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

Future deleteFilteredDocuments(
  String? collectionPath,
  String? fieldToFilter,
  String? filterValue,
) async {
  // Add your function code here!
  try {
    // Reference the Firestore collection
    CollectionReference collection =
        FirebaseFirestore.instance.collection(collectionPath!);

    // Query the collection based on the filter
    QuerySnapshot querySnapshot =
        await collection.where(fieldToFilter!, isEqualTo: filterValue!).get();

    // Iterate through each document in the query result and delete it
    for (var doc in querySnapshot.docs) {
      await doc.reference.delete();
      print("Deleted document with ID: ${doc.id}");
    }

    print("All matching documents have been deleted.");
  } catch (e) {
    print("Error deleting documents: $e");
    throw Exception("Failed to delete filtered documents from Firestore");
  }
}
