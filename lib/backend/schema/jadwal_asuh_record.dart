import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JadwalAsuhRecord extends FirestoreRecord {
  JadwalAsuhRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Tanggal" field.
  DateTime? _tanggal;
  DateTime? get tanggal => _tanggal;
  bool hasTanggal() => _tanggal != null;

  // "Waktu" field.
  DateTime? _waktu;
  DateTime? get waktu => _waktu;
  bool hasWaktu() => _waktu != null;

  // "Durasi" field.
  int? _durasi;
  int get durasi => _durasi ?? 0;
  bool hasDurasi() => _durasi != null;

  // "Wali" field.
  String? _wali;
  String get wali => _wali ?? '';
  bool hasWali() => _wali != null;

  // "Tugas" field.
  List<DocumentReference>? _tugas;
  List<DocumentReference> get tugas => _tugas ?? const [];
  bool hasTugas() => _tugas != null;

  // "Jam" field.
  double? _jam;
  double get jam => _jam ?? 0.0;
  bool hasJam() => _jam != null;

  // "Username" field.
  DocumentReference? _username;
  DocumentReference? get username => _username;
  bool hasUsername() => _username != null;

  void _initializeFields() {
    _tanggal = snapshotData['Tanggal'] as DateTime?;
    _waktu = snapshotData['Waktu'] as DateTime?;
    _durasi = castToType<int>(snapshotData['Durasi']);
    _wali = snapshotData['Wali'] as String?;
    _tugas = getDataList(snapshotData['Tugas']);
    _jam = castToType<double>(snapshotData['Jam']);
    _username = snapshotData['Username'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Jadwal_asuh');

  static Stream<JadwalAsuhRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JadwalAsuhRecord.fromSnapshot(s));

  static Future<JadwalAsuhRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JadwalAsuhRecord.fromSnapshot(s));

  static JadwalAsuhRecord fromSnapshot(DocumentSnapshot snapshot) =>
      JadwalAsuhRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JadwalAsuhRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JadwalAsuhRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JadwalAsuhRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JadwalAsuhRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJadwalAsuhRecordData({
  DateTime? tanggal,
  DateTime? waktu,
  int? durasi,
  String? wali,
  double? jam,
  DocumentReference? username,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Tanggal': tanggal,
      'Waktu': waktu,
      'Durasi': durasi,
      'Wali': wali,
      'Jam': jam,
      'Username': username,
    }.withoutNulls,
  );

  return firestoreData;
}

class JadwalAsuhRecordDocumentEquality implements Equality<JadwalAsuhRecord> {
  const JadwalAsuhRecordDocumentEquality();

  @override
  bool equals(JadwalAsuhRecord? e1, JadwalAsuhRecord? e2) {
    const listEquality = ListEquality();
    return e1?.tanggal == e2?.tanggal &&
        e1?.waktu == e2?.waktu &&
        e1?.durasi == e2?.durasi &&
        e1?.wali == e2?.wali &&
        listEquality.equals(e1?.tugas, e2?.tugas) &&
        e1?.jam == e2?.jam &&
        e1?.username == e2?.username;
  }

  @override
  int hash(JadwalAsuhRecord? e) => const ListEquality().hash([
        e?.tanggal,
        e?.waktu,
        e?.durasi,
        e?.wali,
        e?.tugas,
        e?.jam,
        e?.username
      ]);

  @override
  bool isValidKey(Object? o) => o is JadwalAsuhRecord;
}
