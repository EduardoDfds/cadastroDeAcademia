import 'package:cadastro_academia/banco/sqlite/conexao.dart';
import 'package:cadastro_academia/banco/entities/treino.dart';
import 'package:sqflite/sqflite.dart';

class TreinoDAO {
  Future<bool> salvarTreino(
    Treino treino,
  ) async {
    Database db = await Conexao.abrirConexao();
    const sql = '''INSERT INTO treino (ordem,nome) 
        VALUES (?,?)''';
    var linhasAfetadas = await db.rawInsert(sql, [treino.ordem, treino.nome]);
    return linhasAfetadas > 0;
  }

  Future<bool> alterarTreino(Treino treino) async {
    const sql = 'UPDATE treino SET ordem=?,nome=? WHERE id_treino = ?';
    Database db = await Conexao.abrirConexao();
    var linhasAfetadas =
        await db.rawUpdate(sql, [treino.ordem, treino.nome, treino.id]);
    return linhasAfetadas > 0;
  }

  Future<bool> excluirTreino(int id) async {
    late Database db;
    try {
      const sql = 'DELETE FROM treino WHERE id_treino = ?';
      db = await Conexao.abrirConexao();
      int linhasAfetadas = await db.rawDelete(sql, [id]);
      return linhasAfetadas > 0;
    } catch (e) {
      throw Exception('classe TreinoDAOSQLite, método excluir');
    } finally {}
  }

  Future<Treino> consultarTreino(int id) async {
    late Database db;
    try {
      const sql = "SELECT * FROM treino WHERE id_treino=?";
      db = await Conexao.abrirConexao();
      Map<String, Object?> resultado = (await db.rawQuery(sql, [id])).first;
      if (resultado.isEmpty) throw Exception('Sem registros com este id');
      Treino treino = Treino(
          id: resultado['id'] as int,
          nome: resultado['nome'].toString(),
          ordem: resultado['ordem'].toString());
      return treino;
    } catch (e) {
      throw Exception('classe TreinoDAO, método consultar');
    } finally {}
  }

  Future<List<Map<String, Object?>>> nomeTreino(int id) async {
    late Database db;
    const sql = 'SELECT nome FROM treino WHERE id_treino=?';
    db = await Conexao.abrirConexao();
    List<Map<String, Object?>> resultados = (await db.rawQuery(sql, [id]));
    return resultados;
  }

  @override
  Future<List<Treino>> listarTreino() async {
    late Database db;
    try {
      const sql = 'SELECT * FROM treino';
      db = await Conexao.abrirConexao();
      List<Map<String, Object?>> resultados = (await db.rawQuery(sql));
      if (resultados.isEmpty) throw Exception('Sem registros');

      List<Treino> treinos = resultados.map((resultado) {
        return Treino(
            id: resultado['id_treino'] as int,
            nome: resultado['nome'].toString(),
            ordem: resultado['ordem'].toString());
      }).toList();
      return treinos;
    } catch (e) {
      throw Exception('classe TreinoDAOSQLite, método listar');
    } finally {}
  }
}
