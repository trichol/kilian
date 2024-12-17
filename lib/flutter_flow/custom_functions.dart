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
    if (dateParts.length == 3) {
      int day = int.parse(dateParts[0]);
      int month = int.parse(dateParts[1]);
      String year = dateParts[2];
      // CHECK presence time

      print("######### KILIAN myParseDateFromString :  CHECK presence time");
      List<String> timeParts = year.split(' ');

      if (timeParts.length == 1) {
        print("######### KILIAN myParseDateFromString :  format 1");
        return DateTime(int.parse(year), month, day);
      } else {
        year = timeParts[0];
        List<String> hourMinute = timeParts[1].split(':');
        if (hourMinute.length == 2) {
          print("######### KILIAN myParseDateFromString :  format 2");
          int heure = int.parse(hourMinute[0]);
          int minute = int.parse(hourMinute[1]);
          int seconds = 0;
          return DateTime(int.parse(year), month, day, heure, minute, seconds);
        } else if (hourMinute.length == 3) {
          print("######### KILIAN myParseDateFromString :  format 3");
          int heure = int.parse(hourMinute[0]);
          int minute = int.parse(hourMinute[1]);
          int seconds = int.parse(hourMinute[2]);
          return DateTime(int.parse(year), month, day, heure, minute, seconds);
        } else {
          throw Exception("cas inconnu");
        }
      }
    } else {
      return null;
    }
  } catch (e) {
    print("######### KILIAN myParseDateFromString error $e");
    print("######### KILIAN date :  $strDate");
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
  try {
    print("Before Fixing:");
    print(rawJson);

    // Step 1: Add quotes around keys
    String fixedJson = rawJson!.replaceAllMapped(
      RegExp(r'([{\[,]\s*)([a-zA-Z0-9_]+)(\s*:)'),
      (match) => '${match.group(1)}"${match.group(2)}"${match.group(3)}',
    );

    // Step 2: Add quotes around values (everything after a colon)
    fixedJson = fixedJson.replaceAllMapped(
      RegExp(r':\s*([^"{\[}\],]+)([,}\]])'),
      (match) {
        final value = match.group(1)!.trim();
        // Wrap all values, even numbers, booleans, URLs, and null
        return ': "$value"${match.group(2)}';
      },
    );

    print("After Fixing:");
    print(fixedJson);

    return fixedJson;
  } catch (e) {
    print("######### KILIAN fixImproperJson error  : $e");
  }
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

String? getCurrentDateTimeStr() {
  // function that returns ths current date time with the format  dd/MM/YYYY hh:mm
  final now = DateTime.now();
  final formatter = DateFormat('dd/MM/yyyy HH:mm');
  return formatter.format(now);
}

DateTime? getCurrentDateTime() {
  // it returns the current date time
  return DateTime.now();
}

bool? isContratDownloadedByContractant(
  ContratDataStruct? contrat,
  String? userId,
) {
  print('####### KILIAN APPEL  isContratDownloadedByContractant');

  // Retrieve the list of contractants from the contrat object
  try {
    List<ContractantDataStruct> contractants = contrat?.contractantsData ?? [];

    // Check if there is a contractant with the specified uid and status "signé"
    for (var contractant in contractants) {
      if (contractant.uid == userId &&
          contractant.status == "est_contrat_telecharger") {
        print(
            '####### KILIAN FIN  isContratDownloadedByContractant : deja télécharge');
        return true;
      }
    }

    // If no match is found, return false
    print(
        '####### KILIAN FIN  isContratDownloadedByContractant : pas télécharge');

    return false;
  } catch (e) {
    print('####### KILIAN isContratDownloadedByContractant $e ');
  }
}

bool? isContratSignedByContractant(
  ContratDataStruct? contrat,
  String? userId,
) {
  print('####### KILIAN APPEL  isContratSignedByContractant');

  // Retrieve the list of contractants from the contrat object
  try {
    List<ContractantDataStruct> contractants = contrat?.contractantsData ?? [];

    // Check if there is a contractant with the specified uid and status "signé"
    for (var contractant in contractants) {
      if (contractant.uid == userId && contractant.status == "signé") {
        print('####### KILIAN isContratSignedByContractant FOUND : nom ' +
            contractant.nom);
        return true;
      }
    }

    // If no match is found, return false
    print('####### KILIAN   isContratSignedByContractant : not signed');

    return false;
  } catch (e) {
    print('####### KILIAN isContratSignedByContractant $e ');
  }
}

String? removePatternFromStr(
  String? input,
  String? pattern,
) {
  String result = input!.replaceAll(pattern!, "");
  return result;
}

String? invertedRole(String? role) {
  // if input "role" argument  is : "vendeur" it returns "acheteur", if "acheteur" it returns "vendeur", if "donneur" it returns "acquereur", if "acquereur" it returns "donneur"   else throw exception
  switch (role) {
    case 'Vendeur':
      return 'Acheteur';
    case 'Acheteur':
      return 'Vendeur';
    case 'Donateur ':
      return 'Bénéficiaire ';
    case 'Bénéficiaire ':
      return 'Donateur ';
    default:
      print("############# KILIAN : Invalid role provided $role");
      throw Exception('Invalid role provided');
  }
}

bool? checkEmailOk(String? email) {
  // return true if the input has a valid email format
  if (email == null || email.isEmpty) {
    return false;
  }

  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegex.hasMatch(email);
}
