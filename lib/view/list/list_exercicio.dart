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
    Image imagemFundo = Image.asset('assets/imagemExercice.png');
    var argumento = ModalRoute.of(context)?.settings.arguments;
    if (argumento != null) {
      treino = argumento as Treino;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
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
      body: Stack(
        children: [
          Container(
            child: SizedBox.expand(
                child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: imagemFundo.width,
                height: imagemFundo.height,
                child: imagemFundo,
              ),
            )),
          ),
          FutureBuilder(
            future: exercicioDAO.listarExerxixiosPorTreino(treino.id),
            builder:
                (context, AsyncSnapshot<List<Map<String, Object?>>> dados) {
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
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              exercicio['nome'].toString(),
                              style: TextStyle(fontSize: 30),
                            ),
                            subtitle: Text(
                                '''Peso: ${exercicio['peso'].toString()} Kg\nSérie: ${exercicio['serie']}\nRepetições: ${exercicio['repeticao']}
                        '''),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
