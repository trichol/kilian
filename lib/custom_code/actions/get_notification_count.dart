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

Future<int> getNotificationCount(String userUid) async {
  try {
    print('###### KILIAN : debut getNotificationCount');
    // Reference the Firestore collection
    final collectionRef =
        FirebaseFirestore.instance.collection('ff_user_push_notifications');
    /*

    // Query the documents for the given user UID
    final querySnapshot =
        await collectionRef.where('user_refs', isEqualTo: userUid).get();

    // Return the number of documents
    return querySnapshot.docs.length;
    */
    print('###### KILIAN : fin getNotificationCount');
    return 1;
  } catch (e) {
    // Log the error and return 0 in case of failure
    print('Error fetching notification count: $e');
    return 0;
  }
}
