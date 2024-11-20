// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContratDataStruct extends FFFirebaseStruct {
  ContratDataStruct({
    String? title,
    String? type,
    DateTime? dateCreation,
    DateTime? dateValidation,
    String? status,
    List<ContractantDataStruct>? contractantsData,
    List<ObjetContratStruct>? objetsContrat,
    String? auteur,
    String? location,
    String? url,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _type = type,
        _dateCreation = dateCreation,
        _dateValidation = dateValidation,
        _status = status,
        _contractantsData = contractantsData,
        _objetsContrat = objetsContrat,
        _auteur = auteur,
        _location = location,
        _url = url,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "date_creation" field.
  DateTime? _dateCreation;
  DateTime? get dateCreation => _dateCreation;
  set dateCreation(DateTime? val) => _dateCreation = val;

  bool hasDateCreation() => _dateCreation != null;

  // "date_validation" field.
  DateTime? _dateValidation;
  DateTime? get dateValidation => _dateValidation;
  set dateValidation(DateTime? val) => _dateValidation = val;

  bool hasDateValidation() => _dateValidation != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "contractantsData" field.
  List<ContractantDataStruct>? _contractantsData;
  List<ContractantDataStruct> get contractantsData =>
      _contractantsData ?? const [];
  set contractantsData(List<ContractantDataStruct>? val) =>
      _contractantsData = val;

  void updateContractantsData(Function(List<ContractantDataStruct>) updateFn) {
    updateFn(_contractantsData ??= []);
  }

  bool hasContractantsData() => _contractantsData != null;

  // "objetsContrat" field.
  List<ObjetContratStruct>? _objetsContrat;
  List<ObjetContratStruct> get objetsContrat => _objetsContrat ?? const [];
  set objetsContrat(List<ObjetContratStruct>? val) => _objetsContrat = val;

  void updateObjetsContrat(Function(List<ObjetContratStruct>) updateFn) {
    updateFn(_objetsContrat ??= []);
  }

  bool hasObjetsContrat() => _objetsContrat != null;

  // "auteur" field.
  String? _auteur;
  String get auteur => _auteur ?? '';
  set auteur(String? val) => _auteur = val;

  bool hasAuteur() => _auteur != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;

  bool hasLocation() => _location != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  static ContratDataStruct fromMap(Map<String, dynamic> data) =>
      ContratDataStruct(
        title: data['title'] as String?,
        type: data['type'] as String?,
        dateCreation: data['date_creation'] as DateTime?,
        dateValidation: data['date_validation'] as DateTime?,
        status: data['status'] as String?,
        contractantsData: getStructList(
          data['contractantsData'],
          ContractantDataStruct.fromMap,
        ),
        objetsContrat: getStructList(
          data['objetsContrat'],
          ObjetContratStruct.fromMap,
        ),
        auteur: data['auteur'] as String?,
        location: data['location'] as String?,
        url: data['url'] as String?,
      );

  static ContratDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ContratDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'type': _type,
        'date_creation': _dateCreation,
        'date_validation': _dateValidation,
        'status': _status,
        'contractantsData': _contractantsData?.map((e) => e.toMap()).toList(),
        'objetsContrat': _objetsContrat?.map((e) => e.toMap()).toList(),
        'auteur': _auteur,
        'location': _location,
        'url': _url,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'date_creation': serializeParam(
          _dateCreation,
          ParamType.DateTime,
        ),
        'date_validation': serializeParam(
          _dateValidation,
          ParamType.DateTime,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'contractantsData': serializeParam(
          _contractantsData,
          ParamType.DataStruct,
          isList: true,
        ),
        'objetsContrat': serializeParam(
          _objetsContrat,
          ParamType.DataStruct,
          isList: true,
        ),
        'auteur': serializeParam(
          _auteur,
          ParamType.String,
        ),
        'location': serializeParam(
          _location,
          ParamType.String,
        ),
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
      }.withoutNulls;

  static ContratDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ContratDataStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        dateCreation: deserializeParam(
          data['date_creation'],
          ParamType.DateTime,
          false,
        ),
        dateValidation: deserializeParam(
          data['date_validation'],
          ParamType.DateTime,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        contractantsData: deserializeStructParam<ContractantDataStruct>(
          data['contractantsData'],
          ParamType.DataStruct,
          true,
          structBuilder: ContractantDataStruct.fromSerializableMap,
        ),
        objetsContrat: deserializeStructParam<ObjetContratStruct>(
          data['objetsContrat'],
          ParamType.DataStruct,
          true,
          structBuilder: ObjetContratStruct.fromSerializableMap,
        ),
        auteur: deserializeParam(
          data['auteur'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.String,
          false,
        ),
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ContratDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ContratDataStruct &&
        title == other.title &&
        type == other.type &&
        dateCreation == other.dateCreation &&
        dateValidation == other.dateValidation &&
        status == other.status &&
        listEquality.equals(contractantsData, other.contractantsData) &&
        listEquality.equals(objetsContrat, other.objetsContrat) &&
        auteur == other.auteur &&
        location == other.location &&
        url == other.url;
  }

  @override
  int get hashCode => const ListEquality().hash([
        title,
        type,
        dateCreation,
        dateValidation,
        status,
        contractantsData,
        objetsContrat,
        auteur,
        location,
        url
      ]);
}

ContratDataStruct createContratDataStruct({
  String? title,
  String? type,
  DateTime? dateCreation,
  DateTime? dateValidation,
  String? status,
  String? auteur,
  String? location,
  String? url,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ContratDataStruct(
      title: title,
      type: type,
      dateCreation: dateCreation,
      dateValidation: dateValidation,
      status: status,
      auteur: auteur,
      location: location,
      url: url,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ContratDataStruct? updateContratDataStruct(
  ContratDataStruct? contratData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    contratData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addContratDataStructData(
  Map<String, dynamic> firestoreData,
  ContratDataStruct? contratData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (contratData == null) {
    return;
  }
  if (contratData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && contratData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final contratDataData =
      getContratDataFirestoreData(contratData, forFieldValue);
  final nestedData =
      contratDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = contratData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getContratDataFirestoreData(
  ContratDataStruct? contratData, [
  bool forFieldValue = false,
]) {
  if (contratData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(contratData.toMap());

  // Add any Firestore field values
  contratData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getContratDataListFirestoreData(
  List<ContratDataStruct>? contratDatas,
) =>
    contratDatas?.map((e) => getContratDataFirestoreData(e, true)).toList() ??
    [];
