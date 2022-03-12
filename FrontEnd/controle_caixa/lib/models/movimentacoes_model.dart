import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class MovimentacoesModel {
  final double credito;
  final double debito;
  final String descricao;
  final Timestamp datahora;

  MovimentacoesModel({
    required this.credito,
    required this.debito,
    required this.descricao,
    required this.datahora,
  });

  Map<String, dynamic> toMap() {
    return {
      'credito': credito,
      'debito': debito,
      'descricao': descricao,
      'datahora': datahora.millisecondsSinceEpoch,
    };
  }

  factory MovimentacoesModel.fromMap(Map<String, dynamic> map) {
    return MovimentacoesModel(
      credito: map['credito']?.toDouble() ?? 0.0,
      debito: map['debito']?.toDouble() ?? 0.0,
      descricao: map['descricao'] ?? '',
      datahora: map['datahora'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MovimentacoesModel.fromJson(String source) =>
      MovimentacoesModel.fromMap(json.decode(source));
}
