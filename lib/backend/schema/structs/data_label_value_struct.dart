// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DataLabelValueStruct extends FFFirebaseStruct {
  DataLabelValueStruct({
    String? label,
    String? value,
    String? valueBis,
    String? valueTer,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _label = label,
        _value = value,
        _valueBis = valueBis,
        _valueTer = valueTer,
        super(firestoreUtilData);

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;

  bool hasLabel() => _label != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  set value(String? val) => _value = val;

  bool hasValue() => _value != null;

  // "value_bis" field.
  String? _valueBis;
  String get valueBis => _valueBis ?? '';
  set valueBis(String? val) => _valueBis = val;

  bool hasValueBis() => _valueBis != null;

  // "value_ter" field.
  String? _valueTer;
  String get valueTer => _valueTer ?? '';
  set valueTer(String? val) => _valueTer = val;

  bool hasValueTer() => _valueTer != null;

  static DataLabelValueStruct fromMap(Map<String, dynamic> data) =>
      DataLabelValueStruct(
        label: data['label'] as String?,
        value: data['value'] as String?,
        valueBis: data['value_bis'] as String?,
        valueTer: data['value_ter'] as String?,
      );

  static DataLabelValueStruct? maybeFromMap(dynamic data) => data is Map
      ? DataLabelValueStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'label': _label,
        'value': _value,
        'value_bis': _valueBis,
        'value_ter': _valueTer,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.String,
        ),
        'value_bis': serializeParam(
          _valueBis,
          ParamType.String,
        ),
        'value_ter': serializeParam(
          _valueTer,
          ParamType.String,
        ),
      }.withoutNulls;

  static DataLabelValueStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataLabelValueStruct(
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.String,
          false,
        ),
        valueBis: deserializeParam(
          data['value_bis'],
          ParamType.String,
          false,
        ),
        valueTer: deserializeParam(
          data['value_ter'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DataLabelValueStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataLabelValueStruct &&
        label == other.label &&
        value == other.value &&
        valueBis == other.valueBis &&
        valueTer == other.valueTer;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([label, value, valueBis, valueTer]);
}

DataLabelValueStruct createDataLabelValueStruct({
  String? label,
  String? value,
  String? valueBis,
  String? valueTer,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DataLabelValueStruct(
      label: label,
      value: value,
      valueBis: valueBis,
      valueTer: valueTer,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DataLabelValueStruct? updateDataLabelValueStruct(
  DataLabelValueStruct? dataLabelValue, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dataLabelValue
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDataLabelValueStructData(
  Map<String, dynamic> firestoreData,
  DataLabelValueStruct? dataLabelValue,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dataLabelValue == null) {
    return;
  }
  if (dataLabelValue.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dataLabelValue.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dataLabelValueData =
      getDataLabelValueFirestoreData(dataLabelValue, forFieldValue);
  final nestedData =
      dataLabelValueData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dataLabelValue.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDataLabelValueFirestoreData(
  DataLabelValueStruct? dataLabelValue, [
  bool forFieldValue = false,
]) {
  if (dataLabelValue == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dataLabelValue.toMap());

  // Add any Firestore field values
  dataLabelValue.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDataLabelValueListFirestoreData(
  List<DataLabelValueStruct>? dataLabelValues,
) =>
    dataLabelValues
        ?.map((e) => getDataLabelValueFirestoreData(e, true))
        .toList() ??
    [];
