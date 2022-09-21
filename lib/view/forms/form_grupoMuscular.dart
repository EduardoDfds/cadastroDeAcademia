import 'package:cadastro_academia/banco/dao/grupoMuscularDAO.dart';
import 'package:cadastro_academia/banco/sqlite/grupoMuscular.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GrupoMuscularForm extends StatefulWidget {
  const GrupoMuscularForm({Key? key}) : super(key: key);
  @override
  State<GrupoMuscularForm> createState() => _GrupoMuscularFormState();
}

class _GrupoMuscularFormState extends State<GrupoMuscularForm> {
  GrupoMuscularDAO grupoMuscularDAO = GrupoMuscularDAO();

  dynamic id;
  String? nome;

  Widget _criarCampo(String rotulo, String? dica,
      ValueChanged<String>? vincularValor, String? valorInicial) {
    return TextFormField(
      decoration: InputDecoration(label: Text(rotulo), hintText: dica),
      onChanged: vincularValor,
      initialValue: valorInicial ??= '',
    );
  }

  @override
  Widget build(BuildContext context) {
    var argumento = ModalRoute.of(context)?.settings.arguments;
    if (argumento != null) {
      Map<String, Object?> grupoMuscular = argumento as Map<String, Object?>;
      id = grupoMuscular['id'] as int;
      nome = grupoMuscular['nome'] as String;
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                grupoMuscularDAO.salvarGrupoMuscular(
                  GrupoMuscular(nome: nome!),
                );
                Navigator.pop(context);
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Form(
        child: Column(
          children: [
            _criarCampo('Nome', 'Digite o grupo muscular',
                (valorDigitado) => nome = valorDigitado, nome)
          ],
        ),
      ),
    );
  }
}
