import 'package:flutter/material.dart';

class AdmPage extends StatelessWidget {
  const AdmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 47, 47, 47),
        title: Text("Pagina Admnistrador"),
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
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: FlatButton(
                child: Text("Personal"),
                onPressed: () =>
                    Navigator.popAndPushNamed(context, "/listPersonalPage"),
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
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: FlatButton(
                child: Text("Aluno"),
                onPressed: () => Navigator.popAndPushNamed(
                    context, "/registrationAlunoPage"),
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
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: FlatButton(
                child: Text("Treino"),
                onPressed: () =>
                    Navigator.popAndPushNamed(context, "/tareaList"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
