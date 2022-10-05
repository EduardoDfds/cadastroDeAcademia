import 'package:cadastro_academia/banco/sqlite/treino.dart';
import 'package:sqflite/sqflite.dart';
import '../sqlite/conexao.dart';
import '../sqlite/exercicio.dart';

class ExercicioDAO {
  Future<bool> salvarExercicio(
    Exercicio exercicio,
  ) async {
    Database db = await Conexao.abrirConexao();
    const sql =
        'INSERT INTO exercicio (nome, peso, serie, repeticao, grupoMuscular_id) VALUES (?,?,?,?,?)';
    var linhasAfetadas = await db.rawInsert(sql, [
      exercicio.nome,
      exercicio.peso,
      exercicio.serie,
      exercicio.repeticao,
      exercicio.treino.id
    ]);
    return linhasAfetadas > 0;
  }

  Future<bool> alterarExercicio(Exercicio exercicio) async {
    const sql =
        'UPDATE exercicio SET nome=?, peso=?, serie=?, repeticao=? WHERE id = ?';
    Database db = await Conexao.abrirConexao();
    var linhasAfetadas = await db.rawUpdate(sql, [
      exercicio.nome,
      exercicio.peso,
      exercicio.serie,
      exercicio.repeticao,
      exercicio.id
    ]);
    return linhasAfetadas > 0;
  }

  Future<bool> excluirExercicio(int id) async {
    late Database db;
    try {
      const sql = 'DELETE FROM exercicio WHERE id = ?';
      db = await Conexao.abrirConexao();
      int linhasAfetadas = await db.rawDelete(sql, [id]);
      return linhasAfetadas > 0;
    } catch (e) {
      throw Exception('classe ExercicioDAOSQLite, método excluir');
    } finally {
      db.close();
    }
  }

  Future<Exercicio> consultarExercicio(int id) async {
    late Database db;
    try {
      const sql = "SELECT * FROM exercicio WHERE id=?";
      db = await Conexao.abrirConexao();
      Map<String, Object?> resultado = (await db.rawQuery(sql, [id])).first;
      if (resultado.isEmpty) throw Exception('Sem registros com este id');
      Exercicio exercicio = Exercicio(
          id: resultado['id'] as int,
          nome: resultado['nome'].toString(),
          peso: resultado['peso'] as double,
          repeticao: resultado['repeticao'] as int,
          serie: resultado['serie'] as int,
          treino: resultado['grupoMuscular_id'] as Treino);
      return exercicio;
    } catch (e) {
      throw Exception('classe ExercicioDAO, método consultar');
    } finally {
      db.close();
    }
  }

  @override
  Future<List<Map<String, Object?>>> listarExerxixios() async {
    late Database db;
    try {
      const sql = 'SELECT * FROM exercicio';
      db = await Conexao.abrirConexao();
      List<Map<String, Object?>> resultado = (await db.rawQuery(sql));
      return resultado;
    } catch (e) {
      throw Exception('classe ExercicioDAOSQLite, método listar');
    } finally {
      db.close();
    }
  }
}
