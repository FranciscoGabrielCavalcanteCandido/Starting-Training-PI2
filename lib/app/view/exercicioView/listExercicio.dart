import 'package:flutter/material.dart';
import 'package:starting_training/app/domain/entities/exercicio.dart';

import '../../dao/exercicioDAO.dart';
import '../../domain/entities/treino.dart';

class ListaExercicio extends StatefulWidget {
  const ListaExercicio({Key? key}) : super(key: key);

  @override
  State<ListaExercicio> createState() => _ListaExercicioState();
}

class _ListaExercicioState extends State<ListaExercicio> {
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
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          exercicio['nome'].toString(),
                          style: const TextStyle(fontSize: 30),
                        ),
                        subtitle: Text(
                            '''Peso: ${exercicio['peso'].toString()} Kg\nSérie: ${exercicio['serie'].toString()}\nRepetições: ${exercicio['repeticao'].toString()}
                    '''),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                          context, './formExercicio',
                                          arguments: exercicio)
                                      .then((value) {
                                    setState(() {});
                                  });
                                },
                                icon: const Icon(Icons.edit),
                                color: Colors.blue,
                              ),
                              IconButton(
                                onPressed: () => exercicioDAO
                                    .excluirExercicio(exercicio['id'] as int)
                                    .then(
                                  (value) {
                                    setState(() {});
                                  },
                                ),
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              )
                            ],
                          ),
                        ),
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
