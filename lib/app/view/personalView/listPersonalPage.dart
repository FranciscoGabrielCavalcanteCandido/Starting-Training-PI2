import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:starting_training/app/model/sqlite/conecaoSqlite.dart';

class ListPersonalPage extends StatefulWidget {
  @override
  State<ListPersonalPage> createState() => _ListPersonalPageState();
}

class _ListPersonalPageState extends State<ListPersonalPage> {
  Future<List<Map<String, Object?>>> buscaDadosPersonal() async {
    String caminhoBD = join(await getDatabasesPath(), 'banco.db');
    //deleteDatabase(caminhoBD);
    Database banco = await Conexao.get();

    List<Map<String, Object?>> personal =
        await banco.rawQuery('SELECT * FROM personal');
    return personal;
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
                Navigator.pushNamed(context, '/registrationPersonalPage')
                    .then((value) {
              setState(() {});
            }),
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

              return Card(
                elevation: 4,
              );
            },
          );
        },
      ),
    );
  }
}
