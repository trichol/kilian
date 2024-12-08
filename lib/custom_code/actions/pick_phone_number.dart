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

import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

Future<String> pickPhoneNumber() async {
  // Request permission to access contacts
  if (await Permission.contacts.request().isGranted) {
    print("######## KILIAN pickPhoneNumber : permission to access contacts");
    // Fetch contacts
    Iterable<Contact> contacts = await ContactsService.getContacts();

    // Ensure there are contacts available
    if (contacts.isNotEmpty) {
      print("######## KILIAN pickPhoneNumber : there are contacts available");
      // Prompt user to pick one (e.g., the first contact's number for this example)
      Contact selectedContact = contacts.firstWhere(
        (contact) => contact.phones?.isNotEmpty ?? false,
        orElse: () => Contact(),
      );

      // Get the first phone number
      if (selectedContact.phones?.isNotEmpty ?? false) {
        print("######## KILIAN pickPhoneNumber : Get the first phone number");
        return selectedContact.phones!.first.value ?? '';
      } else {
        print("######## KILIAN pickPhoneNumber : no first phone number");
      }
    } else {
      print("######## KILIAN pickPhoneNumber : contact empty");
    }
  } else {
    print("######## KILIAN pickPhoneNumber : no permission to access contacts");
  }
  // Return empty string if no contact is selected or permission denied
  return '';
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
