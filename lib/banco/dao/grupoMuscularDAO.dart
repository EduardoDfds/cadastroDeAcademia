

import 'package:cadastro_academia/banco/sqlite/grupoMuscular.dart';
import 'package:sqflite/sqflite.dart';
import '../sqlite/conexao.dart';

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
    }
  }

  Future<GrupoMuscular> consultarGrupoMuscular(int id) async {
    late Database db;
    try {
      const sql = "SELECT * FROM grupoMuscular WHERE id=?";
      db = await Conexao.abrirConexao();
      Map<String, Object?> resultado = (await db.rawQuery(sql, [id])).first;
      if (resultado.isEmpty) throw Exception('Sem registros com este id');
      GrupoMuscular grupoMuscular = GrupoMuscular(
          id: resultado['id'] as int, nome: resultado['nome'].toString());
      return grupoMuscular;
    } catch (e) {
      throw Exception('classe GrupoMuscularDAO, método consultar');
    } finally {
      
    }
  }

  @override
  Future<List<GrupoMuscular>> listarGrupoMuscular() async {
    late Database db;
    try {
      const sql = 'SELECT * FROM grupoMuscular';
      db = await Conexao.abrirConexao();
      List<Map<String, Object?>> resultado = (await db.rawQuery(sql));
      if (resultado.isEmpty) throw Exception('Sem registros');
      List<GrupoMuscular> gruposMusculares = resultado.map((linha) {
        return GrupoMuscular(
            id: linha['id'] as int, nome: linha['nome'].toString());
      }).toList();
      return gruposMusculares;
    } catch (e) {
      throw Exception('classe GrupoMuscularDAOQLite, método listar $e');
    } finally {
     
    }
  }
}
