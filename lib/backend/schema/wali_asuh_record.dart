import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WaliAsuhRecord extends FirestoreRecord {
  WaliAsuhRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "wali" field.
  DocumentReference? _wali;
  DocumentReference? get wali => _wali;
  bool hasWali() => _wali != null;

  void _initializeFields() {
    _wali = snapshotData['wali'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('waliAsuh');

  static Stream<WaliAsuhRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WaliAsuhRecord.fromSnapshot(s));

  static Future<WaliAsuhRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WaliAsuhRecord.fromSnapshot(s));

  static WaliAsuhRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WaliAsuhRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WaliAsuhRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WaliAsuhRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WaliAsuhRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WaliAsuhRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWaliAsuhRecordData({
  DocumentReference? wali,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'wali': wali,
    }.withoutNulls,
  );

  return firestoreData;
}

class WaliAsuhRecordDocumentEquality implements Equality<WaliAsuhRecord> {
  const WaliAsuhRecordDocumentEquality();

  @override
  bool equals(WaliAsuhRecord? e1, WaliAsuhRecord? e2) {
    return e1?.wali == e2?.wali;
  }

  @override
  int hash(WaliAsuhRecord? e) => const ListEquality().hash([e?.wali]);

  @override
  bool isValidKey(Object? o) => o is WaliAsuhRecord;
}
