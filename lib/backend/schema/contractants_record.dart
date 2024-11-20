import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContractantsRecord extends FirestoreRecord {
  ContractantsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "contractantData" field.
  ContractantDataStruct? _contractantData;
  ContractantDataStruct get contractantData =>
      _contractantData ?? ContractantDataStruct();
  bool hasContractantData() => _contractantData != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _contractantData =
        ContractantDataStruct.maybeFromMap(snapshotData['contractantData']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('contractants');

  static Stream<ContractantsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContractantsRecord.fromSnapshot(s));

  static Future<ContractantsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContractantsRecord.fromSnapshot(s));

  static ContractantsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContractantsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContractantsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContractantsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContractantsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContractantsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContractantsRecordData({
  DocumentReference? user,
  ContractantDataStruct? contractantData,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'contractantData': ContractantDataStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "contractantData" field.
  addContractantDataStructData(
      firestoreData, contractantData, 'contractantData');

  return firestoreData;
}

class ContractantsRecordDocumentEquality
    implements Equality<ContractantsRecord> {
  const ContractantsRecordDocumentEquality();

  @override
  bool equals(ContractantsRecord? e1, ContractantsRecord? e2) {
    return e1?.user == e2?.user && e1?.contractantData == e2?.contractantData;
  }

  @override
  int hash(ContractantsRecord? e) =>
      const ListEquality().hash([e?.user, e?.contractantData]);

  @override
  bool isValidKey(Object? o) => o is ContractantsRecord;
}
