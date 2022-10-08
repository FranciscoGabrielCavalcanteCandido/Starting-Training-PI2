import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:starting_training/app/dao/personalDAO.dart';
import 'package:starting_training/app/domain/entities/pessoaPersonal_trainer.dart';
import 'package:starting_training/app/model/sqlite/conexao.dart';
import 'package:starting_training/app/view/components/criarCampoInput.dart';

class RegistrationPersonalPage extends StatelessWidget {
  PersonalDAO personalDAO = PersonalDAO();
  PersonalTreiner? personal;
  dynamic id;
  dynamic nome;
  String? CPF;
  String? telefone;
  String? endereco;
  String? dataNascimento;
  String? status;
  String? senha;
  String permissao = 'personal';
  String? cref;
  String? validadeCref;

  Widget _criarCampo(String rotulo, String? dica,
      ValueChanged<String>? vincularValor, String? valorInicial) {
    return TextFormField(
      decoration: InputDecoration(label: Text(rotulo), hintText: dica),
      onChanged: vincularValor,
      initialValue: valorInicial ??= '',
    );
  }

  @override
  Widget build(BuildContext context) {
    var argumento = ModalRoute.of(context)?.settings.arguments;
    if (argumento != null) {
      Map<String, Object?> personal = argumento as Map<String, Object?>;
      id = personal['id'] as int;
      nome = personal['nome'] as String;
      CPF = personal['cpf'] as String;
      telefone = personal['telefone'] as String;
      endereco = personal['endereco'] as String;
      dataNascimento = personal['dataNascimento'] as String;
      status = personal['status'] as String;
      senha = personal['senha'] as String;
      permissao = personal['permissao'] as String;
      cref = personal['cref'] as String;
      validadeCref = personal['validadeCref'] as String;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Cadastro de Personal'),
        centerTitle: true,
      ),
      body: Form(
        child: ListView(
          children: <Widget>[
            CampoTexto(
                rotulo: 'Nome',
                tipo: TextInputType.text,
                vincularCampo: (valorDigitado) => nome = valorDigitado),
            CampoTexto(
                rotulo: 'CPF',
                tipo: TextInputType.text,
                vincularCampo: (valorDigitado) => CPF = valorDigitado),
            CampoTexto(
                rotulo: 'Telefone',
                tipo: TextInputType.number,
                vincularCampo: (valorDigitado) => telefone = valorDigitado),
            CampoTexto(
                rotulo: 'Data nascimento',
                tipo: TextInputType.datetime,
                vincularCampo: (valorDigitado) =>
                    dataNascimento = valorDigitado),
            CampoTexto(
                rotulo: 'Endereço',
                tipo: TextInputType.text,
                vincularCampo: (valorDigitado) => endereco = valorDigitado),
            CampoTexto(
                rotulo: 'Status',
                tipo: TextInputType.text,
                vincularCampo: (valorDigitado) => status = valorDigitado),
            CampoTexto(
                rotulo: 'Senha',
                tipo: TextInputType.text,
                vincularCampo: (valorDigitado) => senha = valorDigitado),
            CampoTexto(
                rotulo: 'Permissao',
                tipo: TextInputType.text,
                vincularCampo: (valodrDigitado) => permissao = valodrDigitado),
            CampoTexto(
                rotulo: 'Cref',
                tipo: TextInputType.number,
                vincularCampo: (valorDigitado) => cref = valorDigitado),
            CampoTexto(
                rotulo: 'Validade Cref',
                tipo: TextInputType.text,
                vincularCampo: (valorDigitado) => validadeCref = valorDigitado),
            Container(
              padding: const EdgeInsets.only(
                top: 30,
                bottom: 20,
              ),
              child: ElevatedButton(
                child: const Text('Salvar Personal'),
                onPressed: () {
                  personalDAO.salvarPersonal(
                    PersonalTreiner(
                      id: id,
                      nome: nome!,
                      CPF: CPF!,
                      telefone: telefone!,
                      dataNascimento: dataNascimento!,
                      endereco: endereco!,
                      status: status!,
                      validadeCref: validadeCref.toString(),
                      senha: senha!,
                      cref: cref!,
                      permissao: permissao,
                    ),
                  );
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
