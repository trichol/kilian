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

Future removeUrlContratByValue(
  String? uid,
  String? unwantedValue,
) async {
  // Add your function code here!
  print("#### KILIAN  APPEL removeUrlContratByValue ");
  try {
    // Reference to the user's Firestore document
    final userDocRef = FirebaseFirestore.instance.collection('users').doc(uid);

    // Fetch the current data
    final userDoc = await userDocRef.get();
    if (!userDoc.exists) {
      throw Exception("User document does not exist");
    }

    // Extract the current url_contrats list
    final List<dynamic> urlContrats = userDoc.data()?['url_contrats'] ?? [];

    // Filter out the elements where value matches the unwanted value
    final updatedUrlContrats = urlContrats.where((element) {
      final value = element['value'] ?? '';
      return value != unwantedValue;
    }).toList();

    // Update the document with the new list
    await userDocRef.update({'url_contrats': updatedUrlContrats});

    print(
        "#### KILIAN  removeUrlContratByValue Element with value '$unwantedValue' removed successfully.");
  } catch (error) {
    print(
        "#### KILIAN  removeUrlContratByValue Error removing element: $error");
  }
}
