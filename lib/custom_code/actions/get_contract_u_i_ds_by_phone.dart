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

Future<List<String>> getContractUIDsByPhone(String? phone) async {
  // Add your function code here!
  // Reference to the Firestore collection
  final collectionRef = FirebaseFirestore.instance.collection('contrats');

  try {
    // Query the collection and get the documents
    final querySnapshot = await collectionRef.get();

    // Initialize a list to store matching UIDs
    List<String> matchingUIDs = [];

    // Loop through each document in the collection
    for (var doc in querySnapshot.docs) {
      // Access the 'contradata' field
      final contradata = doc.data()['contradata']?['data']?['contratData'];

      if (contradata != null) {
        // Access the 'contractantsData' array
        final contractantsData =
            contradata['contractantsData'] as List<dynamic>?;

        if (contractantsData != null) {
          // Check if any contractant's phone_number matches the argument
          for (var contractant in contractantsData) {
            if (contractant['phone_number'] == phone) {
              // Add the UID to the list if it matches
              matchingUIDs.add(contradata['uid']);
              break; // Stop checking further contractants for this document
            }
          }
        }
      }
    }

    // Return the list of matching UIDs
    return matchingUIDs;
  } catch (e) {
    print('Error reading Firebase collection: $e');
    return [];
  }
}
