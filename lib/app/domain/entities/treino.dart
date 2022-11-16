import 'package:starting_training/app/domain/entities/exercicio.dart';
import 'package:starting_training/app/domain/entities/pessoaAluno.dart';

class Treino {
  final dynamic id;
  final String ordem;
  final String status;
  final String nome;
  Aluno aluno;

  Treino(
      {this.id,
      required this.ordem,
      required this.status,
      required this.nome,
      required this.aluno});
}
