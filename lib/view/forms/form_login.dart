import 'package:cadastro_academia/banco/dao/loginDAO.dart';
import 'package:cadastro_academia/banco/entities/login.dart';
import 'package:cadastro_academia/view/components/botao.dart';
import 'package:cadastro_academia/view/components/criar_campo_input.dart';
import 'package:cadastro_academia/view/components/criar_espaco.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String? nome;
  String? email;
  String? senha;
  LoginDAO loginDAO = LoginDAO();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CampoTexto(
                  rotulo: 'Nome',
                  tipo: TextInputType.name,
                  vincularCampo: (valorDigitado) => nome = valorDigitado),
              CriarEspaco(),
              CampoTexto(
                  rotulo: 'Email',
                  tipo: TextInputType.emailAddress,
                  vincularCampo: (valorDigitado) => email = valorDigitado),
              CriarEspaco(),
              CampoTexto(
                  rotulo: 'Senha',
                  tipo: TextInputType.visiblePassword,
                  vincularCampo: (valorDigitado) => senha = valorDigitado),
              CriarEspaco(),
              Container(
                  child: Button(
                icone: Icon(Icons.person_add),
                rotulo: 'Salvar',
                cor: Colors.amber,
                borda: StadiumBorder(),
                acao: () => loginDAO
                    .salvarLogin(
                        Login(nome: nome!, email: email!, senha: senha!))
                    .then((value) => Navigator.pop(context)),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
