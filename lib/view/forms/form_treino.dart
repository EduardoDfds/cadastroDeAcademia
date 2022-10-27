import 'package:cadastro_academia/banco/dao/treinoDAO.dart';
import 'package:cadastro_academia/banco/entities/treino.dart';
import 'package:cadastro_academia/view/components/criar_espaco.dart';

import 'package:flutter/material.dart';

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
    return SizedBox(
      width: 300,
      child: TextFormField(
        decoration: InputDecoration(
            label: Text(rotulo),
            hintText: dica,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
        onChanged: vincularValor,
        initialValue: valorInicial ??= '',
      ),
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
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Cadastro Treino'),
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
      body: Stack(
        children: [
          Center(
            child: Container(
              child: Form(
                child: Column(
                  children: [
                    Container(
                      height: 50,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _criarCampo('Nome', 'Digite o nome',
                              (valorDigitado) => nome = valorDigitado, nome),
                          const CriarEspaco(),
                          _criarCampo('ordem', 'Digite a ordem',
                              (valorDigitado) => ordem = valorDigitado, ordem),
                          const CriarEspaco(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
