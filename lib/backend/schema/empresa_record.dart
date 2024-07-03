import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmpresaRecord extends FirestoreRecord {
  EmpresaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "idEmpresa" field.
  String? _idEmpresa;
  String get idEmpresa => _idEmpresa ?? '';
  bool hasIdEmpresa() => _idEmpresa != null;

  // "nomeEmpresa" field.
  String? _nomeEmpresa;
  String get nomeEmpresa => _nomeEmpresa ?? '';
  bool hasNomeEmpresa() => _nomeEmpresa != null;

  void _initializeFields() {
    _idEmpresa = snapshotData['idEmpresa'] as String?;
    _nomeEmpresa = snapshotData['nomeEmpresa'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('empresa');

  static Stream<EmpresaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EmpresaRecord.fromSnapshot(s));

  static Future<EmpresaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EmpresaRecord.fromSnapshot(s));

  static EmpresaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EmpresaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EmpresaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EmpresaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EmpresaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EmpresaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEmpresaRecordData({
  String? idEmpresa,
  String? nomeEmpresa,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'idEmpresa': idEmpresa,
      'nomeEmpresa': nomeEmpresa,
    }.withoutNulls,
  );

  return firestoreData;
}

class EmpresaRecordDocumentEquality implements Equality<EmpresaRecord> {
  const EmpresaRecordDocumentEquality();

  @override
  bool equals(EmpresaRecord? e1, EmpresaRecord? e2) {
    return e1?.idEmpresa == e2?.idEmpresa && e1?.nomeEmpresa == e2?.nomeEmpresa;
  }

  @override
  int hash(EmpresaRecord? e) =>
      const ListEquality().hash([e?.idEmpresa, e?.nomeEmpresa]);

  @override
  bool isValidKey(Object? o) => o is EmpresaRecord;
}
