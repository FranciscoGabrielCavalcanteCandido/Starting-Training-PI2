import 'package:flutter/material.dart';

class AdmPage extends StatelessWidget {
  const AdmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 47, 47, 47),
        title: const Text("Pagina Admnistrador"),
      ),
      body: Container(
        padding: const EdgeInsets.only(
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
              child: ElevatedButton(
                child: const Text("Personal"),
                onPressed: () =>
                    Navigator.pushNamed(context, "/listPersonalPage"),
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
              child: ElevatedButton(
                child: const Text("Aluno"),
                onPressed: () => Navigator.pushNamed(context, "/listAlunoPage"),
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
              child: ElevatedButton(
                child: const Text("Treino"),
                onPressed: () => Navigator.pushNamed(context, "/listTreino"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
