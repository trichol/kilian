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

import 'package:universal_html/html.dart' as html;

Future<bool> downloadPdfWeb(String? url) async {
  if (url == null || url.isEmpty) {
    print('Error: URL is null or empty.');
    return false;
  }

  // Create an anchor element dynamically for download
  final anchor = html.AnchorElement(href: url)
    ..target = 'blank' // Opens in a new tab if needed
    ..download = 'file.pdf' // Suggests a default file name for download
    ..click();

  return true;
}
