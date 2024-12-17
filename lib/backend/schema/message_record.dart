import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessageRecord extends FirestoreRecord {
  MessageRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "phone_receiver" field.
  String? _phoneReceiver;
  String get phoneReceiver => _phoneReceiver ?? '';
  bool hasPhoneReceiver() => _phoneReceiver != null;

  // "uid_sender" field.
  DocumentReference? _uidSender;
  DocumentReference? get uidSender => _uidSender;
  bool hasUidSender() => _uidSender != null;

  // "contratId" field.
  DocumentReference? _contratId;
  DocumentReference? get contratId => _contratId;
  bool hasContratId() => _contratId != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "contenu" field.
  String? _contenu;
  String get contenu => _contenu ?? '';
  bool hasContenu() => _contenu != null;

  // "objet" field.
  String? _objet;
  String get objet => _objet ?? '';
  bool hasObjet() => _objet != null;

  // "datetime_sent" field.
  DateTime? _datetimeSent;
  DateTime? get datetimeSent => _datetimeSent;
  bool hasDatetimeSent() => _datetimeSent != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _phoneReceiver = snapshotData['phone_receiver'] as String?;
    _uidSender = snapshotData['uid_sender'] as DocumentReference?;
    _contratId = snapshotData['contratId'] as DocumentReference?;
    _type = snapshotData['type'] as String?;
    _contenu = snapshotData['contenu'] as String?;
    _objet = snapshotData['objet'] as String?;
    _datetimeSent = snapshotData['datetime_sent'] as DateTime?;
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('message');

  static Stream<MessageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessageRecord.fromSnapshot(s));

  static Future<MessageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessageRecord.fromSnapshot(s));

  static MessageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessageRecordData({
  String? phoneReceiver,
  DocumentReference? uidSender,
  DocumentReference? contratId,
  String? type,
  String? contenu,
  String? objet,
  DateTime? datetimeSent,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'phone_receiver': phoneReceiver,
      'uid_sender': uidSender,
      'contratId': contratId,
      'type': type,
      'contenu': contenu,
      'objet': objet,
      'datetime_sent': datetimeSent,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessageRecordDocumentEquality implements Equality<MessageRecord> {
  const MessageRecordDocumentEquality();

  @override
  bool equals(MessageRecord? e1, MessageRecord? e2) {
    return e1?.phoneReceiver == e2?.phoneReceiver &&
        e1?.uidSender == e2?.uidSender &&
        e1?.contratId == e2?.contratId &&
        e1?.type == e2?.type &&
        e1?.contenu == e2?.contenu &&
        e1?.objet == e2?.objet &&
        e1?.datetimeSent == e2?.datetimeSent &&
        e1?.status == e2?.status;
  }

  @override
  int hash(MessageRecord? e) => const ListEquality().hash([
        e?.phoneReceiver,
        e?.uidSender,
        e?.contratId,
        e?.type,
        e?.contenu,
        e?.objet,
        e?.datetimeSent,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is MessageRecord;
}
