import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String? displayName(
  String? name,
  String? nickname,
) {
  // dart function called  displayName which take 2 arguments  string name , string nickname and which return the concatenation of name with first letter uppercase and nickname first letter upper case
  if (name == null || nickname == null) {
    return null;
  }

  String formattedName =
      name.isNotEmpty ? name[0].toUpperCase() + name.substring(1) : '';
  String formattedNickname = nickname.isNotEmpty
      ? nickname[0].toUpperCase() + nickname.substring(1)
      : '';

  return formattedName + ' ' + formattedNickname;
}

DateTime? myParseDateFromString(String? strDate) {
  // Check if strDate is null
  if (strDate == null) {
    return null;
  }
  // myParseDateFromString : return a datetime , as 1 textfield argument strDate . this function convert the string in date with the format dd/mm/yyyy
  try {
    List<String> dateParts = strDate.split('/');
    if (dateParts.length != 3) {
      return null;
    }
    int day = int.parse(dateParts[0]);
    int month = int.parse(dateParts[1]);
    int year = int.parse(dateParts[2]);
    return DateTime(year, month, day);
  } catch (e) {
    return null;
  }
}

bool? myCheckLengthString(
  String? inputStrig,
  int? length,
) {
  // a function returning a boolean with 2 argument inputString(string type) and lengthStr (integer). This function return false if length inputString inferior to lengthStr and true in this other case
  if (inputStrig == null || length == null) {
    return null;
  }

  return inputStrig.length >= length;
}

String? myStringFromDate(DateTime? strDate) {
  // myStringFromDate , return string, 1 argument strDate (datetime) . this function return the conversion of strDate to date with the format jj/mm/aaaa
  // Check if strDate is null
  if (strDate == null) {
    return null;
  }
  // myStringFromDate : return a string , as 1 textfield argument strDate . this function convert the date in string with the format dd/mm/yyyy
  return DateFormat('dd/MM/yyyy').format(strDate);
}

String getLocation(
  dynamic input,
  String field,
) {
  try {
    // Check if input is a Map and contains a 'city' key
    if (input is Map<String, dynamic> && input.containsKey('city')) {
      return input['city'] ?? "nok1"; // Return city if exists, else "nok"
    } else {
      return "nok2"; // Return "nok" if input does not contain 'city'
    }
  } catch (e) {
    return "nok3";
  }
}

String? fixImproperJson(String? rawJson) {
  // print("avant");
  // print(rawJson);
  if (rawJson == null || rawJson.isEmpty) {
    throw ArgumentError("Input JSON string cannot be null or empty.");
  }
  // Step 1: Add double quotes to keys
  String fixedJson = rawJson.replaceAllMapped(
    RegExp(r'([{\[,]\s*)([a-zA-Z0-9_]+)(\s*:)'),
    (match) => '${match.group(1)}"${match.group(2)}"${match.group(3)}',
  );

  // Step 2: Add double quotes to string values
  fixedJson = fixedJson.replaceAllMapped(
    RegExp(r':\s*([a-zA-Z0-9_/\- ]+)([,}\]])'),
    (match) {
      // Ensure values that aren't numbers, booleans, or null are quoted
      final value = match.group(1)!;
      if (value == 'true' ||
          value == 'false' ||
          value == 'null' ||
          double.tryParse(value) != null) {
        return ': $value${match.group(2)}';
      }
      return ': "$value"${match.group(2)}';
    },
  );

  // Step 1: Ensure `date_creation` is quoted
  fixedJson = fixedJson.replaceAllMapped(
    RegExp(r'("date_creation":\s*)([^",\]}]+)'),
    (match) => '${match.group(1)}"${match.group(2)}"',
  );

  // Step 2: Ensure `auteur` is quoted
  fixedJson = fixedJson.replaceAllMapped(
    RegExp(r'("auteur":\s*)([^",\]}]+)'),
    (match) => '${match.group(1)}"${match.group(2)}"',
  );

  // Step 3: Ensure `url` is quoted
  fixedJson = fixedJson.replaceAllMapped(
    RegExp(r'("url":\s*)([^",\]}]+)'),
    (match) => '${match.group(1)}"${match.group(2)}"',
  );

  // Step 3: Ensure `phone_number` is quoted
  fixedJson = fixedJson.replaceAllMapped(
    RegExp(r'("phone_number":\s*)([^",\]}]+)'),
    (match) => '${match.group(1)}"${match.group(2)}"',
  );

  // print("apres");
  // print(fixedJson);
  return fixedJson;
}

String extractName(String displayName) {
  // extract the name from a display name
  // Split the display name by space
  List<String> nameParts = displayName.split(' ');

  // Return the first part of the display name
  return nameParts.isNotEmpty ? nameParts[1] : '';
}

String extractNickname(String displayName) {
  // extract nickname from display name
  // Split the display name by space
  List<String> nameParts = displayName.split(' ');

  // Return the first part as the nickname
  return nameParts[0];
}
