import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BotaoSalvar extends StatelessWidget {
  BotaoSalvar(
      {required this.borda,
      required this.cor,
      required this.icone,
      required this.rotulo,
      required this.acao,
      Key? key})
      : super(key: key);

  late String rotulo;
  late Icon icone;
  late Color cor;
  late OutlinedBorder borda;
  Function acao;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton.icon(
      onPressed: () => acao,
      label: Text('Salvar', style: TextStyle(fontSize: 25)),
      style: ElevatedButton.styleFrom(
          primary: Colors.amber, shape: const StadiumBorder()),
      icon: const Icon(Icons.list),
    ));
  }
}
