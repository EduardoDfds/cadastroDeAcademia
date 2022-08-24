import 'package:cadastro_academia/banco/sqlite/grupoMuscular.dart';
import 'package:sqflite/sqflite.dart';
import 'conexao.dart';

class GrupoMuscularDAO {
  Future<bool> salvarGrupoMuscular(GrupoMuscular grupoMuscular) async {
    Database db = await Conexao.abrirConexao();
    const sql = 'INSERT INTO grupoMuscular (nome) VALUES (?)';
    var linhasAfetadas = await db.rawInsert(sql, [grupoMuscular.nome]);
    return linhasAfetadas > 0;
  }

  Future<bool> alterarGrupoMuscular(GrupoMuscular grupoMuscular) async {
    const sql = 'UPDATE grupoMuscular SET nome=? WHERE id = ?';
    Database db = await Conexao.abrirConexao();
    var linhasAfetadas =
        await db.rawUpdate(sql, [grupoMuscular.nome, grupoMuscular.id]);
    return linhasAfetadas > 0;
  }

  Future<bool> excluirGrupoMuscular(int id) async {
    late Database db;
    try {
      const sql = 'DELETE FROM grupoMuscular WHERE id = ?';
      db = await Conexao.abrirConexao();
      int linhasAfetadas = await db.rawDelete(sql, [id]);
      return linhasAfetadas > 0;
    } catch (e) {
      throw Exception('classe GrupoMuscularDAOSQLite, método excluir');
    } finally {
      db.close();
    }
  }
}
