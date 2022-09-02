import 'dart:html';

import 'package:starting_training/app/domain/entities/pessoaAluno.dart';

class Medida {
  final dynamic id;
  final double altura;
  final double peso;
  final double cintura;
  final double braco;
  final double quadril;
  final double perna;
  DateTime dataAvaliacao;
  double imc;
  Aluno aluno;

  Medida(
      {required this.id,
      required this.altura,
      required this.peso,
      required this.cintura,
      required this.braco,
      required this.quadril,
      required this.perna,
      required this.dataAvaliacao,
      required this.imc,
      required this.aluno});
}
