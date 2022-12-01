import 'package:sqflite/sqflite.dart';
import 'package:starting_training/app/dao/personalDAO.dart';
import 'package:starting_training/app/domain/entities/login.dart';
import '../model/sqlite/conexao.dart';

class LoginDAO {
  late Database db;
  Future<bool> salvarLogin(Login login) async {
    db = await Conexao.getConexao();
    var linhasAfetadas;
    if (login.id == null) {
      const sql = '''INSERT INTO login (cpf,senha, permissao) 
        VALUES (?,?,?)''';
      linhasAfetadas =
          await db.rawInsert(sql, [login.CPF, login.senha, login.permissao]);
    } else {
      const sql = '''UPDATE login SET cpf=?, senha=?, permissao=? WHERE id=?''';
      db = await Conexao.getConexao();
      linhasAfetadas = await db
          .rawUpdate(sql, [login.CPF, login.senha, login.permissao, login.id]);
    }

    return linhasAfetadas > 0;
  }

  Future<bool> excluirLogin(int id) async {
    try {
      const sql = 'DELETE FROM login WHERE id = ?';
      db = await Conexao.getConexao();
      int linhasAfetadas = await db.rawDelete(sql, [id]);
      return linhasAfetadas > 0;
    } catch (e) {
      throw Exception('classe PersonalDAOSQLite, método excluir');
    } finally {}
  }

  Future<Login> consultarLogin(int id) async {
    try {
      const sql = "SELECT * FROM login WHERE id=?";
      db = await Conexao.getConexao();
      Map<String, Object?> resultado = (await db.rawQuery(sql, [id])).first;
      if (resultado.isEmpty) throw Exception('Sem registros com este id');
      Login login = Login(
          CPF: resultado['cpf'].toString(),
          id: resultado['id'],
          senha: resultado['senha'].toString(),
          permissao: resultado['permissao'].toString());
      return login;
    } catch (e) {
      throw Exception('classe PersonalDAO, método consultar');
    } finally {}
  }

  @override
  Future<List<Map<String, Object?>>> listarLogin() async {
    const sql = 'SELECT * FROM login';
    db = await Conexao.getConexao();
    List<Map<String, Object?>> resultado = (await db.rawQuery(sql));
    if (resultado.isEmpty) throw Exception('Sem registros');

    return resultado;
  }

  Future<bool> verificaLogin(Login loginDigitado) async {
    var valido = false;
    db = await Conexao.getConexao();
    var sqlLogin = 'SELECT * FROM login WHERE cpf=?';
    var resultado = (await db.rawQuery(sqlLogin, [loginDigitado.CPF])).first;

    Login login = Login(
        CPF: resultado['cpf'].toString(),
        senha: resultado['senha'].toString(),
        permissao: resultado['permissao'].toString());

    if (loginDigitado.CPF == login.CPF && loginDigitado.senha == login.senha) {
      valido == true;
    }

    return valido;
  }
}
