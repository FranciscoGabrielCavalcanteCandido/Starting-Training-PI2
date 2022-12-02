import 'package:flutter/material.dart';
import 'package:starting_training/app/dao/personalDAO.dart';
import 'package:starting_training/app/domain/entities/pessoaPersonal_trainer.dart';
import '../components/botao.dart';
import '../components/criar_campo_input.dart';

class PerssonalForm extends StatefulWidget {
  const PerssonalForm({Key? key}) : super(key: key);
  @override
  State<PerssonalForm> createState() => _PerssonalFormState();
}

class _PerssonalFormState extends State<PerssonalForm> {
  PersonalDAO personalDAO = PersonalDAO();
  PersonalTreiner? personal;
  dynamic id;
  dynamic nome;
  late String cpfPersonal;
  late String telefone;
  late String endereco;
  late String dataNascimento;
  late String status;
  late String senha;
  late String permissao = 'personal';
  late String cref;
  late String validadeCref;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var argumento = ModalRoute.of(context)?.settings.arguments;
    if (argumento != null) {
      PersonalTreiner personal = argumento as PersonalTreiner;
      id = personal.id;
      nome = personal.nome;
      cpfPersonal = personal.cpf;
      telefone = personal.telefone;
      endereco = personal.endereco;
      dataNascimento = personal.dataNascimento;
      status = personal.status;
      senha = personal.senha;
      permissao = personal.permissao;
      cref = personal.cref;
      validadeCref = personal.validadeCref;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro Personal'),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: <Widget>[
            CampoTexto(
              rotulo: 'Nome',
              tipo: TextInputType.text,
              vincularCampo: (value) => nome = value,
              retornoValidador: 'Campo obrigatório',
              visibilidade: false,
            ),
            CampoTexto(
              rotulo: 'CPF',
              tipo: TextInputType.text,
              vincularCampo: (value) => cpfPersonal = value,
              retornoValidador: 'Campo obrigatório',
              visibilidade: false,
            ),
            CampoTexto(
              rotulo: 'Data de nascimento',
              tipo: TextInputType.datetime,
              vincularCampo: (value) => dataNascimento = value,
              retornoValidador: 'Campo obrigatório',
              visibilidade: false,
            ),
            CampoTexto(
              rotulo: 'Telefone',
              tipo: TextInputType.number,
              vincularCampo: (value) => telefone = value,
              retornoValidador: 'Campo obrigatório',
              visibilidade: false,
            ),
            CampoTexto(
              rotulo: 'Endereço',
              tipo: TextInputType.text,
              vincularCampo: (value) => endereco = value,
              retornoValidador: 'Campo obrigatório',
              visibilidade: false,
            ),
            CampoTexto(
              rotulo: 'Status',
              tipo: TextInputType.text,
              vincularCampo: (value) => status = value,
              retornoValidador: 'Campo obrigatório',
              visibilidade: false,
            ),
            CampoTexto(
              rotulo: 'Senha',
              tipo: TextInputType.text,
              vincularCampo: (value) => senha = value,
              retornoValidador: 'Campo obrigatório',
              visibilidade: false,
            ),
            CampoTexto(
              rotulo: 'Cref',
              tipo: TextInputType.number,
              vincularCampo: (value) => cref = value,
              retornoValidador: 'Campo obrigatório',
              visibilidade: false,
            ),
            CampoTexto(
              rotulo: 'Validade Cref',
              tipo: TextInputType.datetime,
              vincularCampo: (value) => validadeCref = value,
              retornoValidador: 'Campo obrigatório',
              visibilidade: false,
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 30,
                bottom: 20,
              ),
              child: Button(
                  icone: Icon(Icons.add),
                  rotulo: 'Salvar',
                  cor: Colors.deepOrange,
                  borda: StadiumBorder(),
                  acao: () {
                    var validar = formKey.currentState?.validate();
                    if (validar == true) {
                      personalDAO
                          .salvarPersonal(
                            PersonalTreiner(
                              id: id,
                              nome: nome,
                              cpf: cpfPersonal,
                              telefone: telefone,
                              dataNascimento: dataNascimento,
                              endereco: endereco,
                              status: status,
                              validadeCref: validadeCref.toString(),
                              senha: senha,
                              cref: cref,
                              permissao: permissao,
                            ),
                          )
                          .then((value) => Navigator.pop(context));
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
