import 'package:cadastro_academia/view/forms/form_exercicio.dart';
import 'package:cadastro_academia/view/list/list_exercicio.dart';
import 'package:cadastro_academia/view/list/list_treino.dart';
import 'package:flutter/material.dart';

import 'forms/form_treino.dart';

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
        '/': (context) => const MyHomePage(title: 'Bem Vindo!'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /*actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, './listaTreino');
            },
            icon: Icon(Icons.add),
          )
        ],*/
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(children: [
          Image.network(
              'https://www.imagensempng.com.br/wp-content/uploads/2021/07/02-18.png'),
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
    );
  }
}
