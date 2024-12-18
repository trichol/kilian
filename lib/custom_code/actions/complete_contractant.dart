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
          '####kilian completeContractant aucun utilisateur trouvé dans la base  : ' +
              userId!);
    }

    // Fetch the user's document from the "users" collection
    final userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    print(
        '####kilian completeContractantUser récupération data user dans base OK!');
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

    print('####kilian completeContractantUser data gathered for : ' +
        userDoc.data()?['display_name']);

    // Initialize a Firestore instance
    final firestore = FirebaseFirestore.instance;

    // Query the 'contrats' collection
    final querySnapshot = await firestore.collection('contrats').get();

    // Loop through each document in the collection
    for (final doc in querySnapshot.docs) {
      final data = doc.data() as Map<String, dynamic>;

      ///print('####kilian completeContractantUser Check if contractantsData exists and is a list.');
      // Check if 'contractantsData' exists and is a list
      if (data['contratData']?['contractantsData'] is List) {
        final contractants = data['contratData']['contractantsData'] as List;

        bool updated = false; // Flag to track if any changes were made

        // Look for the target phone number in the 'contractantsData' array
        for (final contractant in contractants) {
          if (contractant['phone_number'] == phoneNumber) {
            print('####kilian test phone OK :' +
                contractant['phone_number'] +
                ' == ' +
                phoneNumber);
            if (contractant['nom'] == null ||
                (contractant['nom'] is String &&
                    contractant['nom']!.trim().isEmpty)) {
              print('####kilian test nom vide OK  vide!');
              contractant['genre'] = genre;
              contractant['nom'] = nom;
              contractant['prenom'] = prenom;
              contractant['uid'] = uid;
              contractant['signature'] = signature;
              contractant['est_contrat_telecharger'] = est_contrat_telecharger;
              print(
                  '##### KILIAN : utilisateur trouvé et incomplet : $nom  = ' +
                      contractant['nom'] +
                      ' --- $prenom  = ' +
                      contractant['prenom']);
              updated = true; // Set the flag to true
            } else {
              print('####kilian test nom vide NOK :' + contractant['nom']);
              print(
                  '####kilian completeContractantUser : utilisateur trouvé et complet ' +
                      userDoc.data()?['display_name']);
            }
            //let contratId = data['contratData']['uid'];
            break;
          } else {
            print('####kilian test phone NOK :' +
                contractant['phone_number'] +
                ' == ' +
                phoneNumber);
            // print('####kilian completeContractantUser data contractants complete');
          }
        }

        // Update Firestore if any modifications were made
        if (updated) {
          await doc.reference.update({
            'contratData.contractantsData': contractants,
          });
          print(
              '####kilian Firestore updated successfully for doc ID: ${doc.id}');
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
