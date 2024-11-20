// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_functions/cloud_functions.dart';

Future<String> callPostedContratFunction(
  String? modeleHtmlContrat,
  String? contratPDF,
  String? contratDataJson,
) async {
  try {
    // print("Before jsonDecode");
    final Map<String, dynamic> contratData =
        jsonDecode(contratDataJson!); // Deserialize it back into a Map

    // print("after jsonDecode");
    // print("Decoded JSON: $contratData");

    final HttpsCallable callable =
        FirebaseFunctions.instanceFor(region: 'europe-west1')
            .httpsCallable('postedContratFunction');

    final result = await callable.call({
      'modeleHtmlContrat': modeleHtmlContrat,
      'contratPDF': contratPDF,
      'contratData': contratData,
    });

    print(result.data['message']);
    return result.data['message'];
  } catch (e) {
    print('Error calling function: $e');
    print('Error calling function: $contratDataJson');
    throw Exception('Failed to call Cloud Function');
  }
}
