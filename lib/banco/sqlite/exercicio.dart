import 'package:cadastro_academia/banco/sqlite/treino.dart';

class Exercicio {
  final dynamic id;
  final String nome;
  final double peso;
  final int serie;
  final int repeticao;
  final Treino treino;

  Exercicio(
      {this.id,
      required this.nome,
      required this.peso,
      required this.repeticao,
      required this.serie,
      required this.treino});
}
