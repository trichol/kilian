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

import 'dart:io';
//import 'package:http/http.dart' as http;
import 'package:universal_html/html.dart' as html;
import 'dart:async'; // Import for Completer

Future<bool> checkFileExists(String url) async {
  final completer = Completer<bool>();
  final request = html.HttpRequest();

  try {
    // Open a HEAD request to the given URL
    request.open('HEAD', url);
    print('###### KILIAN url ok : $url');
    await Future.delayed(Duration(seconds: 1));

    // Listen for when the request completes
    request.onLoadEnd.listen((event) {
      // Check the HTTP status code to determine success
      if (request.status == 200) {
        completer.complete(true); // File exists
        print('###### KILIAN File exists : $url');
      } else {
        completer.complete(false); // File doesn't exist or not accessible
        int? nullableInt = request.status;
        String convertedValue = nullableInt?.toString() ?? 'default_value';
        print('###### KILIAN url  does not exist or not accessible : $url ' +
            convertedValue);
      }
    });

    // Send the request
    request.send();
  } catch (e) {
    print('###### KILIAN url manquante : $url  $e');
    completer.complete(false); // Return false on error
  }

  return completer.future;
}
/*
  // Add your function code here!
  try {
    final response = await http.head(Uri.parse(url));
    print('###### KILIAN url ok : $url');
    print(response.statusCode);
    return response.statusCode == 200;
  } catch (e) {
    print('###### KILIAN url manquante : $url  $e');
    return false;
  }
}*/
