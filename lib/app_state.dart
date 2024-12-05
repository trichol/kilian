import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _iLoop = 0;
  int get iLoop => _iLoop;
  set iLoop(int value) {
    _iLoop = value;
  }

  String _signInType = '';
  String get signInType => _signInType;
  set signInType(String value) {
    _signInType = value;
  }

  String _smsTo = '';
  String get smsTo => _smsTo;
  set smsTo(String value) {
    _smsTo = value;
  }

  String _smsFrom = '';
  String get smsFrom => _smsFrom;
  set smsFrom(String value) {
    _smsFrom = value;
  }

  String _phoneNumberTo = '';
  String get phoneNumberTo => _phoneNumberTo;
  set phoneNumberTo(String value) {
    _phoneNumberTo = value;
  }
}
