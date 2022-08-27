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

  static String criarExercicio = '''
        CREAT TABLE exercicio(
          id INTEGER PRIMERY KEY,
          nome TEXT NOT NULL,
          peso TEXT NOT NULL,
          serie TEXT NOT NULL,
          categoria TEXT NOT NULL,
          tipo_exercicio TEXT NOT NULL,
          repeticao TEXT NOT NULL
      )''';

  static String criarMedida = '''
        CREATE TABLE medida(
          id INTEGER PRIMERY KEY,
          altura DOUBLE NOT NULL,
          pesoKg DOUBLE NOT NULL,
          cintura DOUBLE NOT NULL,
          braco DOUBLE NOT NULL,
          quadril DOUBLE NOT NULL,
          perna DOUBLE NOT NULL,
          dataAvaliacao DATE NOT NULL
        )''';

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
          banco.execute(criarExercicio);
        },
      );
    }
    return _database!;
  }
}
