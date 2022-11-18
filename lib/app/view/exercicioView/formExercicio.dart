import 'package:flutter/material.dart';
import 'package:starting_training/app/dao/exercicioDAO.dart';

import '../../dao/treinoDAO.dart';
import '../../domain/entities/exercicio.dart';
import '../../domain/entities/treino.dart';
import '../components/botao.dart';
import '../components/criar_campo_input.dart';

class ExercicioForm extends StatefulWidget {
  const ExercicioForm({Key? key}) : super(key: key);
  @override
  State<ExercicioForm> createState() => _ExercicioFormState();
}

class _ExercicioFormState extends State<ExercicioForm> {
  ExercicioDAO exercicioDAO = ExercicioDAO();
  TreinoDAO treinoDAO = TreinoDAO();

  dynamic id;
  String? nome;
  double? peso;
  int? serie;
  int? repeticao;
  dynamic treinoId = 0;
  Treino? treino;
  String nomeTreino = 'Selecione o Treino';

  @override
  Widget build(BuildContext context) {
    Widget dropdownTreino() {
      return FutureBuilder(
        future: treinoDAO.listarTreinos(),
        builder: (context, AsyncSnapshot<List<Treino>> dados) {
          var treinos = dados.data;
          return SizedBox(
            width: 300,
            height: 100,
            child: DropdownButtonFormField<Treino>(
              isExpanded: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
              hint: Text(nomeTreino),
              items: treinos!.map<DropdownMenuItem<Treino>>((Treino treino) {
                return DropdownMenuItem<Treino>(
                    value: treino, child: Text(treino.nome));
              }).toList(),
              onChanged: (treino) {
                ///nomeTreino = treino!.nome;
                this.treino = treino;
                print(this.treino!.nome);
              },
            ),
          );
        },
      );
    }

    final formKey = GlobalKey<FormState>();
    var argumento = ModalRoute.of(context)?.settings.arguments;
    if (argumento != null) {
      Map<String, Object?> exercicio = argumento as Map<String, Object?>;
      id = exercicio['id_exercicio'] as int;
      nome = exercicio['nome'] as String;
      peso = exercicio['peso'] as double;
      serie = exercicio['serie'] as int;
      repeticao = exercicio['repeticao'] as int;
      treinoId = exercicio['id_treino'];
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Exercicios'),
      ),
      body: Center(
        child: Container(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CampoTexto(
                    rotulo: 'Nome',
                    tipo: TextInputType.text,
                    vincularCampo: (value) => nome = value,
                    retornoValidador: 'Campo nome é obrigatório',
                    visibilidade: false),
                //const CriarEspaco(),
                CampoTexto(
                    rotulo: 'Peso',
                    tipo: TextInputType.number,
                    vincularCampo: (value) => peso = double.parse(value),
                    retornoValidador: 'Campo peso é obrigatório',
                    visibilidade: false),
                //const CriarEspaco(),
                CampoTexto(
                    rotulo: 'Série',
                    tipo: TextInputType.number,
                    vincularCampo: (value) => serie = int.parse(value),
                    retornoValidador: 'Campo série é obrigatório',
                    visibilidade: false),
                //const CriarEspaco(),
                CampoTexto(
                    rotulo: 'Repeticao',
                    tipo: TextInputType.number,
                    vincularCampo: (value) => repeticao = int.parse(value),
                    retornoValidador: 'Campo repetição é obrigatório',
                    visibilidade: false),
                //const CriarEspaco(),
                dropdownTreino(),
                Container(
                  child: Button(
                      icone: Icon(Icons.save),
                      rotulo: 'Salvar',
                      cor: Colors.amber,
                      borda: StadiumBorder(),
                      acao: () {
                        var validar = formKey.currentState?.validate();
                        if (validar == true) {
                          exercicioDAO
                              .salvarExercicio(Exercicio(
                                  categoria: '',
                                  tipoExercicio: '',
                                  nome: nome!,
                                  peso: peso!,
                                  repeticao: repeticao!,
                                  serie: serie!,
                                  treino: treino!))
                              .then((value) => Navigator.pop(context));
                        }
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
