import 'package:sqflite/sqflite.dart';
import 'package:starting_training/app/domain/entities/pessoaAluno.dart';
import 'package:starting_training/app/domain/entities/pessoaPersonal_trainer.dart';

import '../model/sqlite/conexao.dart';

class PersonalDAO {
  Future<bool> salvarPersonal(
    PersonalTreiner personalTreiner,
  ) async {
    Database db = await Conexao.getConexao();
    const sql =
        '''INSERT INTO aluno (nome, cpf, telefone, dataNascimento, endereco,
         status, senha, permissao, cref, validadeCref) 
        VALUES (?,?,?,?,?,?,?,?,?,?)''';
    var linhasAfetadas = await db.rawInsert(sql, [
      personalTreiner.nome,
      personalTreiner.CPF,
      personalTreiner.telefone,
      personalTreiner.dataNascimento,
      personalTreiner.endereco,
      personalTreiner.status,
      personalTreiner.senha,
      personalTreiner.permissao,
      personalTreiner.cref,
      personalTreiner.validadeCref,
    ]);
    return linhasAfetadas > 0;
  }

  Future<bool> alterarPersonal(PersonalTreiner personalTreiner) async {
    const sql =
        'UPDATE personal SET nome=?, cpf=?, telefone=?, dataNascimento=?, endereco=?, status=?, senha=?, permissao=?, cref=?, validadeCref=?, WHERE id = ?';
    Database db = await Conexao.getConexao();
    var linhasAfetadas = await db.rawUpdate(sql, [
      personalTreiner.nome,
      personalTreiner.CPF,
      personalTreiner.telefone,
      personalTreiner.dataNascimento,
      personalTreiner.endereco,
      personalTreiner.status,
      personalTreiner.senha,
      personalTreiner.permissao,
      personalTreiner.cref,
      personalTreiner.validadeCref,
    ]);
    return linhasAfetadas > 0;
  }

  Future<bool> excluirPersonal(int id) async {
    late Database db;
    try {
      const sql = 'DELETE FROM personal WHERE id = ?';
      db = await Conexao.getConexao();
      int linhasAfetadas = await db.rawDelete(sql, [id]);
      return linhasAfetadas > 0;
    } catch (e) {
      throw Exception('classe PersonalDAOSQLite, método excluir');
    } finally {
      db.close();
    }
  }

  Future<PersonalTreiner> consultarPersonal(int id) async {
    late Database db;
    try {
      const sql = "SELECT * FROM personal WHERE id=?";
      db = await Conexao.getConexao();
      Map<String, Object?> resultado = (await db.rawQuery(sql, [id])).first;
      if (resultado.isEmpty) throw Exception('Sem registros com este id');
      PersonalTreiner personalTreiner = PersonalTreiner(
          id: resultado['id'] as int,
          nome: resultado['nome'].toString(),
          CPF: resultado['cpf'].toString(),
          telefone: resultado['telefone'].toString(),
          dataNascimento: resultado['dataNascimento'].toString(),
          endereco: resultado['endereco'].toString(),
          status: resultado['status'].toString(),
          cref: resultado['cref'].toString(),
          permissao: resultado['permissao'].toString(),
          senha: resultado['senha'].toString(),
          validadeCref: resultado['validadeCref'] as DateTime);
      return personalTreiner;
    } catch (e) {
      throw Exception('classe PersonalDAO, método consultar');
    } finally {
      db.close();
    }
  }

  @override
  Future<List<PersonalTreiner>> listarPersonal() async {
    late Database db;
    try {
      const sql = 'SELECT * FROM personal';
      db = await Conexao.getConexao();
      List<Map<String, Object?>> resultados = (await db.rawQuery(sql));
      if (resultados.isEmpty) throw Exception('Sem registros');
      List<PersonalTreiner> personal = resultados.map((resultado) {
        return PersonalTreiner(
            id: resultado['id'] as int,
            nome: resultado['nome'].toString(),
            CPF: resultado['cpf'].toString(),
            telefone: resultado['telefone'].toString(),
            dataNascimento: resultado['dataNascimento'].toString(),
            endereco: resultado['endereco'].toString(),
            status: resultado['status'].toString(),
            cref: resultado['cref'].toString(),
            permissao: resultado['permissao'].toString(),
            senha: resultado['senha'].toString(),
            validadeCref: resultado['validadeCref'] as DateTime);
      }).toList();
      return personal;
    } catch (e) {
      throw Exception('classe AlunoDAOSQLite, método listar');
    } finally {
      db.close();
    }
  }
}
