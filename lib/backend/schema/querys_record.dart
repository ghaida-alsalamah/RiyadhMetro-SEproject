import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuerysRecord extends FirestoreRecord {
  QuerysRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
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

  // "satus" field.
  String? _satus;
  String get satus => _satus ?? '';
  bool hasSatus() => _satus != null;

  // "numbers" field.
  int? _numbers;
  int get numbers => _numbers ?? 0;
  bool hasNumbers() => _numbers != null;

  // "response" field.
  String? _response;
  String get response => _response ?? '';
  bool hasResponse() => _response != null;

  void _initializeFields() {
    _email = snapshotData['Email'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _message = snapshotData['message'] as String?;
    _satus = snapshotData['satus'] as String?;
    _numbers = castToType<int>(snapshotData['numbers']);
    _response = snapshotData['response'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('querys');

  static Stream<QuerysRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuerysRecord.fromSnapshot(s));

  static Future<QuerysRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuerysRecord.fromSnapshot(s));

  static QuerysRecord fromSnapshot(DocumentSnapshot snapshot) => QuerysRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuerysRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuerysRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuerysRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuerysRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuerysRecordData({
  String? email,
  DateTime? timestamp,
  String? message,
  String? satus,
  int? numbers,
  String? response,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Email': email,
      'timestamp': timestamp,
      'message': message,
      'satus': satus,
      'numbers': numbers,
      'response': response,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuerysRecordDocumentEquality implements Equality<QuerysRecord> {
  const QuerysRecordDocumentEquality();

  @override
  bool equals(QuerysRecord? e1, QuerysRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.timestamp == e2?.timestamp &&
        e1?.message == e2?.message &&
        e1?.satus == e2?.satus &&
        e1?.numbers == e2?.numbers &&
        e1?.response == e2?.response;
  }

  @override
  int hash(QuerysRecord? e) => const ListEquality().hash(
      [e?.email, e?.timestamp, e?.message, e?.satus, e?.numbers, e?.response]);

  @override
  bool isValidKey(Object? o) => o is QuerysRecord;
}
