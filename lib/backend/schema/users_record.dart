import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "adress" field.
  String? _adress;
  String get adress => _adress ?? '';
  bool hasAdress() => _adress != null;

  // "birthday" field.
  DateTime? _birthday;
  DateTime? get birthday => _birthday;
  bool hasBirthday() => _birthday != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "nickname" field.
  String? _nickname;
  String get nickname => _nickname ?? '';
  bool hasNickname() => _nickname != null;

  // "online" field.
  bool? _online;
  bool get online => _online ?? false;
  bool hasOnline() => _online != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "signature" field.
  String? _signature;
  String get signature => _signature ?? '';
  bool hasSignature() => _signature != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "is_complete_registration" field.
  bool? _isCompleteRegistration;
  bool get isCompleteRegistration => _isCompleteRegistration ?? false;
  bool hasIsCompleteRegistration() => _isCompleteRegistration != null;

  // "location" field.
  LocationDataStruct? _location;
  LocationDataStruct get location => _location ?? LocationDataStruct();
  bool hasLocation() => _location != null;

  // "deviceToken" field.
  String? _deviceToken;
  String get deviceToken => _deviceToken ?? '';
  bool hasDeviceToken() => _deviceToken != null;

  // "genre" field.
  String? _genre;
  String get genre => _genre ?? '';
  bool hasGenre() => _genre != null;

  // "fcm_token" field.
  String? _fcmToken;
  String get fcmToken => _fcmToken ?? '';
  bool hasFcmToken() => _fcmToken != null;

  // "contrats" field.
  List<DocumentReference>? _contrats;
  List<DocumentReference> get contrats => _contrats ?? const [];
  bool hasContrats() => _contrats != null;

  void _initializeFields() {
    _adress = snapshotData['adress'] as String?;
    _birthday = snapshotData['birthday'] as DateTime?;
    _email = snapshotData['email'] as String?;
    _name = snapshotData['name'] as String?;
    _nickname = snapshotData['nickname'] as String?;
    _online = snapshotData['online'] as bool?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _signature = snapshotData['signature'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _isCompleteRegistration = snapshotData['is_complete_registration'] as bool?;
    _location = LocationDataStruct.maybeFromMap(snapshotData['location']);
    _deviceToken = snapshotData['deviceToken'] as String?;
    _genre = snapshotData['genre'] as String?;
    _fcmToken = snapshotData['fcm_token'] as String?;
    _contrats = getDataList(snapshotData['contrats']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? adress,
  DateTime? birthday,
  String? email,
  String? name,
  String? nickname,
  bool? online,
  String? phoneNumber,
  String? signature,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  bool? isCompleteRegistration,
  LocationDataStruct? location,
  String? deviceToken,
  String? genre,
  String? fcmToken,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'adress': adress,
      'birthday': birthday,
      'email': email,
      'name': name,
      'nickname': nickname,
      'online': online,
      'phone_number': phoneNumber,
      'signature': signature,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'is_complete_registration': isCompleteRegistration,
      'location': LocationDataStruct().toMap(),
      'deviceToken': deviceToken,
      'genre': genre,
      'fcm_token': fcmToken,
    }.withoutNulls,
  );

  // Handle nested data for "location" field.
  addLocationDataStructData(firestoreData, location, 'location');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.adress == e2?.adress &&
        e1?.birthday == e2?.birthday &&
        e1?.email == e2?.email &&
        e1?.name == e2?.name &&
        e1?.nickname == e2?.nickname &&
        e1?.online == e2?.online &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.signature == e2?.signature &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.isCompleteRegistration == e2?.isCompleteRegistration &&
        e1?.location == e2?.location &&
        e1?.deviceToken == e2?.deviceToken &&
        e1?.genre == e2?.genre &&
        e1?.fcmToken == e2?.fcmToken &&
        listEquality.equals(e1?.contrats, e2?.contrats);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.adress,
        e?.birthday,
        e?.email,
        e?.name,
        e?.nickname,
        e?.online,
        e?.phoneNumber,
        e?.signature,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.isCompleteRegistration,
        e?.location,
        e?.deviceToken,
        e?.genre,
        e?.fcmToken,
        e?.contrats
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
