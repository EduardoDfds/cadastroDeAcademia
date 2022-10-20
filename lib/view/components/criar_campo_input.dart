import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  String rotulo;
  ValueChanged<String>? vincularCampo;
  TextInputType tipo;
  String? valorInicial;

  CampoTexto(
      {Key? key,
      required this.rotulo,
      required this.tipo,
      required this.vincularCampo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: tipo,
      onChanged: vincularCampo,
      decoration: InputDecoration(label: Text(rotulo)),
      initialValue: valorInicial ??= '',
    );
  }
}
