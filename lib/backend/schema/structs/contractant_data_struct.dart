// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ContractantDataStruct extends FFFirebaseStruct {
  ContractantDataStruct({
    String? nom,
    String? prenom,
    String? genre,
    String? phoneNumber,
    String? status,
    String? uid,
    DateTime? dateSignature,
    String? signature,
    bool? estContratTelecharger,
    String? email,
    String? adresse,
    String? type,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nom = nom,
        _prenom = prenom,
        _genre = genre,
        _phoneNumber = phoneNumber,
        _status = status,
        _uid = uid,
        _dateSignature = dateSignature,
        _signature = signature,
        _estContratTelecharger = estContratTelecharger,
        _email = email,
        _adresse = adresse,
        _type = type,
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

  // "date_signature" field.
  DateTime? _dateSignature;
  DateTime? get dateSignature => _dateSignature;
  set dateSignature(DateTime? val) => _dateSignature = val;

  bool hasDateSignature() => _dateSignature != null;

  // "signature" field.
  String? _signature;
  String get signature => _signature ?? '';
  set signature(String? val) => _signature = val;

  bool hasSignature() => _signature != null;

  // "est_contrat_telecharger" field.
  bool? _estContratTelecharger;
  bool get estContratTelecharger => _estContratTelecharger ?? false;
  set estContratTelecharger(bool? val) => _estContratTelecharger = val;

  bool hasEstContratTelecharger() => _estContratTelecharger != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "adresse" field.
  String? _adresse;
  String get adresse => _adresse ?? '';
  set adresse(String? val) => _adresse = val;

  bool hasAdresse() => _adresse != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  static ContractantDataStruct fromMap(Map<String, dynamic> data) =>
      ContractantDataStruct(
        nom: data['nom'] as String?,
        prenom: data['prenom'] as String?,
        genre: data['genre'] as String?,
        phoneNumber: data['phone_number'] as String?,
        status: data['status'] as String?,
        uid: data['uid'] as String?,
        dateSignature: data['date_signature'] as DateTime?,
        signature: data['signature'] as String?,
        estContratTelecharger: data['est_contrat_telecharger'] as bool?,
        email: data['email'] as String?,
        adresse: data['adresse'] as String?,
        type: data['type'] as String?,
      );

  static ContractantDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ContractantDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nom': _nom,
        'prenom': _prenom,
        'genre': _genre,
        'phone_number': _phoneNumber,
        'status': _status,
        'uid': _uid,
        'date_signature': _dateSignature,
        'signature': _signature,
        'est_contrat_telecharger': _estContratTelecharger,
        'email': _email,
        'adresse': _adresse,
        'type': _type,
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
        'date_signature': serializeParam(
          _dateSignature,
          ParamType.DateTime,
        ),
        'signature': serializeParam(
          _signature,
          ParamType.String,
        ),
        'est_contrat_telecharger': serializeParam(
          _estContratTelecharger,
          ParamType.bool,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'adresse': serializeParam(
          _adresse,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
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
        dateSignature: deserializeParam(
          data['date_signature'],
          ParamType.DateTime,
          false,
        ),
        signature: deserializeParam(
          data['signature'],
          ParamType.String,
          false,
        ),
        estContratTelecharger: deserializeParam(
          data['est_contrat_telecharger'],
          ParamType.bool,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        adresse: deserializeParam(
          data['adresse'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
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
        genre == other.genre &&
        phoneNumber == other.phoneNumber &&
        status == other.status &&
        uid == other.uid &&
        dateSignature == other.dateSignature &&
        signature == other.signature &&
        estContratTelecharger == other.estContratTelecharger &&
        email == other.email &&
        adresse == other.adresse &&
        type == other.type;
  }

  @override
  int get hashCode => const ListEquality().hash([
        nom,
        prenom,
        genre,
        phoneNumber,
        status,
        uid,
        dateSignature,
        signature,
        estContratTelecharger,
        email,
        adresse,
        type
      ]);
}

ContractantDataStruct createContractantDataStruct({
  String? nom,
  String? prenom,
  String? genre,
  String? phoneNumber,
  String? status,
  String? uid,
  DateTime? dateSignature,
  String? signature,
  bool? estContratTelecharger,
  String? email,
  String? adresse,
  String? type,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ContractantDataStruct(
      nom: nom,
      prenom: prenom,
      genre: genre,
      phoneNumber: phoneNumber,
      status: status,
      uid: uid,
      dateSignature: dateSignature,
      signature: signature,
      estContratTelecharger: estContratTelecharger,
      email: email,
      adresse: adresse,
      type: type,
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
