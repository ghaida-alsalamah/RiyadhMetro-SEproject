import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JourneysRecord extends FirestoreRecord {
  JourneysRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "FromStation" field.
  String? _fromStation;
  String get fromStation => _fromStation ?? '';
  bool hasFromStation() => _fromStation != null;

  // "ToStation" field.
  String? _toStation;
  String get toStation => _toStation ?? '';
  bool hasToStation() => _toStation != null;

  // "TicketType" field.
  String? _ticketType;
  String get ticketType => _ticketType ?? '';
  bool hasTicketType() => _ticketType != null;

  // "TimeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  void _initializeFields() {
    _fromStation = snapshotData['FromStation'] as String?;
    _toStation = snapshotData['ToStation'] as String?;
    _ticketType = snapshotData['TicketType'] as String?;
    _timeStamp = snapshotData['TimeStamp'] as DateTime?;
    _userID = snapshotData['userID'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Journeys');

  static Stream<JourneysRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JourneysRecord.fromSnapshot(s));

  static Future<JourneysRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JourneysRecord.fromSnapshot(s));

  static JourneysRecord fromSnapshot(DocumentSnapshot snapshot) =>
      JourneysRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JourneysRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JourneysRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JourneysRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JourneysRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJourneysRecordData({
  String? fromStation,
  String? toStation,
  String? ticketType,
  DateTime? timeStamp,
  String? userID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'FromStation': fromStation,
      'ToStation': toStation,
      'TicketType': ticketType,
      'TimeStamp': timeStamp,
      'userID': userID,
    }.withoutNulls,
  );

  return firestoreData;
}

class JourneysRecordDocumentEquality implements Equality<JourneysRecord> {
  const JourneysRecordDocumentEquality();

  @override
  bool equals(JourneysRecord? e1, JourneysRecord? e2) {
    return e1?.fromStation == e2?.fromStation &&
        e1?.toStation == e2?.toStation &&
        e1?.ticketType == e2?.ticketType &&
        e1?.timeStamp == e2?.timeStamp &&
        e1?.userID == e2?.userID;
  }

  @override
  int hash(JourneysRecord? e) => const ListEquality().hash(
      [e?.fromStation, e?.toStation, e?.ticketType, e?.timeStamp, e?.userID]);

  @override
  bool isValidKey(Object? o) => o is JourneysRecord;
}
