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

  String _signInTypeAppState = '';
  String get signInTypeAppState => _signInTypeAppState;
  set signInTypeAppState(String value) {
    _signInTypeAppState = value;
  }

  ContratDataStruct _contratDataAppState = ContratDataStruct();
  ContratDataStruct get contratDataAppState => _contratDataAppState;
  set contratDataAppState(ContratDataStruct value) {
    _contratDataAppState = value;
  }

  void updateContratDataAppStateStruct(Function(ContratDataStruct) updateFn) {
    updateFn(_contratDataAppState);
  }

  int _indiceTypeContratAppState = 0;
  int get indiceTypeContratAppState => _indiceTypeContratAppState;
  set indiceTypeContratAppState(int value) {
    _indiceTypeContratAppState = value;
  }

  int _indiceStatusAppState = 0;
  int get indiceStatusAppState => _indiceStatusAppState;
  set indiceStatusAppState(int value) {
    _indiceStatusAppState = value;
  }

  int _iLoopBis = 0;
  int get iLoopBis => _iLoopBis;
  set iLoopBis(int value) {
    _iLoopBis = value;
  }

  SmsDataStruct _smsDataAppState = SmsDataStruct();
  SmsDataStruct get smsDataAppState => _smsDataAppState;
  set smsDataAppState(SmsDataStruct value) {
    _smsDataAppState = value;
  }

  void updateSmsDataAppStateStruct(Function(SmsDataStruct) updateFn) {
    updateFn(_smsDataAppState);
  }

  List<ObjetContratStruct> _cListObjetContratAdulte = [
    ObjetContratStruct.fromSerializableMap(jsonDecode(
        '{\"titre\":\"Relation sexuelle hardcore\",\"description\":\"Rapport sexuel dans un lieu privé\",\"prix\":\"\",\"categorie\":\"adulte\",\"sousCategorie\":\"hardcore\",\"enletat\":\"\",\"estFonctionnel\":\"\"}')),
    ObjetContratStruct.fromSerializableMap(jsonDecode(
        '{\"titre\":\"Relation sexuelle BDSM\",\"description\":\"Rapport sexuel BDSM dans un lieu privé.\",\"prix\":\"\",\"categorie\":\"Adulte\",\"sousCategorie\":\"Hardcore\",\"enletat\":\"\",\"estFonctionnel\":\"\"}')),
    ObjetContratStruct.fromSerializableMap(jsonDecode(
        '{\"titre\":\"Rendez-vous galant\",\"description\":\"Flirt dans un lieu public\",\"prix\":\"\",\"categorie\":\"Adulte\",\"sousCategorie\":\"Soft\",\"enletat\":\"\",\"estFonctionnel\":\"\"}')),
    ObjetContratStruct.fromSerializableMap(jsonDecode(
        '{\"titre\":\"Diner professionnel\",\"description\":\"Relation professionnel dans un cadre publique\",\"prix\":\"\",\"categorie\":\"Adulte\",\"sousCategorie\":\"Soft\",\"enletat\":\"\",\"estFonctionnel\":\"\"}')),
    ObjetContratStruct.fromSerializableMap(jsonDecode(
        '{\"titre\":\"Relation sexuelle soft\",\"description\":\"Rapport sexuel soft dans un lieu privé\",\"prix\":\"\",\"categorie\":\"Adulte\",\"sousCategorie\":\"Hardcore\",\"enletat\":\"\",\"estFonctionnel\":\"\"}')),
    ObjetContratStruct.fromSerializableMap(jsonDecode(
        '{\"titre\":\"Relation consentie soft\",\"description\":\"Flirt dans un lieu privé\",\"prix\":\"\",\"categorie\":\"Adulte\",\"sousCategorie\":\"Soft\",\"enletat\":\"\",\"estFonctionnel\":\"\"}'))
  ];
  List<ObjetContratStruct> get cListObjetContratAdulte =>
      _cListObjetContratAdulte;
  set cListObjetContratAdulte(List<ObjetContratStruct> value) {
    _cListObjetContratAdulte = value;
  }

  void addToCListObjetContratAdulte(ObjetContratStruct value) {
    cListObjetContratAdulte.add(value);
  }

  void removeFromCListObjetContratAdulte(ObjetContratStruct value) {
    cListObjetContratAdulte.remove(value);
  }

  void removeAtIndexFromCListObjetContratAdulte(int index) {
    cListObjetContratAdulte.removeAt(index);
  }

  void updateCListObjetContratAdulteAtIndex(
    int index,
    ObjetContratStruct Function(ObjetContratStruct) updateFn,
  ) {
    cListObjetContratAdulte[index] = updateFn(_cListObjetContratAdulte[index]);
  }

  void insertAtIndexInCListObjetContratAdulte(
      int index, ObjetContratStruct value) {
    cListObjetContratAdulte.insert(index, value);
  }

  List<DataLabelValueStruct> _cApplicationInfo = [
    DataLabelValueStruct.fromSerializableMap(
        jsonDecode('{\"label\":\"Année\",\"value\":\"2024\",\"url\":\"\"}')),
    DataLabelValueStruct.fromSerializableMap(jsonDecode(
        '{\"label\":\"Propriétaire\",\"value\":\"Société Freepartners\",\"url\":\"\"}')),
    DataLabelValueStruct.fromSerializableMap(
        jsonDecode('{\"label\":\"Version\",\"value\":\"2.0\",\"url\":\"\"}')),
    DataLabelValueStruct.fromSerializableMap(jsonDecode(
        '{\"label\":\"Nom de l\'application\",\"value\":\"Kilian\",\"url\":\"\"}'))
  ];
  List<DataLabelValueStruct> get cApplicationInfo => _cApplicationInfo;
  set cApplicationInfo(List<DataLabelValueStruct> value) {
    _cApplicationInfo = value;
  }

  void addToCApplicationInfo(DataLabelValueStruct value) {
    cApplicationInfo.add(value);
  }

  void removeFromCApplicationInfo(DataLabelValueStruct value) {
    cApplicationInfo.remove(value);
  }

  void removeAtIndexFromCApplicationInfo(int index) {
    cApplicationInfo.removeAt(index);
  }

  void updateCApplicationInfoAtIndex(
    int index,
    DataLabelValueStruct Function(DataLabelValueStruct) updateFn,
  ) {
    cApplicationInfo[index] = updateFn(_cApplicationInfo[index]);
  }

  void insertAtIndexInCApplicationInfo(int index, DataLabelValueStruct value) {
    cApplicationInfo.insert(index, value);
  }
}
