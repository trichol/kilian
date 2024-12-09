import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContratsRecord extends FirestoreRecord {
  ContratsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "contratData" field.
  ContratDataStruct? _contratData;
  ContratDataStruct get contratData => _contratData ?? ContratDataStruct();
  bool hasContratData() => _contratData != null;

  void _initializeFields() {
    _contratData = ContratDataStruct.maybeFromMap(snapshotData['contratData']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('contrats');

  static Stream<ContratsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContratsRecord.fromSnapshot(s));

  static Future<ContratsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContratsRecord.fromSnapshot(s));

  static ContratsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContratsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContratsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContratsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContratsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContratsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContratsRecordData({
  ContratDataStruct? contratData,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'contratData': ContratDataStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "contratData" field.
  addContratDataStructData(firestoreData, contratData, 'contratData');

  return firestoreData;
}

class ContratsRecordDocumentEquality implements Equality<ContratsRecord> {
  const ContratsRecordDocumentEquality();

  @override
  bool equals(ContratsRecord? e1, ContratsRecord? e2) {
    return e1?.contratData == e2?.contratData;
  }

  @override
  int hash(ContratsRecord? e) => const ListEquality().hash([e?.contratData]);

  @override
  bool isValidKey(Object? o) => o is ContratsRecord;
}
