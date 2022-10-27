import 'package:cadastro_academia/banco/entities/login.dart';
import 'package:cadastro_academia/banco/sqlite/conexao.dart';
import 'package:sqflite/sqflite.dart';

class LoginDAO {
  Future<bool> salvarLogin(
    Login login,
  ) async {
    Database db = await Conexao.abrirConexao();
    const sql = '''INSERT INTO login (nome, email, senha) 
        VALUES (?,?,?)''';
    var linhasAfetadas =
        await db.rawInsert(sql, [login.nome, login.email, login.senha]);
    return linhasAfetadas > 0;
  }

  Future<bool> alterarLogin(Login login) async {
    const sql = 'UPDATE login SET nome=?, email=?, senha=? WHERE id_login = ?';
    Database db = await Conexao.abrirConexao();
    var linhasAfetadas = await db
        .rawUpdate(sql, [login.nome, login.email, login.senha, login.id]);
    return linhasAfetadas > 0;
  }

  Future<bool> excluirLogin(int id) async {
    late Database db;
    try {
      const sql = 'DELETE FROM login WHERE id_login = ?';
      db = await Conexao.abrirConexao();
      int linhasAfetadas = await db.rawDelete(sql, [id]);
      return linhasAfetadas > 0;
    } catch (e) {
      throw Exception('classe LoginDAOSQLite, método excluir');
    } finally {}
  }

  Future<bool> consultarLogin(String email) async {
    late Database db;
    late bool cadastro;
    try {
      const sql = "SELECT * FROM login WHERE email=?";
      db = await Conexao.abrirConexao();

      Map<String, Object?> resultado = (await db.rawQuery(sql, [email])).first;
      if (resultado.isEmpty) {
        cadastro = false;
      } else {
        cadastro = true;
      }

      return cadastro;
    } catch (e) {
      throw Exception('classe TreinoDAO, método consultar');
    } finally {}
  }
}
