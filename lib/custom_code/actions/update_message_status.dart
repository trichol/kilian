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

Future updateMessageStatus(
  String? phoneNumber,
  String? newStatus,
) async {
  // Add your function code here!
  try {
    // print('###### KILIAN APPEL updateMessageStatus  ' + phoneNumber!);

    // Reference to the Firestore collection
    final CollectionReference messagesCollection =
        FirebaseFirestore.instance.collection('message');

    // Query the documents where "phone" field equals the given phone number
    final QuerySnapshot querySnapshot = await messagesCollection
        .where('phone_receiver', isEqualTo: phoneNumber)
        .get();

    // Loop through the filtered documents and update their "status" field
    for (final QueryDocumentSnapshot doc in querySnapshot.docs) {
      await doc.reference.update({'status': newStatus});
      //print('###### -KILIAN updateMessageStatus completion  found!');
    }
  } catch (e) {
    print('Error updating documents: $e');
    throw Exception('Failed to update message statuses.');
  }
}
