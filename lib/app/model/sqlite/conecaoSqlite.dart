import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Conexao {
  static Database? _database;
  static String criarTreino = 'CREATE TABLE treino (id INTEGER PRIMARY KEY)';
  static String criarPersonal = '''
        CREAT TABLE personal(
          id INTEGER PRIMERY KEY,
          nome TEXT NOT NULL,
          cpf TEXT NOT NULL,
          telefone TEXT NOT NULL,
          dataNascimento TEXT NOT NULL,
          status TEXT NOT NULL,
          academia TEXT NOT NULL,
          senha TEXT NOT NULL
      )''';
  static String criarAluno = 'CREATE TABLE treino ()';

  static Future<Database> get() async {
    if (_database == null) {
      var path = join(await getDatabasesPath(), 'banco_local');
      deleteDatabase(path);
      _database = await openDatabase(
        path,
        version: 1,
        onCreate: (banco, v) {
          banco.execute(criarTreino);
          banco.execute(criarPersonal);
          banco.execute(criarAluno);
        },
      );
    }
    return _database!;
  }
}
