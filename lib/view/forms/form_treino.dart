
import 'package:cadastro_academia/banco/dao/treinoDAO.dart';
import 'package:cadastro_academia/banco/sqlite/treino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TreinoForm extends StatefulWidget {
  const TreinoForm({Key? key}) : super(key: key);
  @override
  State<TreinoForm> createState() => _TreinoFormState();
}

class _TreinoFormState extends State<TreinoForm> {
  TreinoDAO treinoDAO = TreinoDAO();

  dynamic id;
  String? nome;
  String? ordem;

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
      Map<String, Object?> treino = argumento as Map<String, Object?>;
      id = treino['id'] as int;
      nome = treino['nome'] as String;
      ordem = treino['ordem'] as String;
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                treinoDAO.salvarTreino(
                  Treino(nome: nome!, ordem: ordem!),
                );
                Navigator.pop(context);
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Form(
        child: Column(
          children: [
            _criarCampo('Nome', 'Digite o nome',
                (valorDigitado) => nome = valorDigitado, nome),
            _criarCampo('ordem', 'Digite a ordem',
                (valorDigitado) => ordem = valorDigitado, ordem)
          ],
        ),
      ),
    );
  }
}
