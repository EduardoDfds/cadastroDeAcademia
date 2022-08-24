import 'package:cadastro_academia/banco/sqlite/conexao.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  late Database db;

  setUp(() async {
    sqfliteFfiInit();
    databaseFactory =
        databaseFactoryFfi; // permite fazer os testes sem precisar do android
    String caminho = join(await getDatabasesPath(), 'banco.db');
    deleteDatabase(caminho);
    db = await Conexao.abrirConexao();
  });

  tearDownAll(() {
    db.close();
  });

  group('teste de conexão', () {
    
    test("testando se a conexão está aberta", () {
      expect(db.isOpen, true);
    });

    test('Testando a conexão na consulta da tabela exercicio', () async {
      var resultado = await db.query('exercicio');
      expect(resultado.length, isInstanceOf<int>());
    });


    test('Testando a conexão na consulta da tabela grupoMuscular', () async {
      var resultado = await db.query('grupoMuscular');
      expect(resultado.length, isInstanceOf<int>());
    });
  });
}
