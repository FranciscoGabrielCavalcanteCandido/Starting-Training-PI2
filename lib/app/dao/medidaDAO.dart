import 'package:sqflite/sqflite.dart';
import 'package:starting_training/app/domain/entities/medida.dart';
import 'package:starting_training/app/domain/entities/pessoaAluno.dart';
import 'package:starting_training/app/domain/entities/treino.dart';

import '../domain/entities/exercicio.dart';
import '../model/sqlite/conexao.dart';

class MedidaDAO {
  Future<bool> salvarMedida(
    Medida medida,
  ) async {
    Database db = await Conexao.getConexao();
    const sql =
        '''INSERT INTO exercicio (altura, pesoKg, cintura, braco, quadril, perna, data_avaliacao, imc, aluno_id) 
        VALUES (?,?,?,?,?,?,?,?,?)''';
    var linhasAfetadas = await db.rawInsert(sql, [
      medida.altura,
      medida.peso,
      medida.cintura,
      medida.braco,
      medida.quadril,
      medida.perna,
      medida.dataAvaliacao,
      medida.imc,
      medida.aluno.id
    ]);
    return linhasAfetadas > 0;
  }

  Future<bool> alterarMedida(Medida medida) async {
    const sql =
        'UPDATE exercicio SET altura=?, pesoKg=?, cintura=?, braco=?, quadril=?, perna=?, data_avaliacao=?, imc=? WHERE id = ?';
    Database db = await Conexao.getConexao();
    var linhasAfetadas = await db.rawUpdate(sql, [
      medida.altura,
      medida.peso,
      medida.cintura,
      medida.braco,
      medida.quadril,
      medida.perna,
      medida.dataAvaliacao,
      medida.imc,
      medida.id
    ]);
    return linhasAfetadas > 0;
  }

  Future<bool> excluirMedida(int id) async {
    late Database db;
    try {
      const sql = 'DELETE FROM medida WHERE id = ?';
      db = await Conexao.getConexao();
      int linhasAfetadas = await db.rawDelete(sql, [id]);
      return linhasAfetadas > 0;
    } catch (e) {
      throw Exception('classe MedidaDAOSQLite, método excluir');
    } finally {}
  }

  Future<Medida> consultarMedida(int id) async {
    late Database db;
    try {
      const sql = "SELECT * FROM medida WHERE id=?";
      db = await Conexao.getConexao();
      Map<String, Object?> resultado = (await db.rawQuery(sql, [id])).first;
      if (resultado.isEmpty) throw Exception('Sem registros com este id');
      Medida medida = Medida(
          id: resultado['id'] as int,
          altura: resultado['altura'] as double,
          peso: resultado['peso'] as double,
          cintura: resultado['cintura'] as double,
          braco: resultado['barco'] as double,
          quadril: resultado['quadril'] as double,
          perna: resultado['perna'] as double,
          dataAvaliacao: resultado['data_avaliacao'].toString(),
          imc: resultado['imc'] as double,
          aluno: resultado['aluno'] as Aluno);
      return medida;
    } catch (e) {
      throw Exception('classe MedidaDAO, método consultar');
    } finally {}
  }

  Future<List<Medida>> listarMedidas() async {
    late Database db;
    try {
      const sql = 'SELECT * FROM exercicio';
      db = await Conexao.getConexao();
      List<Map<String, Object?>> resultados = (await db.rawQuery(sql));
      if (resultados.isEmpty) throw Exception('Sem registros');
      List<Medida> medidas = resultados.map((resultado) {
        return Medida(
            id: resultado['id'] as int,
            altura: resultado['altura'] as double,
            peso: resultado['peso'] as double,
            cintura: resultado['cintura'] as double,
            braco: resultado['barco'] as double,
            quadril: resultado['quadril'] as double,
            perna: resultado['perna'] as double,
            dataAvaliacao: resultado['data_avaliacao'].toString(),
            imc: resultado['imc'] as double,
            aluno: resultado['aluno_id'] as Aluno);
      }).toList();
      return medidas;
    } catch (e) {
      throw Exception('classe ExercicioDAOSQLite, método listar');
    } finally {}
  }
}
