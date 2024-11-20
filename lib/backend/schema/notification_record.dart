import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationRecord extends FirestoreRecord {
  NotificationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "date_creation" field.
  DateTime? _dateCreation;
  DateTime? get dateCreation => _dateCreation;
  bool hasDateCreation() => _dateCreation != null;

  // "uid_from" field.
  String? _uidFrom;
  String get uidFrom => _uidFrom ?? '';
  bool hasUidFrom() => _uidFrom != null;

  // "notificationType" field.
  String? _notificationType;
  String get notificationType => _notificationType ?? '';
  bool hasNotificationType() => _notificationType != null;

  // "iconUrl" field.
  String? _iconUrl;
  String get iconUrl => _iconUrl ?? '';
  bool hasIconUrl() => _iconUrl != null;

  // "linkAction" field.
  String? _linkAction;
  String get linkAction => _linkAction ?? '';
  bool hasLinkAction() => _linkAction != null;

  // "isRead" field.
  bool? _isRead;
  bool get isRead => _isRead ?? false;
  bool hasIsRead() => _isRead != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _title = snapshotData['title'] as String?;
    _message = snapshotData['message'] as String?;
    _dateCreation = snapshotData['date_creation'] as DateTime?;
    _uidFrom = snapshotData['uid_from'] as String?;
    _notificationType = snapshotData['notificationType'] as String?;
    _iconUrl = snapshotData['iconUrl'] as String?;
    _linkAction = snapshotData['linkAction'] as String?;
    _isRead = snapshotData['isRead'] as bool?;
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notification');

  static Stream<NotificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationRecord.fromSnapshot(s));

  static Future<NotificationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationRecord.fromSnapshot(s));

  static NotificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationRecordData({
  String? uid,
  String? title,
  String? message,
  DateTime? dateCreation,
  String? uidFrom,
  String? notificationType,
  String? iconUrl,
  String? linkAction,
  bool? isRead,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'title': title,
      'message': message,
      'date_creation': dateCreation,
      'uid_from': uidFrom,
      'notificationType': notificationType,
      'iconUrl': iconUrl,
      'linkAction': linkAction,
      'isRead': isRead,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationRecordDocumentEquality
    implements Equality<NotificationRecord> {
  const NotificationRecordDocumentEquality();

  @override
  bool equals(NotificationRecord? e1, NotificationRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.title == e2?.title &&
        e1?.message == e2?.message &&
        e1?.dateCreation == e2?.dateCreation &&
        e1?.uidFrom == e2?.uidFrom &&
        e1?.notificationType == e2?.notificationType &&
        e1?.iconUrl == e2?.iconUrl &&
        e1?.linkAction == e2?.linkAction &&
        e1?.isRead == e2?.isRead &&
        e1?.user == e2?.user;
  }

  @override
  int hash(NotificationRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.title,
        e?.message,
        e?.dateCreation,
        e?.uidFrom,
        e?.notificationType,
        e?.iconUrl,
        e?.linkAction,
        e?.isRead,
        e?.user
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationRecord;
}
