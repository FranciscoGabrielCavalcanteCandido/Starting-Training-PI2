import 'package:flutter/material.dart';

class RegistrationAlunoPage extends StatelessWidget {
  int? id;
  String? nome;
  String? CPF;
  String? telefone;
  String? endereco;
  String? dataNascimento;
  String? status;
  String? academia;
  String? senha;

  @override
  Widget build(BuildContext context) {
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
                      //salvar(context, null, nome, descricao);
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
