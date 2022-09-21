import 'package:cadastro_academia/banco/dao/grupoMuscularDAO.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../banco/sqlite/grupoMuscular.dart';

class ListaGrupoMuscular extends StatefulWidget {
  const ListaGrupoMuscular({Key? key}) : super(key: key);

  @override
  State<ListaGrupoMuscular> createState() => _ListaGrupoMuscularState();
}

class _ListaGrupoMuscularState extends State<ListaGrupoMuscular> {
  GrupoMuscularDAO grupoMuscularDAO = GrupoMuscularDAO();
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
        future: grupoMuscularDAO.listarGrupoMuscular(),
        builder: (context, AsyncSnapshot<List<GrupoMuscular>> dados) {
          if (!dados.hasData) {
            return CircularProgressIndicator();
          }
          var grupos = dados.data!;

          return ListView.builder(
            itemCount: grupos.length,
            itemBuilder: (context, index) {
              var grupo = grupos[index];

              return Card(
                elevation: 4,
                margin: EdgeInsets.all(8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.pinkAccent,
                    child: Text(
                      grupo.nome.toString().substring(0, 1).toUpperCase(),
                    ),
                  ),
                  title: Text(grupo.nome),
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
