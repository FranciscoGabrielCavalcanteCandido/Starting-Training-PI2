import 'package:starting_training/app/domain/entities/pessoa.dart';

class PersonalTreiner extends Pessoa {
  String cref;
  DateTime validadeCref;

  PersonalTreiner(
      {required this.cref,
      required this.validadeCref,
      required String CPF,
      required String nome,
      required DateTime dataNascimento,
      required int id,
      required String telefone,
      required String academia,
      required String endereco,
      required String status})
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
