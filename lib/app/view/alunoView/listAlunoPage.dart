import 'package:flutter/material.dart';
import 'package:starting_training/app/view/components/botao.dart';
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
                Navigator.pushNamed(context, '/alunoForm').then((value) {
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

                return Center(
                  child: Card(
                    elevation: 5,
                    margin: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            aluno.nome,
                            style: TextStyle(fontSize: 25),
                          ),
                          subtitle: Text(aluno.status),
                          trailing: SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.delete))
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Button(
                                icone: Icon(Icons.list),
                                rotulo: 'Medidas',
                                cor: Colors.amber,
                                borda: StadiumBorder(),
                                acao: () {
                                  Navigator.pushNamed(context, "/listMedidas",
                                      arguments: aluno);
                                }),
                            Button(
                                icone: Icon(Icons.list),
                                rotulo: 'Treinos',
                                cor: Colors.amber,
                                borda: StadiumBorder(),
                                acao: () {
                                  Navigator.pushNamed(context, "/listTreino",
                                      arguments: aluno);
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
