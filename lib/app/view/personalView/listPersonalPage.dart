import 'package:flutter/material.dart';
import 'package:starting_training/app/dao/personalDAO.dart';

class ListPersonalPage extends StatefulWidget {
  const ListPersonalPage({Key? key}) : super(key: key);

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
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: const Icon(Icons.person_add),
              onPressed: () {
                Navigator.pushNamed(context, '/PersonalForm').then((value) {
                  setState(() {});
                });
              }),
        ],
      ),
      body: FutureBuilder(
        future: personalDAO.listarPersonal(),
        builder: (context, AsyncSnapshot<List<Map<String, Object?>>> snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
          var lista = snapshot.data!;
          return ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, contador) {
                var personal = lista[contador];
                return ListTile(
                  title: Text(personal["nome"].toString()),
                  subtitle: Text(personal["id"].toString()),
                  trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              Navigator.pushNamed(context, '/PersonalForm',
                                      arguments: personal)
                                  .then((value) {
                                setState(() {});
                              });
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            color: Colors.red,
                            onPressed: () => personalDAO
                                .excluirPersonal(personal["id"] as int)
                                .then((value) {
                              setState(() {});
                            }),
                          ),
                        ],
                      )),
                );
              });
        },
      ),
    );
  }
}
