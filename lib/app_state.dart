import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'flutter_flow/flutter_flow_util.dart';

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

  SocialNetworkUserDataTypeStruct _socialNetworkUserData =
      SocialNetworkUserDataTypeStruct.fromSerializableMap(
          jsonDecode('{\"name\":\"\"}'));
  SocialNetworkUserDataTypeStruct get socialNetworkUserData =>
      _socialNetworkUserData;
  set socialNetworkUserData(SocialNetworkUserDataTypeStruct value) {
    _socialNetworkUserData = value;
  }

  void updateSocialNetworkUserDataStruct(
      Function(SocialNetworkUserDataTypeStruct) updateFn) {
    updateFn(_socialNetworkUserData);
  }
}
