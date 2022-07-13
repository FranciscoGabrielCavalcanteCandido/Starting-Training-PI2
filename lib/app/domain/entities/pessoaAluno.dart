import 'package:starting_training/app/domain/entities/pessoa.dart';

class Aluno extends Pessoa {
  int frequencia;

  Aluno(
      {required id,
      required nome,
      required CPF,
      required telefone,
      required academia,
      required dataNascimento,
      required endereco,
      required status,
      required senha,
      required email,
      required this.frequencia})
      : super(
            id: id,
            nome: nome,
            CPF: CPF,
            telefone: telefone,
            academia: academia,
            dataNascimento: dataNascimento,
            endereco: endereco,
            status: status,
            email: email,
            senha: senha);
}
