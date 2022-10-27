import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Button extends StatelessWidget {
  Button(
      {Key? key,
      required this.icone,
      required this.rotulo,
      required this.cor,
      required this.borda,
      required this.acao})
      : super(key: key);

  Icon icone;
  String rotulo;
  Color cor;
  OutlinedBorder borda;
  VoidCallback acao;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton.icon(
        onPressed: acao,
        icon: icone,
        label: Text(
          rotulo,
          style: const TextStyle(fontSize: 25),
        ),
        style: ElevatedButton.styleFrom(primary: cor, shape: borda),
      ),
    );
  }
}
