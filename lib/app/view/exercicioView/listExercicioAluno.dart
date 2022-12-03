import 'package:flutter/material.dart';
import 'package:starting_training/app/domain/entities/exercicio.dart';

import '../../dao/exercicioDAO.dart';
import '../../domain/entities/treino.dart';

class ListaExercicioAluno extends StatefulWidget {
  const ListaExercicioAluno({Key? key}) : super(key: key);

  @override
  State<ListaExercicioAluno> createState() => _ListaExercicioAlunoState();
}

class _ListaExercicioAlunoState extends State<ListaExercicioAluno> {
  ExercicioDAO exercicioDAO = ExercicioDAO();
  late Treino treino;

  @override
  Widget build(BuildContext context) {
    var argumento = ModalRoute.of(context)?.settings.arguments;
    if (argumento != null) {
      treino = argumento as Treino;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text('Exercicios'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, './formExercicio').then((value) {
                setState(() {});
              });
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: FutureBuilder(
        future: exercicioDAO.listarExerxixiosPorTreino(treino.id),
        builder: (context, AsyncSnapshot<List<Map<String, Object?>>> dados) {
          if (!dados.hasData) {
            return const CircularProgressIndicator();
          }
          var exercicios = dados.data!;

          return ListView.builder(
            itemCount: exercicios.length,
            itemBuilder: (context, index) {
              var exercicio = exercicios[index];

              return Center(
                child: Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(8),
                  child: ListView(
                    children: [
                      ListTile(
                        title: Text(
                          exercicio['nome'].toString(),
                          style: const TextStyle(fontSize: 30),
                        ),
                      ),
                      Column(
                        children: [
                          Text('Peso: ${exercicio['pseo'].toString()} Kg'),
                          Text('Série: ${exercicio['serie'].toString()} X'),
                          Text(
                              'Repetições: ${exercicio['repeticao'].toString()}'),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
