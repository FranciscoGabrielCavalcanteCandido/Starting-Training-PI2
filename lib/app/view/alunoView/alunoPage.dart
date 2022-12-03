import 'package:flutter/material.dart';
import 'package:starting_training/app/domain/entities/pessoaAluno.dart';

class AlunoPage extends StatefulWidget {
  AlunoPage({Key? key}) : super(key: key);

  @override
  State<AlunoPage> createState() => _AlunoPageState();
}

class _AlunoPageState extends State<AlunoPage> {
  late Aluno aluno;

  @override
  Widget build(BuildContext context) {
    var argumento = ModalRoute.of(context)?.settings.arguments;
    if (argumento != null) {
      aluno = argumento as Aluno;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 47, 47, 47),
        title: const Text("Pagina Aluno"),
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
                child: const Text("Treinos"),
                onPressed: () => Navigator.popAndPushNamed(
                    context, "/listadeTreinoAluno",
                    arguments: aluno),
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
                  onPressed: () {
                    // Navigator.popAndPushNamed(context, "/relatoriosPage"),
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
