import 'package:flutter/material.dart';
import 'package:starting_training/app/domain/entities/exercicio.dart';

class Treino {
  int id;
  int ordem;
  String status;
  String nome;
  List<Exercicio> exercicio = [];

  Treino(
      {required this.id,
      required this.ordem,
      required this.status,
      required this.nome,
      required this.exercicio});
}
