import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:starting_training/app/domain/entities/pessoa.dart';

class PersonalTreiner extends Pessoa {
  String cref;
  DateTime validadeCref;


  PersonalTreiner(
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
      required idAlunos,
      required this.cref,
      required this.validadeCref,
      })
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
