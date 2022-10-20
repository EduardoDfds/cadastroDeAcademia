import 'package:cadastro_academia/banco/dao/exercicioDAO.dart';
import 'package:cadastro_academia/banco/dao/treinoDAO.dart';
import 'package:cadastro_academia/banco/entities/treino.dart';
import 'package:flutter/material.dart';

class ListaExercicio extends StatefulWidget {
  const ListaExercicio({Key? key}) : super(key: key);

  @override
  State<ListaExercicio> createState() => _ListaExercicioState();
}

class _ListaExercicioState extends State<ListaExercicio> {
  ExercicioDAO exercicioDAO = ExercicioDAO();
  late Treino treino;

  @override
  Widget build(BuildContext context) {
    var argumento = ModalRoute.of(context)?.settings.arguments;
    if (argumento != null) {
      treino = argumento as Treino;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercicios'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, './formExercicio').then((value) {
                setState(() {});
              });
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: FutureBuilder(
        future: exercicioDAO.listarExerxixiosPorTreino(treino.id),
        builder: (context, AsyncSnapshot<List<Map<String, Object?>>> dados) {
          if (!dados.hasData) {
            return const CircularProgressIndicator();
          }
          var exercicios = dados.data!;

          return ListView.builder(
            itemCount: exercicios.length,
            itemBuilder: (context, index) {
              var exercicio = exercicios[index];

              return Center(
                child: Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(exercicio['nome'].toString()),
                    subtitle: Text('''Peso: ${exercicio['peso'].toString()}\n
                    Série: ${exercicio['serie']}/n
                    Repetições: ${exercicio['repeticao']}/n
                    '''),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
