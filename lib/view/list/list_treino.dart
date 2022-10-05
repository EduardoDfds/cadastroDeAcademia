import 'package:cadastro_academia/banco/dao/treinoDAO.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../banco/sqlite/treino.dart';

class ListaTreino extends StatefulWidget {
  const ListaTreino({Key? key}) : super(key: key);

  @override
  State<ListaTreino> createState() => _ListaTreinoState();
}

class _ListaTreinoState extends State<ListaTreino> {
  TreinoDAO treinoDAO = TreinoDAO();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Grupo Muscular'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, './formGrupoMuscular').then((value) {
                setState(() {});
              });
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: FutureBuilder(
        future: treinoDAO.listarTreino(),
        builder: (context, AsyncSnapshot<List<Map<String, Object?>>> dados) {
          if (!dados.hasData) {
            return CircularProgressIndicator();
          }
          var treinos = dados.data!;

          return ListView.builder(
            itemCount: treinos.length,
            itemBuilder: (context, index) {
              var treino = treinos[index];

              return Card(
                elevation: 4,
                margin: EdgeInsets.all(8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.pinkAccent,
                    child: Text(
                      treino['ordem'].toString().toUpperCase(),
                    ),
                  ),
                  title: Text(treino['nome'].toString()),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
