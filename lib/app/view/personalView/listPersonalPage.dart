import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:starting_training/app/model/sqlite/conecaoSqlite.dart';

class ListPersonalPage extends StatefulWidget {
  @override
  State<ListPersonalPage> createState() => _ListPersonalPageState();
}

class _ListPersonalPageState extends State<ListPersonalPage> {
  //FUNÇÃO QUE BUSCA OS DADOS DO PERSONAL
  Future<List<Map<String, Object?>>> buscaDadosPersonal() async {
    String caminhoBD = join(await getDatabasesPath(), 'banco.db');
    Database banco = await Conexao.get();

    List<Map<String, Object?>> personal =
        await banco.rawQuery('SELECT * FROM personal');
    return personal;
  }

  Future<int> excluir(int id) async {
    String caminhoBD = join(await getDatabasesPath(), 'banco.db');
    Database banco = await Conexao.get();
    int linhasExcluidas =
        await banco.rawDelete('DELETE FROM personal WHERE id = ?', [id]);
    setState(() {});
    return linhasExcluidas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Perosnal',
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person_add),
            onPressed: () =>
                Navigator.pushNamed(context, '/registrationPersonalPage'),
          ),
        ],
      ),
      body: FutureBuilder(
        future: buscaDadosPersonal(),
        builder:
            (context, AsyncSnapshot<List<Map<String, Object?>>> dadosPersonal) {
          if (!dadosPersonal.hasData) return const CircularProgressIndicator();
          var personal = dadosPersonal.data!;
          return ListView.builder(
            itemCount: personal.length,
            itemBuilder: (context, index) {
              var personals = personal[index];

              return Container(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Card(
                        child: Container(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            children: <Widget>[
                              Text(personals["nome"].toString())
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
