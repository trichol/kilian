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

Future resetNombreMessage(
  String contratId,
) async {
  // Add your function code here!
  try {
    // Reference the Firestore collection "contrats"
    final collectionRef = FirebaseFirestore.instance.collection('contrats');

    // Increment the "nombre_message" field for the specific document
    await collectionRef.doc(contratId).update({
      'contratData.nombre_message': 0,
    });
    print('##### KILIAN resetNombreMessage');

    print('##### KILIAN resetNombreMessage: reset successfully');
  } catch (e) {
    print('##### KILIAN resetNombreMessage: Error  nombre_message: $e');
  }
}
