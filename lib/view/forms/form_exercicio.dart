import 'package:cadastro_academia/banco/dao/exercicioDAO.dart';
import 'package:cadastro_academia/banco/dao/treinoDAO.dart';
import 'package:cadastro_academia/banco/entities/exercicio.dart';
import 'package:cadastro_academia/banco/entities/treino.dart';
import 'package:cadastro_academia/view/components/botao.dart';
import 'package:cadastro_academia/view/components/criar_campo_input.dart';
import 'package:cadastro_academia/view/components/criar_espaco.dart';

import 'package:flutter/material.dart';
import 'package:path/path.dart';

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
  Treino? treino;
  String nomeTreino = 'Selecione o Treino';

  @override
  Widget build(BuildContext context) {
    Widget dropdownTreino() {
      return FutureBuilder(
        future: treinoDAO.listarTreino(),
        builder: (context, AsyncSnapshot<List<Treino>> dados) {
          var treinos = dados.data;
          return SizedBox(
            width: 300,
            height: 100,
            child: DropdownButtonFormField<Treino>(
              isExpanded: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
              hint: Text(nomeTreino),
              items: treinos!.map<DropdownMenuItem<Treino>>((Treino treino) {
                return DropdownMenuItem<Treino>(
                    value: treino, child: Text(treino.nome));
              }).toList(),
              onChanged: (treino) {
                ///nomeTreino = treino!.nome;
                this.treino = treino;
                print(this.treino!.nome);
              },
            ),
          );
        },
      );
    }

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
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Exercicios'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Center(
        child: Container(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CampoTexto(
                    rotulo: 'Nome',
                    tipo: TextInputType.text,
                    vincularCampo: (value) => nome = value),
                const CriarEspaco(),
                CampoTexto(
                    rotulo: 'Peso',
                    tipo: TextInputType.number,
                    vincularCampo: (value) => peso = double.parse(value)),
                const CriarEspaco(),
                CampoTexto(
                    rotulo: 'Serie',
                    tipo: TextInputType.number,
                    vincularCampo: (value) => serie = int.parse(value)),
                const CriarEspaco(),
                CampoTexto(
                    rotulo: 'Repeticao',
                    tipo: TextInputType.number,
                    vincularCampo: (value) => repeticao = int.parse(value)),
                const CriarEspaco(),
                dropdownTreino(),
                Container(
                  child: Button(
                      icone: Icon(Icons.save),
                      rotulo: 'Salvar',
                      cor: Colors.amber,
                      borda: StadiumBorder(),
                      acao: () => exercicioDAO
                          .salvarExercicio(Exercicio(
                              nome: nome!,
                              peso: peso!,
                              repeticao: repeticao!,
                              serie: serie!,
                              treino: treino!))
                          .then((value) => Navigator.pop(context))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
