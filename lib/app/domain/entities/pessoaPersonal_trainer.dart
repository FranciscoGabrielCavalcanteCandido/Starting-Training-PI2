import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:starting_training/app/domain/entities/pessoa.dart';

class PersonalTreiner extends Pessoa {
  final String cref;
  dynamic validadeCref;

  PersonalTreiner({
    id,
    required nome,
    required cpf,
    required telefone,
    required dataNascimento,
    required endereco,
    required status,
    required senha,
    required permissao,
    required this.cref,
    required this.validadeCref,
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
