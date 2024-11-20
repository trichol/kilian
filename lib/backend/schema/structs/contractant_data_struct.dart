// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContractantDataStruct extends FFFirebaseStruct {
  ContractantDataStruct({
    String? nom,
    String? prenom,
    DateTime? date,
    String? signature,
    LocationDataStruct? location,
    String? genre,
    String? phoneNumber,
    String? status,
    String? uid,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nom = nom,
        _prenom = prenom,
        _date = date,
        _signature = signature,
        _location = location,
        _genre = genre,
        _phoneNumber = phoneNumber,
        _status = status,
        _uid = uid,
        super(firestoreUtilData);

  // "nom" field.
  String? _nom;
  String get nom => _nom ?? '';
  set nom(String? val) => _nom = val;

  bool hasNom() => _nom != null;

  // "prenom" field.
  String? _prenom;
  String get prenom => _prenom ?? '';
  set prenom(String? val) => _prenom = val;

  bool hasPrenom() => _prenom != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "signature" field.
  String? _signature;
  String get signature => _signature ?? '';
  set signature(String? val) => _signature = val;

  bool hasSignature() => _signature != null;

  // "location" field.
  LocationDataStruct? _location;
  LocationDataStruct get location => _location ?? LocationDataStruct();
  set location(LocationDataStruct? val) => _location = val;

  void updateLocation(Function(LocationDataStruct) updateFn) {
    updateFn(_location ??= LocationDataStruct());
  }

  bool hasLocation() => _location != null;

  // "genre" field.
  String? _genre;
  String get genre => _genre ?? '';
  set genre(String? val) => _genre = val;

  bool hasGenre() => _genre != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;

  bool hasUid() => _uid != null;

  static ContractantDataStruct fromMap(Map<String, dynamic> data) =>
      ContractantDataStruct(
        nom: data['nom'] as String?,
        prenom: data['prenom'] as String?,
        date: data['date'] as DateTime?,
        signature: data['signature'] as String?,
        location: LocationDataStruct.maybeFromMap(data['location']),
        genre: data['genre'] as String?,
        phoneNumber: data['phone_number'] as String?,
        status: data['status'] as String?,
        uid: data['uid'] as String?,
      );

  static ContractantDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ContractantDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nom': _nom,
        'prenom': _prenom,
        'date': _date,
        'signature': _signature,
        'location': _location?.toMap(),
        'genre': _genre,
        'phone_number': _phoneNumber,
        'status': _status,
        'uid': _uid,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nom': serializeParam(
          _nom,
          ParamType.String,
        ),
        'prenom': serializeParam(
          _prenom,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'signature': serializeParam(
          _signature,
          ParamType.String,
        ),
        'location': serializeParam(
          _location,
          ParamType.DataStruct,
        ),
        'genre': serializeParam(
          _genre,
          ParamType.String,
        ),
        'phone_number': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
      }.withoutNulls;

  static ContractantDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ContractantDataStruct(
        nom: deserializeParam(
          data['nom'],
          ParamType.String,
          false,
        ),
        prenom: deserializeParam(
          data['prenom'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        signature: deserializeParam(
          data['signature'],
          ParamType.String,
          false,
        ),
        location: deserializeStructParam(
          data['location'],
          ParamType.DataStruct,
          false,
          structBuilder: LocationDataStruct.fromSerializableMap,
        ),
        genre: deserializeParam(
          data['genre'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ContractantDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ContractantDataStruct &&
        nom == other.nom &&
        prenom == other.prenom &&
        date == other.date &&
        signature == other.signature &&
        location == other.location &&
        genre == other.genre &&
        phoneNumber == other.phoneNumber &&
        status == other.status &&
        uid == other.uid;
  }

  @override
  int get hashCode => const ListEquality().hash([
        nom,
        prenom,
        date,
        signature,
        location,
        genre,
        phoneNumber,
        status,
        uid
      ]);
}

ContractantDataStruct createContractantDataStruct({
  String? nom,
  String? prenom,
  DateTime? date,
  String? signature,
  LocationDataStruct? location,
  String? genre,
  String? phoneNumber,
  String? status,
  String? uid,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ContractantDataStruct(
      nom: nom,
      prenom: prenom,
      date: date,
      signature: signature,
      location: location ?? (clearUnsetFields ? LocationDataStruct() : null),
      genre: genre,
      phoneNumber: phoneNumber,
      status: status,
      uid: uid,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ContractantDataStruct? updateContractantDataStruct(
  ContractantDataStruct? contractantData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    contractantData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addContractantDataStructData(
  Map<String, dynamic> firestoreData,
  ContractantDataStruct? contractantData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (contractantData == null) {
    return;
  }
  if (contractantData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && contractantData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final contractantDataData =
      getContractantDataFirestoreData(contractantData, forFieldValue);
  final nestedData =
      contractantDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = contractantData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getContractantDataFirestoreData(
  ContractantDataStruct? contractantData, [
  bool forFieldValue = false,
]) {
  if (contractantData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(contractantData.toMap());

  // Handle nested data for "location" field.
  addLocationDataStructData(
    firestoreData,
    contractantData.hasLocation() ? contractantData.location : null,
    'location',
    forFieldValue,
  );

  // Add any Firestore field values
  contractantData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getContractantDataListFirestoreData(
  List<ContractantDataStruct>? contractantDatas,
) =>
    contractantDatas
        ?.map((e) => getContractantDataFirestoreData(e, true))
        .toList() ??
    [];
