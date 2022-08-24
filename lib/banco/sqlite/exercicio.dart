import 'package:cadastro_academia/banco/sqlite/grupoMuscular.dart';

class Exercicio {
  final dynamic id;
  final String nome;
  final double peso;
  final int serie;
  final int repeticao;
  final GrupoMuscular grupoMuscular;

  Exercicio(
      {this.id,
      required this.nome,
      required this.peso,
      required this.repeticao,
      required this.serie,
      required this.grupoMuscular});
}
