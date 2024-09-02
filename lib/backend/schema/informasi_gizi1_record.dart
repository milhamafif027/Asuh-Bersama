import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InformasiGizi1Record extends FirestoreRecord {
  InformasiGizi1Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Gambar1" field.
  String? _gambar1;
  String get gambar1 => _gambar1 ?? '';
  bool hasGambar1() => _gambar1 != null;

  // "Gambar2" field.
  String? _gambar2;
  String get gambar2 => _gambar2 ?? '';
  bool hasGambar2() => _gambar2 != null;

  // "Gambar3" field.
  String? _gambar3;
  String get gambar3 => _gambar3 ?? '';
  bool hasGambar3() => _gambar3 != null;

  // "Id_Gizi" field.
  int? _idGizi;
  int get idGizi => _idGizi ?? 0;
  bool hasIdGizi() => _idGizi != null;

  // "RentangUmur" field.
  String? _rentangUmur;
  String get rentangUmur => _rentangUmur ?? '';
  bool hasRentangUmur() => _rentangUmur != null;

  void _initializeFields() {
    _gambar1 = snapshotData['Gambar1'] as String?;
    _gambar2 = snapshotData['Gambar2'] as String?;
    _gambar3 = snapshotData['Gambar3'] as String?;
    _idGizi = castToType<int>(snapshotData['Id_Gizi']);
    _rentangUmur = snapshotData['RentangUmur'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('InformasiGizi1');

  static Stream<InformasiGizi1Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InformasiGizi1Record.fromSnapshot(s));

  static Future<InformasiGizi1Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InformasiGizi1Record.fromSnapshot(s));

  static InformasiGizi1Record fromSnapshot(DocumentSnapshot snapshot) =>
      InformasiGizi1Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InformasiGizi1Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InformasiGizi1Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InformasiGizi1Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InformasiGizi1Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInformasiGizi1RecordData({
  String? gambar1,
  String? gambar2,
  String? gambar3,
  int? idGizi,
  String? rentangUmur,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Gambar1': gambar1,
      'Gambar2': gambar2,
      'Gambar3': gambar3,
      'Id_Gizi': idGizi,
      'RentangUmur': rentangUmur,
    }.withoutNulls,
  );

  return firestoreData;
}

class InformasiGizi1RecordDocumentEquality
    implements Equality<InformasiGizi1Record> {
  const InformasiGizi1RecordDocumentEquality();

  @override
  bool equals(InformasiGizi1Record? e1, InformasiGizi1Record? e2) {
    return e1?.gambar1 == e2?.gambar1 &&
        e1?.gambar2 == e2?.gambar2 &&
        e1?.gambar3 == e2?.gambar3 &&
        e1?.idGizi == e2?.idGizi &&
        e1?.rentangUmur == e2?.rentangUmur;
  }

  @override
  int hash(InformasiGizi1Record? e) => const ListEquality()
      .hash([e?.gambar1, e?.gambar2, e?.gambar3, e?.idGizi, e?.rentangUmur]);

  @override
  bool isValidKey(Object? o) => o is InformasiGizi1Record;
}
