import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegistrationUserPage extends StatelessWidget {
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
        backgroundColor: Colors.amber,
        title: Text('Cadastro de Usuário'),
        centerTitle: true,
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
                decoration: InputDecoration(label: Text('Data de Nascimento')),
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
            ],
          ),
        ),
      ),
    );
  }
}
