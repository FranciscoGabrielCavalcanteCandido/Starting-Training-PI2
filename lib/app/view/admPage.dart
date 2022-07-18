import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AdmPage extends StatelessWidget {
  const AdmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
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
              ),
              child: FlatButton(
                child: Text("Personal"),
                onPressed: () => Navigator.popAndPushNamed(
                    context, "/registrationPersonalPage"),
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
                child: Text("Aluno"),
                onPressed: () => Navigator.popAndPushNamed(
                    context, "/registrationAlunoPage"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
