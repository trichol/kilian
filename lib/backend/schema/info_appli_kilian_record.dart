import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InfoAppliKilianRecord extends FirestoreRecord {
  InfoAppliKilianRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "item" field.
  DataLabelValueStruct? _item;
  DataLabelValueStruct get item => _item ?? DataLabelValueStruct();
  bool hasItem() => _item != null;

  void _initializeFields() {
    _item = snapshotData['item'] is DataLabelValueStruct
        ? snapshotData['item']
        : DataLabelValueStruct.maybeFromMap(snapshotData['item']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('infoAppliKilian');

  static Stream<InfoAppliKilianRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InfoAppliKilianRecord.fromSnapshot(s));

  static Future<InfoAppliKilianRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InfoAppliKilianRecord.fromSnapshot(s));

  static InfoAppliKilianRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InfoAppliKilianRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InfoAppliKilianRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InfoAppliKilianRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InfoAppliKilianRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InfoAppliKilianRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInfoAppliKilianRecordData({
  DataLabelValueStruct? item,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'item': DataLabelValueStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "item" field.
  addDataLabelValueStructData(firestoreData, item, 'item');

  return firestoreData;
}

class InfoAppliKilianRecordDocumentEquality
    implements Equality<InfoAppliKilianRecord> {
  const InfoAppliKilianRecordDocumentEquality();

  @override
  bool equals(InfoAppliKilianRecord? e1, InfoAppliKilianRecord? e2) {
    return e1?.item == e2?.item;
  }

  @override
  int hash(InfoAppliKilianRecord? e) => const ListEquality().hash([e?.item]);

  @override
  bool isValidKey(Object? o) => o is InfoAppliKilianRecord;
}
