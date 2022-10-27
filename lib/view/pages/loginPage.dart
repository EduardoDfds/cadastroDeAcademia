import 'package:cadastro_academia/banco/dao/loginDAO.dart';
import 'package:cadastro_academia/view/components/botao.dart';
import 'package:cadastro_academia/view/components/criar_campo_input.dart';
import 'package:cadastro_academia/view/components/criar_espaco.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginDAO loginDAO = LoginDAO();
  String email = '';
  String? senha;
  String rota = './formLogin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CampoTexto(
                  rotulo: 'Email',
                  tipo: TextInputType.emailAddress,
                  vincularCampo: ((value) => email = value)),
              CriarEspaco(),
              CampoTexto(
                  rotulo: 'Senha',
                  tipo: TextInputType.visiblePassword,
                  vincularCampo: (value) => senha = value),
              SizedBox(
                height: 50,
              ),
              Button(
                  icone: Icon(Icons.person, size: 30),
                  rotulo: 'Entrar',
                  cor: Colors.amber,
                  borda: const StadiumBorder(),
                  acao: () => Navigator.pushNamed(context, './homePage')),
              SizedBox(
                height: 50,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Ainda não tem cadastro ?   '),
                    Text(
                      'Cadastre-se',
                      style: TextStyle(color: Colors.blue),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.email,
                          color: Colors.blue,
                        ),
                        onPressed: () =>
                            Navigator.pushNamed(context, './formLogin'))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
