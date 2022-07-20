import 'package:flutter/material.dart';
import 'package:starting_training/app/view/admPage.dart';
import 'package:starting_training/app/view/alunoView/registrationAlunoPage.dart';

import 'package:starting_training/app/view/my_homePage.dart';
import 'package:starting_training/app/view/personalView/listPersonalPage.dart';
import 'package:starting_training/app/view/personalView/registrationPersonalPage.dart';

import 'view/listTreinoPage/listTreino.dart';
import 'view/listTreinoPage/treinoForm.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Starting Training',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => MyHomePage(title: "StratTrianing"),
        '/admPage': (context) => AdmPage(),
        '/registrationPersonalPage': (context) => RegistrationPersonalPage(),
        '/registrationAlunoPage': (context) => RegistrationAlunoPage(),
        '/listPersonalPage': (context) => ListPersonalPage(),
        '/tarefaForm': (context) => TarefaForm(),
        '/tareaList': (context) => TarefaLista(),
      },
    );
  }
}
