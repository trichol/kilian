import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ObjetContratRecord extends FirestoreRecord {
  ObjetContratRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "titre" field.
  String? _titre;
  String get titre => _titre ?? '';
  bool hasTitre() => _titre != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "prix" field.
  String? _prix;
  String get prix => _prix ?? '';
  bool hasPrix() => _prix != null;

  // "categorie" field.
  String? _categorie;
  String get categorie => _categorie ?? '';
  bool hasCategorie() => _categorie != null;

  // "sousCategorie" field.
  String? _sousCategorie;
  String get sousCategorie => _sousCategorie ?? '';
  bool hasSousCategorie() => _sousCategorie != null;

  void _initializeFields() {
    _titre = snapshotData['titre'] as String?;
    _description = snapshotData['description'] as String?;
    _prix = snapshotData['prix'] as String?;
    _categorie = snapshotData['categorie'] as String?;
    _sousCategorie = snapshotData['sousCategorie'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('objetContrat');

  static Stream<ObjetContratRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ObjetContratRecord.fromSnapshot(s));

  static Future<ObjetContratRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ObjetContratRecord.fromSnapshot(s));

  static ObjetContratRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ObjetContratRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ObjetContratRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ObjetContratRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ObjetContratRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ObjetContratRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createObjetContratRecordData({
  String? titre,
  String? description,
  String? prix,
  String? categorie,
  String? sousCategorie,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titre': titre,
      'description': description,
      'prix': prix,
      'categorie': categorie,
      'sousCategorie': sousCategorie,
    }.withoutNulls,
  );

  return firestoreData;
}

class ObjetContratRecordDocumentEquality
    implements Equality<ObjetContratRecord> {
  const ObjetContratRecordDocumentEquality();

  @override
  bool equals(ObjetContratRecord? e1, ObjetContratRecord? e2) {
    return e1?.titre == e2?.titre &&
        e1?.description == e2?.description &&
        e1?.prix == e2?.prix &&
        e1?.categorie == e2?.categorie &&
        e1?.sousCategorie == e2?.sousCategorie;
  }

  @override
  int hash(ObjetContratRecord? e) => const ListEquality().hash(
      [e?.titre, e?.description, e?.prix, e?.categorie, e?.sousCategorie]);

  @override
  bool isValidKey(Object? o) => o is ObjetContratRecord;
}
