import 'package:sqflite/sqflite.dart';
import 'package:starting_training/app/domain/entities/treino.dart';

import '../domain/entities/exercicio.dart';
import '../model/sqlite/conexao.dart';

class ExercicioDAO {
  Future<bool> salvarExercicio(
    Exercicio exercicio,
  ) async {
    Database db = await Conexao.getConexao();
    const sql =
        '''INSERT INTO exercicio (nome, peso, serie, categoria, tipo_exercicio, repeticao, treino_id) 
        VALUES (?,?,?,?,?,?,?)''';
    var linhasAfetadas = await db.rawInsert(sql, [
      exercicio.nome,
      exercicio.peso,
      exercicio.serie,
      exercicio.categoria,
      exercicio.tipoExercicio,
      exercicio.repeticao,
      exercicio.treino.id
    ]);
    return linhasAfetadas > 0;
  }

  Future<bool> alterarExercicio(Exercicio exercicio) async {
    const sql =
        'UPDATE exercicio SET nome=?, peso=?, serie=?, cstegoria=?, tipo_exercicio=?, repeticao=? WHERE id = ?';
    Database db = await Conexao.getConexao();
    var linhasAfetadas = await db.rawUpdate(sql, [
      exercicio.nome,
      exercicio.peso,
      exercicio.serie,
      exercicio.categoria,
      exercicio.tipoExercicio,
      exercicio.repeticao,
      exercicio.id
    ]);
    return linhasAfetadas > 0;
  }

  Future<bool> excluirExercicio(int id) async {
    late Database db;
    try {
      const sql = 'DELETE FROM exercicio WHERE id = ?';
      db = await Conexao.getConexao();
      int linhasAfetadas = await db.rawDelete(sql, [id]);
      return linhasAfetadas > 0;
    } catch (e) {
      throw Exception('classe ExercicioDAOSQLite, método excluir');
    } finally {
    }
  }

  Future<Exercicio> consultarExercicio(int id) async {
    late Database db;
    try {
      const sql = "SELECT * FROM exercicio WHERE id=?";
      db = await Conexao.getConexao();
      Map<String, Object?> resultado = (await db.rawQuery(sql, [id])).first;
      if (resultado.isEmpty) throw Exception('Sem registros com este id');
      Exercicio exercicio = Exercicio(
          id: resultado['id'] as int,
          nome: resultado['nome'].toString(),
          peso: resultado['peso'] as double,
          repeticao: resultado['repeticao'] as int,
          serie: resultado['serie'] as int,
          categoria: resultado['categoria'].toString(),
          tipoExercicio: resultado['tipo_exercicio'].toString(),
          treino: resultado['treino_id'] as Treino);
      return exercicio;
    } catch (e) {
      throw Exception('classe ExercicioDAO, método consultar');
    } finally {
    }
  }

  @override
  Future<List<Exercicio>> listarExerxixios() async {
    late Database db;
    try {
      const sql = 'SELECT * FROM exercicio';
      db = await Conexao.getConexao();
      List<Map<String, Object?>> resultados = (await db.rawQuery(sql));
      if (resultados.isEmpty) throw Exception('Sem registros');
      List<Exercicio> exercicios = resultados.map((resultado) {
        return Exercicio(
            id: resultado['id'] as int,
            nome: resultado['nome'].toString(),
            peso: resultado['peso'] as double,
            repeticao: resultado['repeticao'] as int,
            serie: resultado['serie'] as int,
            categoria: resultado['categoria'].toString(),
            tipoExercicio: resultado['tipo_exercicio'].toString(),
            treino: resultado['treino_id'] as Treino);
      }).toList();
      return exercicios;
    } catch (e) {
      throw Exception('classe ExercicioDAOSQLite, método listar');
    } finally {
    }
  }
}
