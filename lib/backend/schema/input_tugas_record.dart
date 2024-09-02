import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InputTugasRecord extends FirestoreRecord {
  InputTugasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Jadwal_ref" field.
  DocumentReference? _jadwalRef;
  DocumentReference? get jadwalRef => _jadwalRef;
  bool hasJadwalRef() => _jadwalRef != null;

  // "Value" field.
  String? _value;
  String get value => _value ?? '';
  bool hasValue() => _value != null;

  void _initializeFields() {
    _jadwalRef = snapshotData['Jadwal_ref'] as DocumentReference?;
    _value = snapshotData['Value'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Input_Tugas');

  static Stream<InputTugasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InputTugasRecord.fromSnapshot(s));

  static Future<InputTugasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InputTugasRecord.fromSnapshot(s));

  static InputTugasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InputTugasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InputTugasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InputTugasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InputTugasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InputTugasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInputTugasRecordData({
  DocumentReference? jadwalRef,
  String? value,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Jadwal_ref': jadwalRef,
      'Value': value,
    }.withoutNulls,
  );

  return firestoreData;
}

class InputTugasRecordDocumentEquality implements Equality<InputTugasRecord> {
  const InputTugasRecordDocumentEquality();

  @override
  bool equals(InputTugasRecord? e1, InputTugasRecord? e2) {
    return e1?.jadwalRef == e2?.jadwalRef && e1?.value == e2?.value;
  }

  @override
  int hash(InputTugasRecord? e) =>
      const ListEquality().hash([e?.jadwalRef, e?.value]);

  @override
  bool isValidKey(Object? o) => o is InputTugasRecord;
}
