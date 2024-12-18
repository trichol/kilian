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

Future<bool> isContratFullySigned(String? contratId) async {
  // Add your function code here!
  try {
    // Reference to the contrat document
    print(
        "### KILIAN isContratFullySigned :  Reference to the contrat document");
    final contratRef =
        FirebaseFirestore.instance.collection('contrats').doc(contratId);

    // Fetch the contrat document
    final contratSnapshot = await contratRef.get();

    if (!contratSnapshot.exists) {
      throw Exception('Contract not found');
    }

    /*

    final contratData = contratSnapshot.data() as Map<String, dynamic>;

    // Check if 'contractantsData' exists and is a list
    if (contratData['contractantsData'] is! List) {
      throw Exception('Invalid contractantsData format');
    }

    final List<dynamic> contractantsData = contratData['contractantsData'];
    */
    Map<String, dynamic> contractData =
        contratSnapshot.data() as Map<String, dynamic>;

    // Extract the `contractantsData` array

    print(
        "### KILIAN isContratFullySigned :  Extract the `contractantsData` array");
    List<dynamic> contractantsData =
        contractData['contratData']['contractantsData'];

    // Check if all contractants' status is "signed"
    print(
        "### KILIAN isContratFullySigned :  Check if all contractants status is signed");
    final allSigned = contractantsData.every((contractant) {
      if (contractant is Map<String, dynamic> &&
          contractant.containsKey('status')) {
        print(
            "### KILIAN isContratFullySigned :  signed " + contractant['nom']);
        return contractant['status'] == 'signé';
      }
      print("### KILIAN isContratFullySigned :  not signed " +
          contractant['nom']);
      return false;
    });

    if (allSigned) {
      print("### KILIAN isContratFullySigned :  set contrat status a signé");
      // Update contratData.status to "signed"
      await contratRef.update({
        'contratData.status': 'signé',
      });
      print("### KILIAN isContratFullySigned :  all signed");
      return true;
    } else {
      print("### KILIAN isContratFullySigned :  not all signed");
    }

    return false;
  } catch (e) {
    print('#### KILIAN isContratFullySigned Error: $e');
    return false;
  }
}
