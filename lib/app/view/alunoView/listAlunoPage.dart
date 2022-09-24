import 'package:flutter/material.dart';
import '../../dao/alunoDAO.dart';
import '../../domain/entities/pessoaAluno.dart';

class ListAlunoPage extends StatefulWidget {
  @override
  State<ListAlunoPage> createState() => _ListAlunoPage();
}

class _ListAlunoPage extends State<ListAlunoPage> {
  AlunoDAO alunoDAO = AlunoDAO();
  //FUNÇÃO QUE BUSCA OS DADOS DO PERSONAL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Aluno',
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () =>
                Navigator.pushNamed(context, '/registrationAlunoPage')
                    .then((value) {
              setState(() {});
            }),
          ),
        ],
      ),
      body: FutureBuilder(
        future: alunoDAO.listarAluno(),
        builder: (context, AsyncSnapshot<List<Aluno>> snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
          var lista = snapshot.data!;
          return ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, contador) {
                var aluno = lista[contador];
                return ListTile(
                  title: Text(aluno.nome),
                  trailing: const SizedBox(
                    width: 100,
                  ),
                );
              });
        },
      ),
    );
  }
}
