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
import 'package:firebase_auth/firebase_auth.dart';

Future deleteContratReference(String contratId) async {
  // Add your function code here!
  try {
    // Get the current authenticated user
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      throw Exception('No authenticated user found.');
    }

    print('###### KILIAN deleteContratReference :   $contratId   / ' +
        currentUser.uid);

    // Reference to the user's document in the "users" collection
    final userDocRef =
        FirebaseFirestore.instance.collection('users').doc(currentUser.uid);

    // Fetch the user's document data
    print(
        '###### KILIAN deleteContratReference : Fetch the users document data');
    final userDoc = await userDocRef.get();

    if (!userDoc.exists) {
      throw Exception('User document does not exist.');
    }

    // Get the 'contrats' field from the document
    print(
        '###### KILIAN deleteContratReference : Get the contrats field from the document');
    final List<dynamic>? contrats = userDoc.data()?['contrats'];

    if (contrats == null || contrats.isEmpty) {
      throw Exception('No contrats found in the user document.');
    }

    // Filter out the contrat with the given contratId
    final updatedContrats = contrats.where((contrat) {
      // Ensure contrat is a Map and contains the '__ref__' key
      if (contrat is Map<String, dynamic> && contrat.containsKey('__ref__')) {
        final ref = contrat['__ref__'] as String?;
        // Check if the reference ends with the contratId
        return ref == null || !ref.endsWith(contratId);
      }
      // Exclude any invalid contrat entries
      return false;
    }).toList();

    // Check the updated list
    if (updatedContrats.isEmpty) {
      print('No valid contrats remain after filtering.');
    }

    // Update the user document with the modified list
    print(
        '###### KILIAN deleteContratReference : Update the user document with the modified list');
    await userDocRef.update({'contrats': updatedContrats});

    print(
        '###### KILIAN deleteContratReference : Contrat with ID $contratId successfully removed.');
  } catch (e) {
    print(
        '###### KILIAN deleteContratReference : Error deleting contrat reference: $e');
    rethrow;
  }
}
