import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Conexao {
  static Database? _database;

  static String criarTreino = '''CREATE TABLE treino (
          id INTEGER PRIMERY KEY,
          ordem INT NOT NULL,
          status TEXT NOT NULL,
          nome TEXT NOT NULL,

      )''';

  static String inserirTreino = '''
        INSERT INTO personal (nome,
          ordem, 
          telefone, 
          status, 
          nome) 
          VALUES (?,?,?,?) ''';

  static String criarPersonal = '''
        CREAT TABLE personal(
          id INTEGER PRIMERY KEY,
          nome TEXT NOT NULL,
          cpf TEXT NOT NULL,
          telefone TEXT NOT NULL,
          dataNascimento TEXT NOT NULL,
          status TEXT NOT NULL,
          academia TEXT NOT NULL,
          permissao TEXT NOT NULL,
          senha TEXT NOT NULL,
          cref TEXT NOT NULL,
          validadeCref TEXT NOT NULL
      )''';

  static String inserirPersonal = '''
        INSERT INTO personal (
          nome,
          cpf, 
          telefone, 
          dataNascimento, 
          status, 
          academia, 
          senha,
          cref,
          validadeCref) 
          VALUES (?,?,?,?,?,?,?) ''';

  static String criarAluno = '''
        CREAT TABLE aluno(
          id INTEGER PRIMERY KEY,
          nome TEXT NOT NULL,
          cpf TEXT NOT NULL,
          telefone TEXT NOT NULL,
          dataNascimento TEXT NOT NULL,
          status TEXT NOT NULL,
          academia TEXT NOT NULL,
          senha TEXT NOT NULL,
          personal_id int NOT NULL,
          medidas_id int NOT NULL,
          FOREING KEY (personal_id) REFERENCES personal(id),
          FOREING KEY (medidas_id) REFERENCES medidas(id)
      )''';
  static String inserirAluno = '''
        INSERT INTO personal (
          nome,
          cpf, 
          telefone, 
          dataNascimento, 
          status, 
          academia, 
          senha,
          perosnal_id,
          medidas_id) 
          VALUES (?,?,?,?,?,?,?,?,?) ''';

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
