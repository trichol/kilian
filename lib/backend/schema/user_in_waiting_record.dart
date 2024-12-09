import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserInWaitingRecord extends FirestoreRecord {
  UserInWaitingRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "message" field.
  DataLabelValueStruct? _message;
  DataLabelValueStruct get message => _message ?? DataLabelValueStruct();
  bool hasMessage() => _message != null;

  void _initializeFields() {
    _message = DataLabelValueStruct.maybeFromMap(snapshotData['message']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userInWaiting');

  static Stream<UserInWaitingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserInWaitingRecord.fromSnapshot(s));

  static Future<UserInWaitingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserInWaitingRecord.fromSnapshot(s));

  static UserInWaitingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserInWaitingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserInWaitingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserInWaitingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserInWaitingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserInWaitingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserInWaitingRecordData({
  DataLabelValueStruct? message,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message': DataLabelValueStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "message" field.
  addDataLabelValueStructData(firestoreData, message, 'message');

  return firestoreData;
}

class UserInWaitingRecordDocumentEquality
    implements Equality<UserInWaitingRecord> {
  const UserInWaitingRecordDocumentEquality();

  @override
  bool equals(UserInWaitingRecord? e1, UserInWaitingRecord? e2) {
    return e1?.message == e2?.message;
  }

  @override
  int hash(UserInWaitingRecord? e) => const ListEquality().hash([e?.message]);

  @override
  bool isValidKey(Object? o) => o is UserInWaitingRecord;
}
