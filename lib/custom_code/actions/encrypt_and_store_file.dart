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

import 'dart:typed_data';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

Future encryptAndStoreFile(String fileLocation) async {
  // Add your function code here!
  try {
    // Initialize Flutter Secure Storage
    final secureStorage = FlutterSecureStorage();

    // Generate or retrieve a secure key
    print(
        '####### KILIAN encryptAndStoreFile Generate or retrieve a secure key');
    String? storedKey = await secureStorage.read(key: 'encryptionKey');
    if (storedKey == null) {
      final key = encrypt.Key.fromSecureRandom(32);
      storedKey = key.base64;
      await secureStorage.write(key: 'encryptionKey', value: storedKey);
    }

    // Decode the stored key
    print('####### KILIAN build key');
    final key = encrypt.Key.fromBase64(storedKey);
    final iv = encrypt.IV.fromSecureRandom(16); // Generate a random IV

    print('####### KILIAN encryptAndStoreFile Decode the stored key');
    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    // Retrieve the file from Firebase Storage
    print(
        '####### KILIAN encryptAndStoreFile Retrieve the file from Firebase Storage');
    final storageRef = FirebaseStorage.instance.ref(fileLocation);
    final fileBytes = await storageRef.getData();

    if (fileBytes == null) {
      throw Exception('Failed to retrieve file from Firebase Storage.');
    }

    // Encrypt the file
    print('####### KILIAN encryptAndStoreFile encrypt');
    final encryptedBytes = encrypter.encryptBytes(fileBytes, iv: iv).bytes;

    // Combine IV and encrypted bytes
    final combinedBytes = iv.bytes + encryptedBytes;

    // Upload the encrypted file back to Firebase Storage
    print(
        '####### KILIAN encryptAndStoreFile Upload the encrypted file back to Firebase Storage');
    await storageRef.putData(Uint8List.fromList(combinedBytes));

    print('File encrypted and saved successfully at $fileLocation');
    print('####### KILIAN Encryption Key: ${key.base64}');
    print('####### KILIAN Encryption IV: ${iv.base64}');
  } catch (e) {
    print('Error during encryption and storage: $e');
    throw Exception('Failed to encrypt and store the file.');
  }
}
