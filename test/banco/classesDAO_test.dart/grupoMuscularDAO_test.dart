/*import 'package:cadastro_academia/banco/sqlite/conexao.dart'; 
import 'package:cadastro_academia/banco/sqlite/treino.dart';
import 'package:cadastro_academia/banco/dao/grupoMuscularDAO.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late Database db;
  late GrupoMuscular grupoMuscularPeito;
  setUp(() async {
    sqfliteFfiInit();
    databaseFactory =
        databaseFactoryFfi; // permite fazer os testes sem precisar do android
    String caminho = join(await getDatabasesPath(), 'banco.db');
    deleteDatabase(caminho);
    db = await Conexao.abrirConexao();

    grupoMuscularPeito = GrupoMuscular(id: 1, nome: 'Peito');
  });

  tearDownAll(() {
    db.close();
  });

  tearDown(() {});

  group('Testando a classe grupoMuscularDAO ', () {
    test('Testando o método salvar grupo muscular', () async {
      var resultado =
          await GrupoMuscularDAO().salvarGrupoMuscular(grupoMuscularPeito);
      expect(resultado, true);
    });

    test('Testando metodo alterar Grupo muscular', () async {
      await GrupoMuscularDAO().salvarGrupoMuscular(grupoMuscularPeito);
      var grupoMuscular2 = GrupoMuscular(id: 1, nome: 'deutoides');
      var resultado =
          await GrupoMuscularDAO().alterarGrupoMuscular(grupoMuscular2);
      expect(resultado,true);
    });

    test('Testando o método excluir grupo muscular', () async {
      await GrupoMuscularDAO().salvarGrupoMuscular(grupoMuscularPeito);
      var resultado = await GrupoMuscularDAO().excluirGrupoMuscular(1);
      expect(resultado, true);
    });

    test('Testando método consulta grupo muscular', () async {
      await GrupoMuscularDAO().salvarGrupoMuscular(grupoMuscularPeito);
      var resultado = await GrupoMuscularDAO().consultarGrupoMuscular(1);
      expect(resultado, isInstanceOf<GrupoMuscular>());
    });

    test('Testando o método listar exercicio', () async {
      await GrupoMuscularDAO().salvarGrupoMuscular(grupoMuscularPeito);
      var resultado = await GrupoMuscularDAO().listarGrupoMuscular();
      expect(resultado, isInstanceOf<List<GrupoMuscular>>());
    });
  });
}*/
