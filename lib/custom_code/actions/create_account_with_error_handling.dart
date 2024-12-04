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
import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> createAccountWithErrorHandling(
  String? email,
  String? password,
) async {
  // Undefined name 'FirebaseAuth'. Try correcting the name to one that is defined, or defining the name.

  try {
    // Create a new user with the provided email and password

    print("Appel createAccountWithErrorHandling");
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );

    await Future.delayed(Duration(seconds: 2));
    print("fin  : Appel createAccountWithErrorHandling");

    // Access the created user's details
    User? user = userCredential.user;
    if (user != null) {
      print("Account created successfully: ${user.email}");

      // Get the created user's UID
      String uid = userCredential.user!.uid;

      print("Document user en cours d initialisation");

      // Add user details to Firestore
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'email': email,
        'created_time': FieldValue.serverTimestamp(),
      });

      await Future.delayed(Duration(seconds: 2));
      print("fin  : Document user firebase initialisé: ${user.email}");

      return "";
    } else {
      print("Account empty");
      return "création compte impossible";
    }
  } on FirebaseAuthException catch (e) {
    // Handle specific error cases
    if (e.code == 'email-already-in-use') {
      print('The email address is already in use.');
      return 'Courriel déja utilisé.';
    } else if (e.code == 'weak-password') {
      print('The password is too weak.');
      return 'Mot de passe trop faible.';
    } else if (e.code == 'invalid-email') {
      print('The email address is not valid.');
      return 'Adresse email invalide.';
    } else {
      print('Failed to create an account: ${e.message}');
      return 'Création compte impossible: ${e.message}';
    }
  } catch (e) {
    // Handle other exceptions
    print('An unexpected error occurred: $e');
    return 'An unexpected error occurred';
  }
}
