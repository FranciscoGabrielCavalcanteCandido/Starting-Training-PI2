import 'package:sqflite/sqflite.dart';
import 'package:starting_training/app/domain/entities/pessoaAluno.dart';
import 'package:starting_training/app/domain/entities/pessoaPersonal_trainer.dart';
import '../model/sqlite/conexao.dart';

class AlunoDAO {
  Future<bool> salvarAluno(Aluno aluno) async {
    Database db = await Conexao.getConexao();
    const sql =
        '''INSERT INTO aluno (nome, cpf, telefone, dataNascimento, endereco,
         status, senha, permissao, frequencia, personal_id) 
        VALUES (?,?,?,?,?,?,?,?,?,?)''';
    var linhasAfetadas = await db.rawInsert(sql, [
      aluno.nome,
      aluno.cpf,
      aluno.telefone,
      aluno.dataNascimento,
      aluno.endereco,
      aluno.status,
      aluno.senha,
      aluno.permissao,
      aluno.frequencia,
      aluno.personal.id
    ]);
    print(linhasAfetadas > 0);
    return linhasAfetadas > 0;
  }

  Future<bool> alterarAluno(Aluno aluno) async {
    const sql =
        'UPDATE exercicio SET nome=?, cpf=?, telefone=?, dataNascimento=?, endereco=?, status=?, senha=?, permissao=?, frequencia=?, WHERE id = ?';
    Database db = await Conexao.getConexao();
    var linhasAfetadas = await db.rawUpdate(sql, [
      aluno.nome,
      aluno.cpf,
      aluno.telefone,
      aluno.dataNascimento,
      aluno.endereco,
      aluno.status,
      aluno.senha,
      aluno.permissao,
      aluno.frequencia,
      aluno.id,
    ]);
    return linhasAfetadas > 0;
  }

  Future<bool> excluirAluno(int id) async {
    late Database db;
    try {
      const sql = 'DELETE FROM aluno WHERE id = ?';
      db = await Conexao.getConexao();
      int linhasAfetadas = await db.rawDelete(sql, [id]);
      return linhasAfetadas > 0;
    } catch (e) {
      throw Exception(e);
    } finally {}
  }

  Future<Aluno> consultarAluno(int id) async {
    late Database db;
    try {
      const sql = "SELECT * FROM aluno WHERE id=?";
      db = await Conexao.getConexao();
      Map<String, Object?> resultado = (await db.rawQuery(sql, [id])).first;
      if (resultado.isEmpty) throw Exception('Sem registros com este id');
      Aluno aluno = Aluno(
          id: resultado['id'] as int,
          nome: resultado['nome'].toString(),
          cpf: resultado['cpf'].toString(),
          telefone: resultado['telefone'].toString(),
          dataNascimento: resultado['dataNascimento'].toString(),
          endereco: resultado['endereco'].toString(),
          status: resultado['status'].toString(),
          frequencia: resultado['frequencia'] as int,
          permissao: resultado['permissao'].toString(),
          senha: resultado['senha'].toString(),
          personal: resultado['personal_id'] as PersonalTreiner);
      return aluno;
    } catch (e) {
      throw Exception('classe AlunoDAO, método consultar');
    } finally {}
  }

  @override
  Future<List<Map<String, Object?>>> listarAluno() async {
    late Database db;
    try {
      const sql = 'SELECT * FROM aluno';
      db = await Conexao.getConexao();
      List<Map<String, Object?>> resultados = (await db.rawQuery(sql));
      if (resultados.isEmpty) throw Exception('Sem registros');
      /*List<Aluno> alunos = resultados.map((resultado) {
        return Aluno(
            id: resultado['id'] as int,
            nome: resultado['nome'].toString(),
            cpf: resultado['cpf'].toString(),
            telefone: resultado['telefone'].toString(),
            dataNascimento: resultado['dataNascimento'].toString(),
            endereco: resultado['endereco'].toString(),
            status: resultado['status'].toString(),
            frequencia: resultado['frequencia'] as int,
            permissao: resultado['permissao'].toString(),
            senha: resultado['senha'].toString(),
            personal: resultado['personal_id'] as PersonalTreiner);
      }).toList();*/
      return resultados;
    } catch (e) {
      throw Exception(e);
    } finally {}
  }
}
