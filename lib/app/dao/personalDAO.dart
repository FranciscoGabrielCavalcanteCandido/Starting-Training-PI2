import 'package:sqflite/sqflite.dart';
import 'package:starting_training/app/dao/loginDAO.dart';
import 'package:starting_training/app/domain/entities/login.dart';

import '../domain/entities/pessoaPersonal_trainer.dart';
import '../model/sqlite/conexao.dart';

class PersonalDAO {
  LoginDAO loginDAO = LoginDAO();
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
    loginDAO.salvarLogin(Login(
        CPF: personalTreiner.CPF,
        id: personalTreiner.id,
        senha: personalTreiner.senha,
        permissao: personalTreiner.permissao));
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
  Future<List<PersonalTreiner>> listarPersonal() async {
    const sql = 'SELECT * FROM personal';
    db = await Conexao.getConexao();
    List<Map<String, Object?>> resultado = (await db.rawQuery(sql));
    if (resultado.isEmpty) throw Exception('Sem registros');
    List<PersonalTreiner> personais = resultado.map((resultado) {
      return PersonalTreiner(
          id: resultado['id'],
          nome: resultado['nome'],
          CPF: resultado['CPF'],
          telefone: resultado['telefone'],
          dataNascimento: resultado['dataNascimento'],
          endereco: resultado['endereco'],
          status: resultado['status'],
          senha: resultado['senha'],
          permissao: resultado['permissao'],
          cref: resultado['cref'].toString(),
          validadeCref: resultado['validadeCref']);
    }).toList();
    return personais;
  }
}
