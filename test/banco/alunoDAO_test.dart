import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:starting_training/app/dao/alunoDAO.dart';
import 'package:starting_training/app/domain/entities/pessoaAluno.dart';
import 'package:starting_training/app/model/sqlite/conexao.dart';

/*void main() async {
  late Database db;
  late Aluno aluno;
  late AlunoDAO alunoDAO;

  setUp(() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    String path = join(await getDatabasesPath(), 'banco.db');
    deleteDatabase(path);
    db = await Conexao.getConexao();
    alunoDAO = AlunoDAO();
    aluno = Aluno(
        id: 2,
        nome: 'Francisco',
        CPF: '123456789',
        dataNascimento: '01/02/2002',
        endereco: 'Rua rio de janeiro',
        frequencia: 3,
        permissao: 'permitido',
        senha: '151351',
        status: 'ativo',
        telefone: '988707070');
  });

  tearDownAll(() {});

  group("Testando AlunoDAO", () {
    test("Testando metodo salvar aluno", () async {
      var salvandoAluno = await alunoDAO.salvarAluno(aluno);
      expect(salvandoAluno, true);
    });

    test('Testando o método excluir aluno', () async {
      await alunoDAO.salvarAluno(aluno);
      var resultado = await alunoDAO.excluirAluno(1);
      expect(resultado, true);
    });

    test('Testando o método listar aluno', () async {
      var resultado = await alunoDAO.listarAluno();
      expect(resultado, isInstanceOf<List<Aluno>>());
    });

    test('Testando o método consultar aluno', () async {
      var resultado = await alunoDAO.consultarAluno(1);
      expect(resultado, isInstanceOf<Aluno>());
    });
  });
}*/
