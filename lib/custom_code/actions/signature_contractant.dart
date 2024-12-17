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

Future<String> signatureContractant(
  String? contratId,
  String? contractantId,
  String? signature,
) async {
  // Add your function code here!

  // Reference to the contract document
  DocumentReference contractRef =
      FirebaseFirestore.instance.collection('contrats').doc(contratId);

  try {
    // Get the current data for the contract
    DocumentSnapshot contractSnapshot = await contractRef.get();

    if (contractSnapshot.exists) {
      Map<String, dynamic> contractData =
          contractSnapshot.data() as Map<String, dynamic>;

      // Extract the `contractantsData` array
      List<dynamic> contractantsData =
          contractData['contratData']['contractantsData'];

      // Find the index of the contractant with the specific `uids`
      int indexToUpdate = contractantsData
          .indexWhere((contractant) => contractant['uid'] == contractantId);

      if (indexToUpdate != -1) {
        // Update fields for the specific contractant
        contractantsData[indexToUpdate]['status'] = "signé";
        contractantsData[indexToUpdate]['signature'] = signature;
        contractantsData[indexToUpdate]['date_signature'] = DateTime.now();

        // Save the updated array back to Firestore
        await contractRef.update({
          'contratData.contractantsData': contractantsData,
        });

        print(
            "### KILIAN signature updated successfully for uids: $contractantId");
      } else {
        print(
            "### KILIAN signature Contractant with uids: $contractantId not found.");
      }
    } else {
      print("### KILIAN signature Contract document not found.");
    }
    return "";
  } catch (e) {
    print("### KILIAN signature Error updating : $e");
    return "### KILIAN signature Error updating : $e";
  }
}
