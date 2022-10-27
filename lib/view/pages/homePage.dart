import 'package:cadastro_academia/view/forms/form_exercicio.dart';
import 'package:cadastro_academia/view/forms/form_login.dart';
import 'package:cadastro_academia/view/list/list_exercicio.dart';
import 'package:cadastro_academia/view/list/list_treino.dart';
import 'package:cadastro_academia/view/pages/loginPage.dart';
import 'package:flutter/material.dart';

import '../forms/form_treino.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const LoginPage(),
        './homePage': (context) => const MyHomePage(title: 'Bem vindo!'),
        './formLogin': (context) => const LoginForm(),
        './formTreino': (context) => const TreinoForm(),
        './listaTreino': (context) => const ListaTreino(),
        './formExercicio': (context) => const ExercicioForm(),
        './listaExercicio': (context) => const ListaExercicio()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(children: [
            Container(
              child: Image.asset("assets/imagemHome.png"),
            ),
            Container(
                child: ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, './listaTreino'),
              label: Text('Lista de treinos', style: TextStyle(fontSize: 25)),
              style: ElevatedButton.styleFrom(
                  primary: Colors.amber, shape: const StadiumBorder()),
              icon: const Icon(Icons.list),
            ))
          ]),
        ),
      ),
    );
  }
}
