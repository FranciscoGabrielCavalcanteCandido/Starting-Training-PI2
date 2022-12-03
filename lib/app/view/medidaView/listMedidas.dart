import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:starting_training/app/dao/medidaDAO.dart';
import 'package:starting_training/app/domain/entities/pessoaAluno.dart';

class ListMedidas extends StatefulWidget {
  const ListMedidas({Key? key}) : super(key: key);

  @override
  State<ListMedidas> createState() => _ListMedidasState();
}

class _ListMedidasState extends State<ListMedidas> {
  MedidaDAO medidaDAO = MedidaDAO();
  late Aluno aluno;

  @override
  Widget build(BuildContext context) {
    var argumento = ModalRoute.of(context)?.settings.arguments;
    if (argumento == null) {
      aluno = argumento as Aluno;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Medidas'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(context, '/medidaForm'),
          )
        ],
      ),
      body: FutureBuilder(
        future: medidaDAO.listarMedidas(),
        builder: (context, AsyncSnapshot<List<Map<String, Object?>>> snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
          var lista = snapshot.data!;

          return ListView.builder(
            itemCount: lista.length,
            itemBuilder: (context, contador) {
              var medidas = lista[contador];
              return Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 5,
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(medidas['data_avaliacao'].toString()),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.edit),
                                color: Colors.blue,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text('Altura: ${medidas['altura'].toString()} Mtr'),
                          Text('Peso : ${medidas['altura'].toString()} Kg'),
                          Text('Braço: ${medidas['braco'].toString()} Cm'),
                          Text('Quadril: ${medidas['quadril'].toString()} Cm'),
                          Text('Perna: ${medidas['perna'].toString()} Cm'),
                          Text('Cintura: ${medidas['cintura'].toString()} Cm'),
                          Text('IMC: ${medidas['imc'].toString()}')
                        ],
                      )
                    ],
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
