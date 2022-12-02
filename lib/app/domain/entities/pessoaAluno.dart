import 'package:starting_training/app/domain/entities/pessoa.dart';
import 'package:starting_training/app/domain/entities/pessoaPersonal_trainer.dart';

class Aluno extends Pessoa {
  final int frequencia;
  late PersonalTreiner personal;

  Aluno({
    id,
    required this.personal,
    required nome,
    required cpf,
    required telefone,
    required dataNascimento,
    required endereco,
    required status,
    required senha,
    required permissao,
    required this.frequencia,
  }) : super(
            id: id,
            nome: nome,
            cpf: cpf,
            telefone: telefone,
            dataNascimento: dataNascimento,
            endereco: endereco,
            status: status,
            senha: senha,
            permissao: permissao);
}
