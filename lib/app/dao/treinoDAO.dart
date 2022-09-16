import 'package:sqflite/sqflite.dart';
import 'package:starting_training/app/domain/entities/treino.dart';

import '../model/sqlite/conexao.dart';

class TreinoDAO {
  Future<bool> salvarTreino(
    Treino treino,
  ) async {
    Database db = await Conexao.getConexao();
    const sql = '''INSERT INTO treino (ordem,status,nome) 
        VALUES (?,?,?)''';
    var linhasAfetadas =
        await db.rawInsert(sql, [treino.ordem, treino.status, treino.nome]);
    return linhasAfetadas > 0;
  }

  Future<bool> alterarTreino(Treino treino) async {
    const sql = 'UPDATE treino SET ordem=?, status=?, nome=? WHERE id = ?';
    Database db = await Conexao.getConexao();
    var linhasAfetadas = await db
        .rawUpdate(sql, [treino.ordem, treino.status, treino.nome, treino.id]);
    return linhasAfetadas > 0;
  }

  Future<bool> excluirTreino(int id) async {
    late Database db;
    try {
      const sql = 'DELETE FROM treino WHERE id = ?';
      db = await Conexao.getConexao();
      int linhasAfetadas = await db.rawDelete(sql, [id]);
      return linhasAfetadas > 0;
    } catch (e) {
      throw Exception('classe TreinoDAOSQLite, método excluir');
    } finally {
      db.close();
    }
  }

  Future<Treino> consultarExercicio(int id) async {
    late Database db;
    try {
      const sql = "SELECT * FROM treino WHERE id=?";
      db = await Conexao.getConexao();
      Map<String, Object?> resultado = (await db.rawQuery(sql, [id])).first;
      if (resultado.isEmpty) throw Exception('Sem registros com este id');
      Treino treino = Treino(
          id: resultado['id'] as int,
          nome: resultado['nome'].toString(),
          ordem: resultado['ordem'] as int,
          status: resultado['status'].toString());
      return treino;
    } catch (e) {
      throw Exception('classe TreinoDAO, método consultar');
    } finally {
      db.close();
    } 
  }

  @override
  Future<List<Treino>> listarExerxixios() async {
    late Database db;
    try {
      const sql = 'SELECT * FROM exercicio';
      db = await Conexao.getConexao();
      List<Map<String, Object?>> resultados = (await db.rawQuery(sql));
      if (resultados.isEmpty) throw Exception('Sem registros');
      List<Treino> treinos = resultados.map((resultado) {
        return Treino(
            id: resultado['id'] as int,
            nome: resultado['nome'].toString(),
            ordem: resultado['ordem'] as int,
            status: resultado['status'].toString());
      }).toList();
      return treinos;
    } catch (e) {
      throw Exception('classe TreinoDAOSQLite, método listar');
    } finally {
      db.close();
    }
  }
}