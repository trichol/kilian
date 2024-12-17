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

Future<bool> downloadAllContractantDone(String? contratId) async {
  try {
    // Reference to the contrat document
    final contratRef =
        FirebaseFirestore.instance.collection('contrats').doc(contratId);

    // Fetch the contrat document
    final contratSnapshot = await contratRef.get();

    if (!contratSnapshot.exists) {
      throw Exception('Contract not found');
    }

    // Access 'contratData' and 'contractantsData'
    final Map<String, dynamic> contratData =
        contratSnapshot.data()?['contratData'] as Map<String, dynamic>;

    if (contratData == null || contratData['contractantsData'] == null) {
      throw Exception('Invalid contractantsData format');
    }

    final List<dynamic> contractantsData = contratData['contractantsData'];

    // Check if all contractants have 'est_contrat_telecharger' set to true
    final allDownloaded = contractantsData.every((contractant) {
      if (contractant is Map<String, dynamic> &&
          contractant.containsKey('est_contrat_telecharger')) {
        return contractant['est_contrat_telecharger'] == true; // Fix here
      }
      return false;
    });

    // Return true if all contractants have downloaded the contract
    if (allDownloaded) {
      return true;
    }

    return false;
  } catch (e) {
    print('#### KILIAN downloadAllContractantDone Error: $e');
    return false;
  }
}
/*
  // Add your function code here!
  try {
    // Reference to the contrat document
    final contratRef =
        FirebaseFirestore.instance.collection('contrats').doc(contratId);

    // Fetch the contrat document
    final contratSnapshot = await contratRef.get();

    if (!contratSnapshot.exists) {
      throw Exception('Contract not found');
    }

    final contratData = contratSnapshot.data() as Map<String, dynamic>;

    // Check if 'contractantsData' exists and is a list
    if (contratData['contractantsData'] is! List) {
      throw Exception('Invalid contractantsData format');
    }

    final List<dynamic> contractantsData = contratData['contractantsData'];

    // Check if all contractants' status is "signed"
    final allDownloaded = contractantsData.every((contractant) {
      if (contractant is Map<String, dynamic> &&
          contractant.containsKey('est_contrat_telecharger')) {
        return contractant['est_contrat_telecharger'] == 'true';
      }
      return false;
    });

    if (allDownloaded) {
      // Update contratData.status to "signed"
      //await contratRef.update({
      //  'contratData.status': 'signé',
      //});
      return true;
    }

    return false;
  } catch (e) {
    print('#### KILIAN downloadAllContractantDone Error: $e');
    return false;
  }
}*/
