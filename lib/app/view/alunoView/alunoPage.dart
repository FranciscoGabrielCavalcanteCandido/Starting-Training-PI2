import 'package:flutter/material.dart';

class AlunoPage extends StatelessWidget {
  const AlunoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Pagina Aluno"),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 200,
          left: 40,
          right: 40,
        ),
        child: ListView(
          children: <Widget>[
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: FlatButton(
                child: Text("Treinos"),
                onPressed: () =>
                    Navigator.popAndPushNamed(context, "/listadeTreinosPage"),
              ),
            ),
            Container(
              height: 30,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: FlatButton(
                child: Text("Relatórios"),
                onPressed: () =>
                    Navigator.popAndPushNamed(context, "/relatoriosPage"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
