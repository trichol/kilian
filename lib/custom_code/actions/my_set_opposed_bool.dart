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

Future mySetOpposedBool(
  bool? inputBool,
  bool? outBool,
) async {
  // then outBool is modified when it is passed trough this function

  // Check if inputBool is true or false
  if (inputBool == true) {
    outBool = false;
  } else {
    outBool = true;
  }

  return outBool;
}
