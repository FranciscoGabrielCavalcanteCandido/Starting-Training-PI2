import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:starting_training/app/dao/alunoDAO.dart';
import 'package:starting_training/app/dao/personalDAO.dart';
import 'package:starting_training/app/domain/entities/pessoaPersonal_trainer.dart';

import '../../domain/entities/pessoaAluno.dart';

class ListPersonalPage extends StatefulWidget {
  @override
  State<ListPersonalPage> createState() => _ListPersonalPageState();
}

class _ListPersonalPageState extends State<ListPersonalPage> {
  PersonalDAO personalDAO = PersonalDAO();
  //FUNÇÃO QUE BUSCA OS DADOS DO PERSONAL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Perosnal',
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () =>
                Navigator.pushNamed(context, '/registrationPersonalPage')
                    .then((value) {
              setState(() {});
            }),
          ),
        ],
      ),
      body: FutureBuilder(
        future: personalDAO.listarPersonal(),
        builder: (context, AsyncSnapshot<List<PersonalTreiner>> snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
          var lista = snapshot.data!;
          return ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, contador) {
                var personal = lista[contador];
                return ListTile(
                  title: Text(personal.nome),
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
