import 'package:sqflite/sqflite.dart';

import '../domain/entities/pessoaPersonal_trainer.dart';
import '../model/sqlite/conexao.dart';

class PersonalDAO {
  late Database db;
  Future<bool> salvarPersonal(PersonalTreiner personalTreiner) async {
    db = await Conexao.getConexao();
    var linhasAfetadas;
    if (personalTreiner.id == null) {
      const sql =
          '''INSERT INTO personal (nome, cpf, telefone, dataNascimento, endereco,
         status, senha, permissao, cref, validadeCref) 
        VALUES (?,?,?,?,?,?,?,?,?,?)''';
      linhasAfetadas = await db.rawInsert(sql, [
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
    } else {
      const sql =
          '''UPDATE personal SET nome=?, cpf=?, telefone=?, dataNascimento=?, endereco=?, status=?, senha=?, permissao=?, cref=?, validadeCref=? WHERE id = ?''';
      db = await Conexao.getConexao();
      linhasAfetadas = await db.rawUpdate(sql, [
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
        personalTreiner.id
      ]);
    }

    return linhasAfetadas > 0;
  }

  Future<bool> alterarPersonal(PersonalTreiner personalTreiner) async {
    const sql =
        'UPDATE personal SET nome=?, cpf=?, telefone=?, dataNascimento=?, endereco=?, status=?, senha=?, permissao=?, cref=?, validadeCref=? WHERE id = ?';
    db = await Conexao.getConexao();
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
      personalTreiner.id
    ]);
    return linhasAfetadas > 0;
  }

  Future<bool> excluirPersonal(int id) async {
    try {
      const sql = 'DELETE FROM personal WHERE id = ?';
      db = await Conexao.getConexao();
      int linhasAfetadas = await db.rawDelete(sql, [id]);
      return linhasAfetadas > 0;
    } catch (e) {
      throw Exception('classe PersonalDAOSQLite, método excluir');
    } finally {}
  }

  Future<PersonalTreiner> consultarPersonal(int id) async {
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
          validadeCref: resultado['validadeCref'].toString());
      return personalTreiner;
    } catch (e) {
      throw Exception('classe PersonalDAO, método consultar');
    } finally {}
  }

  @override
  Future<List<Map<String, Object?>>> listarPersonal() async {
    const sql = 'SELECT * FROM personal';
    db = await Conexao.getConexao();
    List<Map<String, Object?>> resultado = (await db.rawQuery(sql));
    if (resultado.isEmpty) throw Exception('Sem registros');

    return resultado;
  }
}
