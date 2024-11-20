// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ObjetContratStruct extends FFFirebaseStruct {
  ObjetContratStruct({
    String? titre,
    String? description,
    String? prix,
    String? categorie,
    String? sousCategorie,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _titre = titre,
        _description = description,
        _prix = prix,
        _categorie = categorie,
        _sousCategorie = sousCategorie,
        super(firestoreUtilData);

  // "titre" field.
  String? _titre;
  String get titre => _titre ?? '';
  set titre(String? val) => _titre = val;

  bool hasTitre() => _titre != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "prix" field.
  String? _prix;
  String get prix => _prix ?? '';
  set prix(String? val) => _prix = val;

  bool hasPrix() => _prix != null;

  // "categorie" field.
  String? _categorie;
  String get categorie => _categorie ?? '';
  set categorie(String? val) => _categorie = val;

  bool hasCategorie() => _categorie != null;

  // "sousCategorie" field.
  String? _sousCategorie;
  String get sousCategorie => _sousCategorie ?? '';
  set sousCategorie(String? val) => _sousCategorie = val;

  bool hasSousCategorie() => _sousCategorie != null;

  static ObjetContratStruct fromMap(Map<String, dynamic> data) =>
      ObjetContratStruct(
        titre: data['titre'] as String?,
        description: data['description'] as String?,
        prix: data['prix'] as String?,
        categorie: data['categorie'] as String?,
        sousCategorie: data['sousCategorie'] as String?,
      );

  static ObjetContratStruct? maybeFromMap(dynamic data) => data is Map
      ? ObjetContratStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'titre': _titre,
        'description': _description,
        'prix': _prix,
        'categorie': _categorie,
        'sousCategorie': _sousCategorie,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'titre': serializeParam(
          _titre,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'prix': serializeParam(
          _prix,
          ParamType.String,
        ),
        'categorie': serializeParam(
          _categorie,
          ParamType.String,
        ),
        'sousCategorie': serializeParam(
          _sousCategorie,
          ParamType.String,
        ),
      }.withoutNulls;

  static ObjetContratStruct fromSerializableMap(Map<String, dynamic> data) =>
      ObjetContratStruct(
        titre: deserializeParam(
          data['titre'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        prix: deserializeParam(
          data['prix'],
          ParamType.String,
          false,
        ),
        categorie: deserializeParam(
          data['categorie'],
          ParamType.String,
          false,
        ),
        sousCategorie: deserializeParam(
          data['sousCategorie'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ObjetContratStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ObjetContratStruct &&
        titre == other.titre &&
        description == other.description &&
        prix == other.prix &&
        categorie == other.categorie &&
        sousCategorie == other.sousCategorie;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([titre, description, prix, categorie, sousCategorie]);
}

ObjetContratStruct createObjetContratStruct({
  String? titre,
  String? description,
  String? prix,
  String? categorie,
  String? sousCategorie,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ObjetContratStruct(
      titre: titre,
      description: description,
      prix: prix,
      categorie: categorie,
      sousCategorie: sousCategorie,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ObjetContratStruct? updateObjetContratStruct(
  ObjetContratStruct? objetContrat, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    objetContrat
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addObjetContratStructData(
  Map<String, dynamic> firestoreData,
  ObjetContratStruct? objetContrat,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (objetContrat == null) {
    return;
  }
  if (objetContrat.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && objetContrat.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final objetContratData =
      getObjetContratFirestoreData(objetContrat, forFieldValue);
  final nestedData =
      objetContratData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = objetContrat.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getObjetContratFirestoreData(
  ObjetContratStruct? objetContrat, [
  bool forFieldValue = false,
]) {
  if (objetContrat == null) {
    return {};
  }
  final firestoreData = mapToFirestore(objetContrat.toMap());

  // Add any Firestore field values
  objetContrat.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getObjetContratListFirestoreData(
  List<ObjetContratStruct>? objetContrats,
) =>
    objetContrats?.map((e) => getObjetContratFirestoreData(e, true)).toList() ??
    [];
