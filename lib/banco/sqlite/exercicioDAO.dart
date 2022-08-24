
import 'package:sqflite/sqflite.dart';
import 'conexao.dart';
import 'exercicio.dart';

class ExercicioDAO {
  Future<bool> salvarExercicio(Exercicio exercicio) async {
    Database db = await Conexao.abrirConexao();
    const sql =
        'INSERT INTO exrercicio (nome, peso, serie, repeticao, grupoMuscular_id) VALUES (?,?,?,?,?)';
    var linhasAfetadas = await db.rawInsert(sql, [
      exercicio.nome,
      exercicio.peso,
      exercicio.serie,
      exercicio.repeticao,
      exercicio.grupoMuscular
    ]);
    return linhasAfetadas > 0;
  }

  Future<bool> alterarExercicio(Exercicio exercicio) async {
    const sql =
        'UPDATE tarefa SET nome=?, peso=?, serie=?, repeticao=?, grupoMuscular_id=? WHERE id = ?';
    Database db = await Conexao.abrirConexao();
    var linhasAfetadas = await db.rawUpdate(sql, [
      exercicio.nome,
      exercicio.peso,
      exercicio.serie,
      exercicio.repeticao,
      exercicio.grupoMuscular,
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
}
