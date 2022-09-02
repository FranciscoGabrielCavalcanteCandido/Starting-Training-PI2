import 'package:starting_training/app/domain/entities/pessoa.dart';

import 'pessoaPersonal_trainer.dart';

class Aluno extends Pessoa {
  final int frequencia;
  final PersonalTreiner personal;

  Aluno(
      {required id,
      required nome,
      required CPF,
      required telefone,
      required dataNascimento,
      required endereco,
      required status,
      required senha,
      required permissao,
      required this.frequencia,
      required this.personal})
      : super(
            id: id,
            nome: nome,
            CPF: CPF,
            telefone: telefone,
            dataNascimento: dataNascimento,
            endereco: endereco,
            status: status,
            senha: senha,
            permissao: permissao);
}
