import 'package:cadastro_academia/banco/sqlite/script.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  setUp(() {});

  group('testando o script banco', () {

    test('testado o script de comando do banco', () {
    expect(criarBanco, isInstanceOf<List<String>>());
  });

    test('testado o script de comando do banco é vazio', () {
    expect(criarBanco, isNotEmpty);
  });
  
    test('testado o script de comando do banco é nulo', () {
    expect(criarBanco, isNotNull);
  });

  });
}
