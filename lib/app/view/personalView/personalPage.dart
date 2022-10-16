import 'package:flutter/material.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 47, 47, 47),
        title: const Text("Pagina Personal"),
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
              decoration: const BoxDecoration(
                color: Colors.amber,
              ),
              child: ElevatedButton(
                child: const Text("Alunos"),
                onPressed: () =>
                    Navigator.popAndPushNamed(context, "/listAlunoPage"),
              ),
            ),
            Container(
              height: 30,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: Colors.amber,
              ),
              child: ElevatedButton(
                child: const Text("Treinos"),
                onPressed: () => Navigator.popAndPushNamed(
                    context, "/registrationTreinoPage"),
              ),
            ),
            Container(
              height: 30,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: Colors.amber,
              ),
              child: ElevatedButton(
                child: const Text("Relatórios"),
                onPressed: () => Navigator.popAndPushNamed(
                    context, "/generationRelatorioPage"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
