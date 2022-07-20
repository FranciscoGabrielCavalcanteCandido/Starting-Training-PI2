import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegistrationTreinoPage extends StatelessWidget {
  int? id;
  int? ordem;
  String? status;
  String? nome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Cadastro de Treino'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        child: Form(
          child: ListView(
            children: <Widget>[
              TextField(
                onChanged: (ordemDigitado) {
                  ordem = int.parse(ordemDigitado);
                },
                decoration: InputDecoration(label: Text('Ordem')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
