import 'package:flutter/material.dart';
import 'package:starting_training/app/dao/treinoDAO.dart';
import 'package:starting_training/app/domain/entities/pessoaAluno.dart';

import '../../domain/entities/treino.dart';

class ListTreinoAluo extends StatefulWidget {
  const ListTreinoAluo({Key? key}) : super(key: key);

  @override
  State<ListTreinoAluo> createState() => _ListTreinoAluoState();
}

class _ListTreinoAluoState extends State<ListTreinoAluo> {
  TreinoDAO treinoDAO = TreinoDAO();
  late Aluno aluno;

  @override
  Widget build(BuildContext context) {
    var argumento = ModalRoute.of(context)?.settings.arguments;
    if (argumento == null) {
      aluno = argumento as Aluno;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista Treino'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(context, '/treinoForm'),
          )
        ],
      ),
      body: FutureBuilder(
        future: treinoDAO.listarTreinoAluno(aluno.id),
        builder: (context, AsyncSnapshot<List<Treino>> snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
          var lista = snapshot.data!;

          return ListView.builder(
            itemCount: lista.length,
            itemBuilder: (context, contador) {
              var treino = lista[contador];
              return Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 5,
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Text(treino.ordem.toUpperCase()),
                    ),
                    title: Text(treino.nome),
                    subtitle: Text(treino.status),
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
