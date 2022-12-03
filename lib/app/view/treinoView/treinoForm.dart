import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:starting_training/app/dao/alunoDAO.dart';
import 'package:starting_training/app/dao/treinoDAO.dart';
import 'package:starting_training/app/domain/entities/pessoaAluno.dart';
import 'package:starting_training/app/domain/entities/treino.dart';

import '../components/criar_campo_input.dart';

// ignore: must_be_immutable
class TreinoForm extends StatefulWidget {
  TreinoForm({Key? key}) : super(key: key);

  @override
  State<TreinoForm> createState() => _TreinoFormState();
}

class _TreinoFormState extends State<TreinoForm> {
  dynamic id;
  String nome = '';
  String ordem = '';
  String status = '';
  final formKey = GlobalKey<FormState>();
  AlunoDAO alunoDAO = AlunoDAO();
  Aluno? aluno;
  String nomeAluno = 'Selecione o Aluno';

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
    Widget dropdownAluno() {
      return FutureBuilder(
        future: alunoDAO.listarAluno(),
        builder: (context, AsyncSnapshot<List<Aluno>> dados) {
          List<Aluno> alunos = dados.data as List<Aluno>;
          return SizedBox(
            width: 300,
            height: 100,
            child: DropdownButtonFormField<Aluno>(
              isExpanded: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
              hint: Text(nomeAluno),
              items: alunos!.map<DropdownMenuItem<Aluno>>((Aluno aluno) {
                return DropdownMenuItem<Aluno>(
                    value: aluno, child: Text(aluno.nome));
              }).toList(),
              onChanged: (aluno) {
                ///nomeTreino = treino!.nome;
                this.aluno = aluno;
                print(this.aluno!.nome);
              },
            ),
          );
        },
      );
    }

    var argumento = ModalRoute.of(context)?.settings.arguments;

    if (argumento != null) {
      Treino treino = argumento as Treino;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de treino'),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        child: Form(
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
                rotulo: 'Ordem',
                tipo: TextInputType.text,
                vincularCampo: (value) => ordem = value,
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
              dropdownAluno(),
              Container(
                padding: EdgeInsets.only(
                  top: 30,
                  bottom: 20,
                ),
                child: ElevatedButton(
                  child: Text('Salvar Treino'),
                  onPressed: () {
                    treinoDAO.salvarTreino(Treino(
                        nome: nome,
                        ordem: ordem,
                        status: status,
                        aluno: aluno!));
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
