import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ListPersonalPage extends StatelessWidget {
  int? id;
  String? nome;
  String? CPF;
  String? telefone;
  String? endereco;
  String? dataNascimento;
  String? status;
  String? academia;
  String? senha;

  Future<List<Map<String, Object?>>> buscaDadosPersonal() async {
    String caminhoBD = join(await getDatabasesPath(), 'banco.db');
    Database banco = await openDatabase(
      caminhoBD,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
        CREAT TABLE personal(
          id INTEGER PRIMERY KEY,
          nome TEXT NOT NULL,
          cpf TEXT NOT NULL,
          telefone TEXT NOT NULL,
          dataNascimento TEXT NOT NULL,
          status TEXT NOT NULL,
          academia TEXT NOT NULL,
          senha TEXT NOT NULL
      )''');
      },
    );

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
