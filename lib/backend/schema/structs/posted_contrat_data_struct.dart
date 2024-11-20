// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostedContratDataStruct extends FFFirebaseStruct {
  PostedContratDataStruct({
    String? modeleHtmlContrat,
    String? contratPDF,
    ContratDataStruct? contratData,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _modeleHtmlContrat = modeleHtmlContrat,
        _contratPDF = contratPDF,
        _contratData = contratData,
        super(firestoreUtilData);

  // "modeleHtmlContrat" field.
  String? _modeleHtmlContrat;
  String get modeleHtmlContrat => _modeleHtmlContrat ?? '';
  set modeleHtmlContrat(String? val) => _modeleHtmlContrat = val;

  bool hasModeleHtmlContrat() => _modeleHtmlContrat != null;

  // "contratPDF" field.
  String? _contratPDF;
  String get contratPDF => _contratPDF ?? '';
  set contratPDF(String? val) => _contratPDF = val;

  bool hasContratPDF() => _contratPDF != null;

  // "contratData" field.
  ContratDataStruct? _contratData;
  ContratDataStruct get contratData => _contratData ?? ContratDataStruct();
  set contratData(ContratDataStruct? val) => _contratData = val;

  void updateContratData(Function(ContratDataStruct) updateFn) {
    updateFn(_contratData ??= ContratDataStruct());
  }

  bool hasContratData() => _contratData != null;

  static PostedContratDataStruct fromMap(Map<String, dynamic> data) =>
      PostedContratDataStruct(
        modeleHtmlContrat: data['modeleHtmlContrat'] as String?,
        contratPDF: data['contratPDF'] as String?,
        contratData: ContratDataStruct.maybeFromMap(data['contratData']),
      );

  static PostedContratDataStruct? maybeFromMap(dynamic data) => data is Map
      ? PostedContratDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'modeleHtmlContrat': _modeleHtmlContrat,
        'contratPDF': _contratPDF,
        'contratData': _contratData?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'modeleHtmlContrat': serializeParam(
          _modeleHtmlContrat,
          ParamType.String,
        ),
        'contratPDF': serializeParam(
          _contratPDF,
          ParamType.String,
        ),
        'contratData': serializeParam(
          _contratData,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static PostedContratDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PostedContratDataStruct(
        modeleHtmlContrat: deserializeParam(
          data['modeleHtmlContrat'],
          ParamType.String,
          false,
        ),
        contratPDF: deserializeParam(
          data['contratPDF'],
          ParamType.String,
          false,
        ),
        contratData: deserializeStructParam(
          data['contratData'],
          ParamType.DataStruct,
          false,
          structBuilder: ContratDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'PostedContratDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PostedContratDataStruct &&
        modeleHtmlContrat == other.modeleHtmlContrat &&
        contratPDF == other.contratPDF &&
        contratData == other.contratData;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([modeleHtmlContrat, contratPDF, contratData]);
}

PostedContratDataStruct createPostedContratDataStruct({
  String? modeleHtmlContrat,
  String? contratPDF,
  ContratDataStruct? contratData,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PostedContratDataStruct(
      modeleHtmlContrat: modeleHtmlContrat,
      contratPDF: contratPDF,
      contratData:
          contratData ?? (clearUnsetFields ? ContratDataStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PostedContratDataStruct? updatePostedContratDataStruct(
  PostedContratDataStruct? postedContratData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    postedContratData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPostedContratDataStructData(
  Map<String, dynamic> firestoreData,
  PostedContratDataStruct? postedContratData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (postedContratData == null) {
    return;
  }
  if (postedContratData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && postedContratData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final postedContratDataData =
      getPostedContratDataFirestoreData(postedContratData, forFieldValue);
  final nestedData =
      postedContratDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = postedContratData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPostedContratDataFirestoreData(
  PostedContratDataStruct? postedContratData, [
  bool forFieldValue = false,
]) {
  if (postedContratData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(postedContratData.toMap());

  // Handle nested data for "contratData" field.
  addContratDataStructData(
    firestoreData,
    postedContratData.hasContratData() ? postedContratData.contratData : null,
    'contratData',
    forFieldValue,
  );

  // Add any Firestore field values
  postedContratData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPostedContratDataListFirestoreData(
  List<PostedContratDataStruct>? postedContratDatas,
) =>
    postedContratDatas
        ?.map((e) => getPostedContratDataFirestoreData(e, true))
        .toList() ??
    [];
