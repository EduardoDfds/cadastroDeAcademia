import 'package:cadastro_academia/banco/dao/treinoDAO.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../banco/entities/treino.dart';

class ListaTreino extends StatefulWidget {
  const ListaTreino({Key? key}) : super(key: key);

  @override
  State<ListaTreino> createState() => _ListaTreinoState();
}

class _ListaTreinoState extends State<ListaTreino> {
  TreinoDAO treinoDAO = TreinoDAO();
  @override
  Widget build(BuildContext context) {
    var argumento = ModalRoute.of(context)?.settings.arguments;
    if (argumento != null) {
      Map<String, Object?> treino = argumento as Map<String, Object?>;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Treinos'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, './formTreino').then((value) {
                setState(() {});
              });
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: FutureBuilder(
        future: treinoDAO.listarTreino(),
        builder: (context, AsyncSnapshot<List<Treino>> dados) {
          if (!dados.hasData) {
            return const CircularProgressIndicator();
          }
          var treinos = dados.data!;

          return ListView.builder(
            itemCount: treinos.length,
            itemBuilder: (context, index) {
              var treino = treinos[index];

              return Center(
                child: Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.pinkAccent,
                      child: Text(
                        treino.ordem.toUpperCase(),
                      ),
                    ),
                    title: Text(treino.nome.toString()),
                    trailing: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios_outlined),
                        onPressed: () => Navigator.pushNamed(
                                    context, './listaExercicio',
                                    arguments: treino)
                                .then((value) {
                              setState(() {});
                            })),
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
