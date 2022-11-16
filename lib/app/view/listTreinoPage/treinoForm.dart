import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:starting_training/app/dao/treinoDAO.dart';
import 'package:starting_training/app/domain/entities/pessoaAluno.dart';
import 'package:starting_training/app/domain/entities/treino.dart';

// ignore: must_be_immutable
class TreinoForm extends StatefulWidget {
  TreinoForm({Key? key}) : super(key: key);

  @override
  State<TreinoForm> createState() => _TreinoFormState();
}

class _TreinoFormState extends State<TreinoForm> {
  dynamic id;
  late String nome;
  late String ordem;
  late String status;
  late Aluno aluno;

  TreinoDAO treinoDAO = TreinoDAO();

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
      Treino treino = argumento as Treino;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de treino'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              treinoDAO.salvarTreino(Treino(
                  nome: nome, ordem: ordem, status: status, aluno: aluno));
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Form(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
