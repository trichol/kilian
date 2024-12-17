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
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<String> decryptAndDownload(String fileLocation) async {
  // Add your function code here!

  try {
    // Initialize Flutter Secure Storage
    final secureStorage = FlutterSecureStorage();

    // Retrieve the encryption key
    String? storedKey = await secureStorage.read(key: 'encryptionKey');
    if (storedKey == null) {
      throw Exception('Encryption key not found in secure storage.');
    }

    // Decode the stored key
    final key = encrypt.Key.fromBase64(storedKey);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    // Retrieve the encrypted file from Firebase Storage
    final storageRef = FirebaseStorage.instance.ref(fileLocation);
    final encryptedFileBytes = await storageRef.getData();

    if (encryptedFileBytes == null) {
      throw Exception('Failed to retrieve file from Firebase Storage.');
    }

    // Decrypt the file
    final decryptedBytes = encrypter.decryptBytes(
      encrypt.Encrypted(encryptedFileBytes),
    );

    // Save the decrypted file to a temporary location
    final tempDir = await getTemporaryDirectory();
    final tempFile = File('${tempDir.path}/decrypted.pdf');
    await tempFile.writeAsBytes(decryptedBytes);

    // Display the PDF using PDFViewer
    // Pass the temporary file path to the PDF viewer
    // Example:
    PDFView(
      filePath: tempFile.path,
    );

    print('Decrypted PDF displayed successfully.');
    return tempFile.path;
  } catch (e) {
    print('Error during decryption and display: $e');
    throw Exception('Failed to decrypt and display the file.');
  }
}
