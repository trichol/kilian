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

Future<String> buildContratPDF(
  String? contratDataJson,
) async {
  try {
    final Map<String, dynamic> contratData =
        jsonDecode(contratDataJson!); // Deserialize it back into a Map

    final typeContrat = contratData['type'];
    final cloudFunction = "cloudBuildContrat" + typeContrat;
    print("###### KILIAN buildContratPDF : " + cloudFunction);
    print("Decoded JSON: $contratData");

    final HttpsCallable callable =
        FirebaseFunctions.instanceFor(region: 'europe-west1')
            .httpsCallable(cloudFunction);

    final result = await callable.call({
      'contratData': contratData,
    });

    print("####### KILIAN  buildContratPDF result : " + result.data['message']);
    return result.data['message'];
  } catch (e) {
    print('####### KILIAN   Error buildContratPDF : $e');
    print('####### KILIAN   Error buildContratPDF : $contratDataJson');
    return '####### KILIAN buildContratPDF  erreur: $e';
  }
}
