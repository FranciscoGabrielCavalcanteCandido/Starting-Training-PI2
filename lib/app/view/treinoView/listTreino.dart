import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:starting_training/app/dao/treinoDAO.dart';
import 'package:starting_training/app/model/sqlite/conexao.dart';

import '../../domain/entities/treino.dart';

class ListTreino extends StatefulWidget {
  const ListTreino({Key? key}) : super(key: key);

  @override
  State<ListTreino> createState() => _ListTreinoState();
}

class _ListTreinoState extends State<ListTreino> {
  TreinoDAO treinoDAO = TreinoDAO();
  @override
  Widget build(BuildContext context) {
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
        future: treinoDAO.listarTreinos(),
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
                  elevation: 4,
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Text(treino.ordem.toUpperCase()),
                    ),
                    title: Text(treino.nome),
                    subtitle: Text(treino.status),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/treinoForm',
                                  arguments: treino);
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              treinoDAO.excluirTreino(treino.id).then((value) {
                                setState(() {});
                              });
                            },
                            icon: const Icon(Icons.delete),
                          )
                        ],
                      ),
                    ),
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
