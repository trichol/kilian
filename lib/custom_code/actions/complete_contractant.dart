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

Future completeContractant() async {
  // Add your function code here!
  try {
    // Get the current user's UID
    final userId = FirebaseAuth.instance.currentUser?.uid;

    // Ensure the user is authenticated
    if (userId == null) {
      throw Exception(
          '####kilian completeContractant No authenticated user found.');
    }

    // Fetch the user's document from the "users" collection
    final userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    print('####kilian completeContractantUser Fetch the user.');
    // Check if the document exists
    /*
    if (!userDoc.exists) {
      // Retrieve the 'name' field from the document
      final userName = userDoc.data()?['name'];

      // Log the value of the 'name' field
      print('User Name: $userName');
    } else {
      print('User document does not exist.');
    }*/
    final phoneNumber = userDoc.data()?['phone_number'];
    final genre = userDoc.data()?['genre'];
    final nom = userDoc.data()?['name'];
    final prenom = userDoc.data()?['nickname'];
    final signature = userDoc.data()?['signature'];
    final uid = userDoc.data()?['uid'];
    final est_contrat_telecharger = false;

    print('####kilian completeContractantUser Fetch the user.' +
        userDoc.data()?['display_name']);

    // Initialize a Firestore instance
    final firestore = FirebaseFirestore.instance;

    // Query the 'contrats' collection
    final querySnapshot = await firestore.collection('contrats').get();

    // Loop through each document in the collection
    for (final doc in querySnapshot.docs) {
      final data = doc.data() as Map<String, dynamic>;
      print(
          '####kilian completeContractantUser Check if contractantsData exists and is a list.');
      // Check if 'contractantsData' exists and is a list
      if (data['contratData']?['contractantsData'] is List) {
        print('####kilian completeContractantUser aaaa');
        final contractants = data['contratData']['contractantsData'] as List;

        // Look for the target phone number in the 'contractantsData' array
        for (final contractant in contractants) {
          if (contractant['phone_number'] == phoneNumber) {
            if (contractant['nom'] == null ||
                (contractant['nom'] is String &&
                    contractant['nom'].trim().isEmpty)) {
              contractant['genre'] = genre;
              contractant['nom'] = nom;
              contractant['prenom'] = prenom;
              contractant['uid'] = uid;
              contractant['signature'] = signature;
              contractant['est_contrat_telecharger'] = est_contrat_telecharger;
              print('##### KILIAN : utilisateur trouvé et incomplet : $nom');
            } else {
              print(
                  '####kilian completeContractantUser : utilisateur trouvé et complet ' +
                      userDoc.data()?['display_name']);
            }
            //let contratId = data['contratData']['uid'];
            break;
          } else {
            print(
                '####kilian completeContractantUser data contractants complete');
          }
        }
      } else {
        print(
            '####kilian completeContractantUser contractantsData do not exists and is not a list');
      }
    }
  } catch (e) {
    print('Error updating field: $e');
  }
}
