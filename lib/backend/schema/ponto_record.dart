import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PontoRecord extends FirestoreRecord {
  PontoRecord._(
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

  // "idUser" field.
  String? _idUser;
  String get idUser => _idUser ?? '';
  bool hasIdUser() => _idUser != null;

  // "entrada" field.
  DateTime? _entrada;
  DateTime? get entrada => _entrada;
  bool hasEntrada() => _entrada != null;

  // "saida" field.
  DateTime? _saida;
  DateTime? get saida => _saida;
  bool hasSaida() => _saida != null;

  // "idPonto" field.
  String? _idPonto;
  String get idPonto => _idPonto ?? '';
  bool hasIdPonto() => _idPonto != null;

  void _initializeFields() {
    _idEmpresa = snapshotData['idEmpresa'] as String?;
    _nomeEmpresa = snapshotData['nomeEmpresa'] as String?;
    _idUser = snapshotData['idUser'] as String?;
    _entrada = snapshotData['entrada'] as DateTime?;
    _saida = snapshotData['saida'] as DateTime?;
    _idPonto = snapshotData['idPonto'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ponto');

  static Stream<PontoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PontoRecord.fromSnapshot(s));

  static Future<PontoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PontoRecord.fromSnapshot(s));

  static PontoRecord fromSnapshot(DocumentSnapshot snapshot) => PontoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PontoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PontoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PontoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PontoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPontoRecordData({
  String? idEmpresa,
  String? nomeEmpresa,
  String? idUser,
  DateTime? entrada,
  DateTime? saida,
  String? idPonto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'idEmpresa': idEmpresa,
      'nomeEmpresa': nomeEmpresa,
      'idUser': idUser,
      'entrada': entrada,
      'saida': saida,
      'idPonto': idPonto,
    }.withoutNulls,
  );

  return firestoreData;
}

class PontoRecordDocumentEquality implements Equality<PontoRecord> {
  const PontoRecordDocumentEquality();

  @override
  bool equals(PontoRecord? e1, PontoRecord? e2) {
    return e1?.idEmpresa == e2?.idEmpresa &&
        e1?.nomeEmpresa == e2?.nomeEmpresa &&
        e1?.idUser == e2?.idUser &&
        e1?.entrada == e2?.entrada &&
        e1?.saida == e2?.saida &&
        e1?.idPonto == e2?.idPonto;
  }

  @override
  int hash(PontoRecord? e) => const ListEquality().hash([
        e?.idEmpresa,
        e?.nomeEmpresa,
        e?.idUser,
        e?.entrada,
        e?.saida,
        e?.idPonto
      ]);

  @override
  bool isValidKey(Object? o) => o is PontoRecord;
}
