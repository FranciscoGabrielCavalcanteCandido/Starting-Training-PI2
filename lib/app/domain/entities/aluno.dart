import 'package:starting_training/app/domain/entities/pessoa.dart';

class Aluno extends Pessoa {
  int frequencia;

  Aluno(
      {required String CPF,
      required String nome,
      required DateTime dataNascimento,
      required int id,
      required String telefone,
      required String academia,
      required String endereco,
      required String status,
      required this.frequencia})
      : super(
            CPF: CPF,
            nome: nome,
            dataNascimento: dataNascimento,
            id: id,
            telefone: telefone,
            academia: academia,
            endereco: endereco,
            status: status);
}
