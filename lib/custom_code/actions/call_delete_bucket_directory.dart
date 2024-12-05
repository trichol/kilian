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

import 'package:cloud_functions/cloud_functions.dart';

Future<String> callDeleteBucketDirectory(String? bucketFile) async {
  // Add your function code here!
  print('###### KILIAN callDeleteBucketDirectory : $bucketFile');
  try {
    final HttpsCallable callable =
        FirebaseFunctions.instanceFor(region: 'europe-west1')
            .httpsCallable('deleteBucketDirectory');

    final result = await callable.call({
      'bucketFile': bucketFile,
    });

    print(result.data['message']);
    return result.data['message'];
  } catch (e) {
    print('###### KILIAN Error calling callDeleteBucketDirectory: $e');
    throw Exception('Failed to call Cloud callDeleteBucketDirectory');
  }
}
