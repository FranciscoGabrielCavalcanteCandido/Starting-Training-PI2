import 'package:starting_training/app/domain/entities/pessoa.dart';

class Aluno extends Pessoa {
  int frequencia;
  int idMedidas;
  int idPersonal;

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
      required permissao,
      required this.frequencia,
      required this.idMedidas,
      required this.idPersonal})
      : super(
            id: id,
            nome: nome,
            CPF: CPF,
            telefone: telefone,
            academia: academia,
            dataNascimento: dataNascimento,
            endereco: endereco,
            status: status,
            senha: senha,
            permissao: permissao);
}
