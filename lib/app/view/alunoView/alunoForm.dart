import 'package:flutter/material.dart';
import 'package:starting_training/app/dao/alunoDAO.dart';
import 'package:starting_training/app/dao/personalDAO.dart';
import 'package:starting_training/app/domain/entities/pessoaAluno.dart';
import 'package:starting_training/app/domain/entities/pessoaPersonal_trainer.dart';

class AlunoForm extends StatefulWidget {
  const AlunoForm({Key? key}) : super(key: key);

  @override
  State<AlunoForm> createState() => _AlunoFormState();
}

class _AlunoFormState extends State<AlunoForm> {
  AlunoDAO alunoDAO = AlunoDAO();
  PersonalDAO personalDAO = PersonalDAO();
  Aluno? aluno;
  int? id;
  String? nome;
  String? CPF;
  String? telefone;
  String? endereco;
  String? dataNascimento;
  String? status;
  String? academia;
  String? senha;
  late PersonalTreiner personalTreiner;
  String nomePersonal = 'Selecione o Personal';
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Widget dropdownAluno() {
      return FutureBuilder(
          future: personalDAO.consultarPersonal(personalTreiner.id),
          builder: (context, AsyncSnapshot<PersonalTreiner> dados) {
            List<PersonalTreiner> personais =
                dados.data as List<PersonalTreiner>;

            return SizedBox(
              width: 300,
              height: 100,
              child: DropdownButtonFormField<PersonalTreiner>(
                isExpanded: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
                hint: Text(nomePersonal),
                items: personais!.map<DropdownMenuItem<PersonalTreiner>>(
                    (PersonalTreiner personal) {
                  return DropdownMenuItem<PersonalTreiner>(
                      value: personal, child: Text(personal.nome));
                }).toList(),
                onChanged: (aluno) {
                  this.personalTreiner = personalTreiner;
                  print(this.personalTreiner!.nome);
                },
              ),
            );
          });
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 47, 47, 47),
          title: Text("Cadastro de Aluno"),
        ),
        body: Container(
          padding: EdgeInsets.only(
            top: 60,
            left: 40,
            right: 40,
          ),
          child: Form(
            key: formKey,
            child: ListView(
              children: <Widget>[
                TextField(
                  onChanged: (nomeDigitado) {
                    nome = nomeDigitado;
                  },
                  decoration: InputDecoration(label: Text('Nome')),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (cpfDigitado) {
                    CPF = cpfDigitado;
                  },
                  decoration: InputDecoration(label: Text('CPF')),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (telefoneDigitado) {
                    telefone = telefoneDigitado;
                  },
                  decoration: InputDecoration(label: Text('Telefone')),
                ),
                TextField(
                  onChanged: (enderecoDigitado) {
                    endereco = enderecoDigitado;
                  },
                  decoration: InputDecoration(label: Text('Endereço')),
                ),
                TextField(
                  onChanged: (academiaDigitada) {
                    academia = academiaDigitada;
                  },
                  decoration: InputDecoration(label: Text('Academia')),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (dataNascimentoDigitado) {
                    dataNascimento = dataNascimentoDigitado;
                  },
                  decoration:
                      InputDecoration(label: Text('Data de Nascimento')),
                ),
                TextField(
                  onChanged: (senhaDigitada) {
                    senha = senhaDigitada;
                  },
                  decoration: InputDecoration(label: Text('Senha')),
                ),
                TextField(
                  onChanged: (statusDigitado) {
                    status = statusDigitado;
                  },
                  decoration: InputDecoration(label: Text('Status')),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 30,
                    bottom: 20,
                  ),
                  child: ElevatedButton(
                    child: Text('Salvar Aluno'),
                    onPressed: () {
                      //alunoDAO.salvarAluno()
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
