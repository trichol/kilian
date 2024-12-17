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

Future<String> updateFilteredDocuments(
  String? collectionPath,
  String? fieldToFilter,
  String? filterValue,
  String? fieldToUpdate,
  String? newValue,
) async {
  // Add your function code here!

  try {
    // Reference the Firestore collection
    CollectionReference collection =
        FirebaseFirestore.instance.collection(collectionPath!);

    // Query the collection based on the filter
    QuerySnapshot querySnapshot =
        await collection.where(fieldToFilter!, isEqualTo: filterValue).get();

    // Iterate through each document in the query result and update the specified field
    for (var doc in querySnapshot.docs) {
      await doc.reference.update({fieldToUpdate!: newValue});
      print(
          "######  KILIAN updateFilteredDocuments : Document ${doc.id} updated successfully");
    }
    return "";
  } catch (e) {
    print("Error updating documents: $e");
    return "######  KILIAN updateFilteredDocuments : Failed to update filtered documents in Firestore : $e";
  }
}
