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

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'dart:io';

Future<List<String>> getAddressSuggestions(String input, String apiKey) async {
  print("Fetching address suggestions for input: $input");

  try {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$apiKey');

    final response = await http.get(url);
    print("API call completed with status: ${response.statusCode}");
    print("test mode :");
    print(Platform.environment['FLUTTER_TEST_MODE']);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final predictions = data['predictions'] as List;

      print(
          "Address suggestions fetched successfully: ${predictions.length} results found.");
      return predictions.map((p) => p['description'] as String).toList();
    } else {
      throw Exception(
          'Error fetching address suggestions: ${response.reasonPhrase}');
    }
  } catch (e) {
    print("Error fetching address suggestions: $e");

    print("Attempting fallback to local proxy");
    try {
      final fallbackUrl =
          Uri.parse('http://localhost:3000/places-autocomplete?input=$input');
      final fallbackResponse = await http.get(fallbackUrl);

      print(
          "Fallback API call completed with status: ${fallbackResponse.statusCode}");

      if (fallbackResponse.statusCode == 200) {
        final data = jsonDecode(fallbackResponse.body);
        final predictions = data['predictions'] as List;

        print("Fallback successful: ${predictions.length} results found.");
        return predictions.map((p) => p['description'] as String).toList();
      } else {
        throw Exception('Fallback failed: ${fallbackResponse.reasonPhrase}');
      }
    } catch (fallbackError) {
      print("Both primary and fallback requests failed: $fallbackError");
      throw Exception('Unable to fetch address suggestions: $fallbackError');
    }
  }
}
