import 'package:starting_training/app/domain/entities/exercicio.dart';

class Treino {
  final dynamic id;
  final int ordem;
  final String status;
  final String nome;

  Treino(
      {required this.id,
      required this.ordem,
      required this.status,
      required this.nome,
      });
}
