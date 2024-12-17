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

Future updateContractantDownloadStatus(
  String contratId,
  String phoneNumberValue,
) async {
  // Add your function code here!
  try {
    // Get the Firestore document reference
    final docRef =
        FirebaseFirestore.instance.collection('contrats').doc(contratId);

    // Fetch the document data
    final docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      // Get the contractantsData array
      final data = docSnapshot.data();
      final List<dynamic> contractantsData =
          data?['contratData']['contractantsData'] ?? [];

      // Update the `est_contrat_telecharger` for the matching phone number
      for (int i = 0; i < contractantsData.length; i++) {
        if (contractantsData[i]['phone_number'] == phoneNumberValue) {
          contractantsData[i]['est_contrat_telecharger'] = "true";
        }
      }

      // Update the document in Firestore
      await docRef.update({
        'contratData.contractantsData': contractantsData,
      });
    } else {
      throw Exception('Document not found');
    }
  } catch (e) {
    print('Error updating contractant download status: $e');
    rethrow;
  }
}
