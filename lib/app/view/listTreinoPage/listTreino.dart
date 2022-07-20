import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:starting_training/app/model/sqlite/conecaoSqlite.dart';

class TarefaLista extends StatelessWidget {
  const TarefaLista({Key? key}) : super(key: key);

  Future<List<Map<String, Object?>>> consultar() async {
    Database database = await Conexao.get();

    List<Map<String, Object?>> list =
        await database.rawQuery('SELECT * FROM treino');
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista Treino'),
          actions: [
            IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => Navigator.pushNamed(context, '/treinoForm'))
          ],
        ),
        body: FutureBuilder(
            future: consultar(),
            builder:
                (context, AsyncSnapshot<List<Map<String, Object?>>> snapshot) {
              if (!snapshot.hasData) return const CircularProgressIndicator();
              var lista = snapshot.data!;
              return ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, contador) {
                    var tarefa = lista[contador];
                    return ListTile(
                      title: Text(tarefa["nome"].toString()),
                      subtitle: Text(tarefa["descricao"].toString()),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/treinoForm',
                                    arguments: tarefa);
                              },
                              icon: Icon(Icons.save),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/treinoForm',
                                    arguments: tarefa);
                              },
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.delete),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }));
  }
}
