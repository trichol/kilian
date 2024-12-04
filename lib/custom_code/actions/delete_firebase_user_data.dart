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

import 'package:firebase_auth/firebase_auth.dart';

Future<bool> deleteFirebaseUserData() async {
  // Add your function code here!
  try {
    final currentUser = FirebaseAuth.instance.currentUser;

    // TEST UTILISATEUR LOGGED
    if (currentUser != null) {
      print("User ID: ${currentUser.uid}");
    } else {
      print("No user is logged in.");
      throw Exception("No user is logged in.");
    }
    // SUPPRESSION FIRESTORE DATA
    final userDoc =
        FirebaseFirestore.instance.collection('users').doc(currentUser.uid);

    // Supprimer les commandes associées
    final orders = await FirebaseFirestore.instance
        .collection('orders')
        .where('userId', isEqualTo: currentUser.uid)
        .get();
    for (var doc in orders.docs) {
      await doc.reference.delete();
    }
    // Supprimer le document utilisateur
    await userDoc.delete();

    // SUPPRESSION USER AUHENTICATED
    if (currentUser != null) {
      try {
        await currentUser.delete();
        print("User successfully deleted.");
      } catch (e) {
        throw Exception("Error deleting user: $e");
      }
    } else {
      throw Exception("No user is currently logged in.");
    }

    // LOG OUT
    try {
      await FirebaseAuth.instance.signOut();
      print("User logged out successfully.");
    } catch (e) {
      print("Error during logout: $e");
      throw Exception("Logout failed: $e");
    }

    return true;
  } catch (e) {
    print(
        '####### KILIAN   ERROR : deleteFirestoreAuthenticagtedUserData : $e');
    return false;
  }
}
