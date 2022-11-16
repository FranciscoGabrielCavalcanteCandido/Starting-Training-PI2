import 'package:sqflite/sqflite.dart';
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

  Future<String> verificaCpf(String cpfDigitado) async {
    db = await Conexao.getConexao();
    var sqlCpf = 'SELECT cpf FROM login WHERE cpf=?';
    var cpf = (await db.rawQuery(sqlCpf, [cpfDigitado]));
    if (cpf.isEmpty) throw Exception('CPF inválido');
    return cpf.toString();
  }

  Future<String> verificaSenha(String senhaDigitada) async {
    db = await Conexao.getConexao();
    var sqlSenha = 'SELECT senha FROM login WHERE senha=?';
    var senha = (await db.rawQuery(sqlSenha, [
      senhaDigitada,
    ]));
    if (senha.isEmpty) throw Exception('Senha inválida');
    return senha.toString();
  }

  Future<bool> verificaLogin(Login loginDigitado) async {
    db = await Conexao.getConexao();
    bool valido = false;
    var sqlLogin = 'SELECT senha FROM login WHERE cpf=?';
    var login = (await db.rawQuery(sqlLogin, [loginDigitado.CPF]));
    if (!login.isEmpty) valido = true;

    return valido;
  }

  Future<String> pegaPermissao(Login login) async {
    db = await Conexao.getConexao();
    var sql = 'SELECT permissao FROM login WHERE senha=?';
    var permissao = (await db.rawQuery(sql, [login.CPF]));
    return permissao.toString();
  }
}
