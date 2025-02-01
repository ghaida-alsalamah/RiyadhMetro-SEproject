import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdminqRecord extends FirestoreRecord {
  AdminqRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _email = snapshotData['Email'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _message = snapshotData['message'] as String?;
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Adminq');

  static Stream<AdminqRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdminqRecord.fromSnapshot(s));

  static Future<AdminqRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdminqRecord.fromSnapshot(s));

  static AdminqRecord fromSnapshot(DocumentSnapshot snapshot) => AdminqRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdminqRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdminqRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdminqRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdminqRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdminqRecordData({
  String? email,
  DateTime? timestamp,
  String? message,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Email': email,
      'timestamp': timestamp,
      'message': message,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdminqRecordDocumentEquality implements Equality<AdminqRecord> {
  const AdminqRecordDocumentEquality();

  @override
  bool equals(AdminqRecord? e1, AdminqRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.timestamp == e2?.timestamp &&
        e1?.message == e2?.message &&
        e1?.status == e2?.status;
  }

  @override
  int hash(AdminqRecord? e) => const ListEquality()
      .hash([e?.email, e?.timestamp, e?.message, e?.status]);

  @override
  bool isValidKey(Object? o) => o is AdminqRecord;
}
