import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:starting_training/app/dao/alunoDAO.dart';
import 'package:starting_training/app/dao/personalDAO.dart';
import 'package:starting_training/app/domain/entities/pessoaAluno.dart';
import 'package:starting_training/app/domain/entities/pessoaPersonal_trainer.dart';
import 'package:starting_training/app/model/sqlite/conexao.dart';

void main() async {
  late Database db;
  late Aluno aluno;

  setUp(() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    String path = join(await getDatabasesPath(), 'banco.db');
    db = await Conexao.getConexao();
    aluno = Aluno(
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

  tearDownAll(() {
    db.close();
  });

  group("Testando AlunoDAO", () {
    test("Testando metodo salvar AlunoDAO", () async {
      var salvandoAluno = await AlunoDAO().salvarAluno(aluno);
      expect(salvandoAluno, true);
    });

    /*test("Testando metodo excluir AnimalDAO", () async {
      await AnimalDAO().salvar(animal);
      var excluirAnimal = await AnimalDAO().excluir(2);
      expect(excluirAnimal, true);
    });

    test("Testando metodo consultar AnimalDAO", () async {
      await AnimalDAO().salvar(animal);
      var consultarAnimal = await AnimalDAO().consultar(3);
      expect(consultarAnimal, isInstanceOf<Animal>());
    });*/
  });
}
