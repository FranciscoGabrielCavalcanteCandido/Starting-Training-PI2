import 'package:flutter/material.dart';
import 'package:starting_training/app/view/admPage.dart';
import 'package:starting_training/app/view/alunoView/alunoPage.dart';
import 'package:starting_training/app/view/alunoView/listAlunoPage.dart';
import 'package:starting_training/app/view/alunoView/alunoForm.dart';
import 'package:starting_training/app/view/medidaView/medidaForm.dart';

import 'package:starting_training/app/view/my_homePage.dart';
import 'package:starting_training/app/view/personalView/listPersonalPage.dart';
import 'package:starting_training/app/view/personalView/personalPage.dart';
import 'package:starting_training/app/view/personalView/personalForm.dart';
import 'package:starting_training/app/view/treinoView/listTreinoAluno.dart';

import 'view/treinoView/listTreino.dart';
import 'view/treinoView/treinoForm.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Starting Training',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      routes: {
        '/': (context) => const MyHomePage(title: "Start Training"),
        '/admPage': (context) => const AdmPage(),
        '/personalForm': (context) => const PerssonalForm(),
        '/alunoForm': (context) => const AlunoForm(),
        '/listPersonalPage': (context) => const ListPersonalPage(),
        '/treinoForm': (context) => TreinoForm(),
        '/personalPage': (context) => const PersonalPage(),
        '/listAlunoPage': (context) => ListAlunoPage(),
        '/listTreino': (context) => const ListTreino(),
        '/medidaForm': (context) => const MedidaForm(),
        '/listTreinoAluno': (context) => const ListTreinoAluo(),
        '/alunoPage': (context) => AlunoPage(),
        //'/listMedidas':(context) =>
      },
    );
  }
}
