import 'package:cadastro_academia/banco/sqlite/conexao.dart';
import 'package:cadastro_academia/banco/sqlite/exercicio.dart';
import 'package:cadastro_academia/banco/dao/exercicioDAO.dart';
import 'package:cadastro_academia/banco/sqlite/grupoMuscular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late Database db;
  late Exercicio exercicio;

  setUp(() async {
    sqfliteFfiInit();
    databaseFactory =
        databaseFactoryFfi; // permite fazer os testes sem precisar do android
    String caminho = join(await getDatabasesPath(), 'banco.db');
    deleteDatabase(caminho);
    db = await Conexao.abrirConexao();
    var grupoMuscular = GrupoMuscular(id: 1, nome: 'deutoides');
    exercicio = Exercicio(
        id: 1,
        nome: 'Supino',
        peso: 15.0,
        repeticao: 10,
        serie: 3,
        grupoMuscular: grupoMuscular);
  });

  tearDownAll(() {
    db.close();
  });

  tearDown(() {});

  group('Testando a classe exercicioDAO ', () {
    test('Testando o método salvar exercicio', () async {
      var resultado = await ExercicioDAO().salvarExercicio(exercicio);
      expect(resultado, true);
    });

    test('Testando o método excluir exercicio', () async {
      await ExercicioDAO().salvarExercicio(exercicio);
      var resultado = await ExercicioDAO().excluirExercicio(1);
      expect(resultado, true);
    });

    test('Testando metodo alterar Exercicio', () async {
      var grupoMuscular2 = GrupoMuscular(id: 1, nome: 'deutoides');
      await ExercicioDAO().salvarExercicio(exercicio);
      var exercicio2 = Exercicio(
          id: 1, nome: 'Barra scot', peso: 40.0, repeticao: 10, serie: 3, grupoMuscular: grupoMuscular2);
      var resultado = await ExercicioDAO().alterarExercicio(exercicio2);
      expect(resultado, true);
    });

    test('Testando o método consultar Exercicio', () async {
      await ExercicioDAO().salvarExercicio(exercicio);
      var resultado = await ExercicioDAO().consultarExercicio(1);
      expect(resultado, isInstanceOf<Exercicio>());
    });

    test('Testando o método listar exercicio', () async {
      await ExercicioDAO().salvarExercicio(exercicio);
      var resultado = await ExercicioDAO().listarExerxixios();
      expect(resultado, isInstanceOf<List<Exercicio>>());
    });
  });
}
