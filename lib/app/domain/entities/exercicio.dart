import 'package:starting_training/app/domain/entities/treino.dart';

class Exercicio {
  final dynamic id;
  final String nome;
  final double peso;
  final int serie;
  final String categoria;
  final String tipoExercicio;
  final int repeticao;
  Treino treino;

  Exercicio(
      {required this.id,
      required this.nome,
      required this.peso,
      required this.serie,
      required this.categoria,
      required this.tipoExercicio,
      required this.repeticao,
      required this.treino});
}
