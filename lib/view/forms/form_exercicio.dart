import 'dart:ffi';

import 'package:cadastro_academia/banco/dao/exercicioDAO.dart';
import 'package:cadastro_academia/banco/dao/treinoDAO.dart';
import 'package:cadastro_academia/banco/entities/exercicio.dart';
import 'package:cadastro_academia/banco/entities/treino.dart';
import 'package:cadastro_academia/view/components/criar_campo_input.dart';

import 'package:flutter/material.dart';

class ExercicioForm extends StatefulWidget {
  const ExercicioForm({Key? key}) : super(key: key);
  @override
  State<ExercicioForm> createState() => _ExercicioFormState();
}

class _ExercicioFormState extends State<ExercicioForm> {
  ExercicioDAO exercicioDAO = ExercicioDAO();
  TreinoDAO treinoDAO = TreinoDAO();

  dynamic id;
  String? nome;
  double? peso;
  int? serie;
  int? repeticao;
  dynamic treinoId;

  @override
  Widget build(BuildContext context) {
    var argumento = ModalRoute.of(context)?.settings.arguments;
    if (argumento != null) {
      Map<String, Object?> exercicio = argumento as Map<String, Object?>;
      id = exercicio['id_exercicio'] as int;
      nome = exercicio['nome'] as String;
      peso = exercicio['peso'] as double;
      serie = exercicio['serie'] as int;
      repeticao = exercicio['repeticao'] as int;
      treinoId = exercicio['id_treino'] as int;
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                exercicioDAO.salvarExercicio(Exercicio(
                    nome: nome!,
                    peso: peso!,
                    repeticao: repeticao!,
                    serie: serie!,
                    treino: treinoDAO.consultarTreino(treinoId) as Treino));
                Navigator.pop(context);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Form(
        child: Column(
          children: [
            CampoTexto(
                rotulo: 'Nome',
                tipo: TextInputType.text,
                vincularCampo: (value) => nome = value),
            CampoTexto(
                rotulo: 'Peso',
                tipo: TextInputType.number,
                vincularCampo: (value) => peso = double.parse(value)),
            CampoTexto(
                rotulo: 'Serie',
                tipo: TextInputType.number,
                vincularCampo: (value) => serie = int.parse(value)),
            CampoTexto(
                rotulo: 'Repeticao',
                tipo: TextInputType.number,
                vincularCampo: (value) => repeticao = int.parse(value)),
            CampoTexto(
                rotulo: 'Treino',
                tipo: TextInputType.number,
                vincularCampo: (value) => treinoId = int.parse(value))
          ],
        ),
      ),
    );
  }
}
