// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SmsDataStruct extends FFFirebaseStruct {
  SmsDataStruct({
    String? message,
    String? recipientPhoneNumber,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _message = message,
        _recipientPhoneNumber = recipientPhoneNumber,
        super(firestoreUtilData);

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  // "recipient_phone_number" field.
  String? _recipientPhoneNumber;
  String get recipientPhoneNumber => _recipientPhoneNumber ?? '';
  set recipientPhoneNumber(String? val) => _recipientPhoneNumber = val;

  bool hasRecipientPhoneNumber() => _recipientPhoneNumber != null;

  static SmsDataStruct fromMap(Map<String, dynamic> data) => SmsDataStruct(
        message: data['message'] as String?,
        recipientPhoneNumber: data['recipient_phone_number'] as String?,
      );

  static SmsDataStruct? maybeFromMap(dynamic data) =>
      data is Map ? SmsDataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'message': _message,
        'recipient_phone_number': _recipientPhoneNumber,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'recipient_phone_number': serializeParam(
          _recipientPhoneNumber,
          ParamType.String,
        ),
      }.withoutNulls;

  static SmsDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      SmsDataStruct(
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        recipientPhoneNumber: deserializeParam(
          data['recipient_phone_number'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SmsDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SmsDataStruct &&
        message == other.message &&
        recipientPhoneNumber == other.recipientPhoneNumber;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([message, recipientPhoneNumber]);
}

SmsDataStruct createSmsDataStruct({
  String? message,
  String? recipientPhoneNumber,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SmsDataStruct(
      message: message,
      recipientPhoneNumber: recipientPhoneNumber,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SmsDataStruct? updateSmsDataStruct(
  SmsDataStruct? smsData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    smsData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSmsDataStructData(
  Map<String, dynamic> firestoreData,
  SmsDataStruct? smsData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (smsData == null) {
    return;
  }
  if (smsData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && smsData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final smsDataData = getSmsDataFirestoreData(smsData, forFieldValue);
  final nestedData = smsDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = smsData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSmsDataFirestoreData(
  SmsDataStruct? smsData, [
  bool forFieldValue = false,
]) {
  if (smsData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(smsData.toMap());

  // Add any Firestore field values
  smsData.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSmsDataListFirestoreData(
  List<SmsDataStruct>? smsDatas,
) =>
    smsDatas?.map((e) => getSmsDataFirestoreData(e, true)).toList() ?? [];
