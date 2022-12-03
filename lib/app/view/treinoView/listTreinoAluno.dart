import 'package:flutter/material.dart';
import 'package:starting_training/app/dao/treinoDAO.dart';
import 'package:starting_training/app/domain/entities/pessoaAluno.dart';

import '../../domain/entities/treino.dart';

class ListTreinoAluo extends StatefulWidget {
  const ListTreinoAluo({Key? key}) : super(key: key);

  @override
  State<ListTreinoAluo> createState() => _ListTreinoAluoState();
}

class _ListTreinoAluoState extends State<ListTreinoAluo> {
  TreinoDAO treinoDAO = TreinoDAO();
  late Aluno aluno;
  late Treino treino;

  @override
  Widget build(BuildContext context) {
    var argumento = ModalRoute.of(context)?.settings.arguments;
    if (argumento == null) {
      treino = argumento as Treino;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista Treino'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: treinoDAO.listarTreinos(),
        builder: (context, AsyncSnapshot<List<Treino>> snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
          var lista = snapshot.data!;

          return ListView.builder(
            itemCount: lista.length,
            itemBuilder: (context, contador) {
              var treino = lista[contador];
              return Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 5,
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Text(treino.ordem.toUpperCase()),
                    ),
                    title: Text(treino.nome),
                    subtitle: Text(treino.status),
                    trailing: SizedBox(
                      width: 145,
                      child: Row(
                        children: [
                          IconButton(
                              icon:
                                  const Icon(Icons.arrow_forward_ios_outlined),
                              onPressed: () => Navigator.pushNamed(
                                          context, './listExercicioAluno',
                                          arguments: treino)
                                      .then((value) {
                                    setState(() {});
                                  })),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
