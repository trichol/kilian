// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SocialNetworkUserDataTypeStruct extends FFFirebaseStruct {
  SocialNetworkUserDataTypeStruct({
    String? name,
    String? nickname,
    String? phoneNumber,
    String? adress,
    DateTime? birthday,
    String? gender,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _nickname = nickname,
        _phoneNumber = phoneNumber,
        _adress = adress,
        _birthday = birthday,
        _gender = gender,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "nickname" field.
  String? _nickname;
  String get nickname => _nickname ?? '';
  set nickname(String? val) => _nickname = val;

  bool hasNickname() => _nickname != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  // "adress" field.
  String? _adress;
  String get adress => _adress ?? '';
  set adress(String? val) => _adress = val;

  bool hasAdress() => _adress != null;

  // "birthday" field.
  DateTime? _birthday;
  DateTime? get birthday => _birthday;
  set birthday(DateTime? val) => _birthday = val;

  bool hasBirthday() => _birthday != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;

  bool hasGender() => _gender != null;

  static SocialNetworkUserDataTypeStruct fromMap(Map<String, dynamic> data) =>
      SocialNetworkUserDataTypeStruct(
        name: data['name'] as String?,
        nickname: data['nickname'] as String?,
        phoneNumber: data['phone_number'] as String?,
        adress: data['adress'] as String?,
        birthday: data['birthday'] as DateTime?,
        gender: data['gender'] as String?,
      );

  static SocialNetworkUserDataTypeStruct? maybeFromMap(dynamic data) => data
          is Map
      ? SocialNetworkUserDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'nickname': _nickname,
        'phone_number': _phoneNumber,
        'adress': _adress,
        'birthday': _birthday,
        'gender': _gender,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'nickname': serializeParam(
          _nickname,
          ParamType.String,
        ),
        'phone_number': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'adress': serializeParam(
          _adress,
          ParamType.String,
        ),
        'birthday': serializeParam(
          _birthday,
          ParamType.DateTime,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
      }.withoutNulls;

  static SocialNetworkUserDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SocialNetworkUserDataTypeStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        nickname: deserializeParam(
          data['nickname'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
        adress: deserializeParam(
          data['adress'],
          ParamType.String,
          false,
        ),
        birthday: deserializeParam(
          data['birthday'],
          ParamType.DateTime,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SocialNetworkUserDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SocialNetworkUserDataTypeStruct &&
        name == other.name &&
        nickname == other.nickname &&
        phoneNumber == other.phoneNumber &&
        adress == other.adress &&
        birthday == other.birthday &&
        gender == other.gender;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, nickname, phoneNumber, adress, birthday, gender]);
}

SocialNetworkUserDataTypeStruct createSocialNetworkUserDataTypeStruct({
  String? name,
  String? nickname,
  String? phoneNumber,
  String? adress,
  DateTime? birthday,
  String? gender,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SocialNetworkUserDataTypeStruct(
      name: name,
      nickname: nickname,
      phoneNumber: phoneNumber,
      adress: adress,
      birthday: birthday,
      gender: gender,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SocialNetworkUserDataTypeStruct? updateSocialNetworkUserDataTypeStruct(
  SocialNetworkUserDataTypeStruct? socialNetworkUserDataType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    socialNetworkUserDataType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSocialNetworkUserDataTypeStructData(
  Map<String, dynamic> firestoreData,
  SocialNetworkUserDataTypeStruct? socialNetworkUserDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (socialNetworkUserDataType == null) {
    return;
  }
  if (socialNetworkUserDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      socialNetworkUserDataType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final socialNetworkUserDataTypeData =
      getSocialNetworkUserDataTypeFirestoreData(
          socialNetworkUserDataType, forFieldValue);
  final nestedData =
      socialNetworkUserDataTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      socialNetworkUserDataType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSocialNetworkUserDataTypeFirestoreData(
  SocialNetworkUserDataTypeStruct? socialNetworkUserDataType, [
  bool forFieldValue = false,
]) {
  if (socialNetworkUserDataType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(socialNetworkUserDataType.toMap());

  // Add any Firestore field values
  socialNetworkUserDataType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSocialNetworkUserDataTypeListFirestoreData(
  List<SocialNetworkUserDataTypeStruct>? socialNetworkUserDataTypes,
) =>
    socialNetworkUserDataTypes
        ?.map((e) => getSocialNetworkUserDataTypeFirestoreData(e, true))
        .toList() ??
    [];
