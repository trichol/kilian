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

import 'package:url_launcher/url_launcher.dart';

Future<bool> downloadPdf(String? url) async {
  // Add your function code here!
  if (url == null || url.isEmpty) {
    // Handle the null or empty filePath case
    print('###### KILIAN downloadPdf Error: url is null or empty.');
    return false;
  }

  if (await canLaunch(url)) {
    await launch(url);
    return true;
  } else {
    print("###### KILIAN downloadPdf Imposible de lancer download : " + url);
    return false;
  }
}
