import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:starting_training/app/model/sqlite/conecaoSqlite.dart';

class RegistrationPersonalPage extends StatelessWidget {
  int? id;
  String? nome;
  String? CPF;
  String? telefone;
  String? endereco;
  String? dataNascimento;
  String? status;
  String? academia;
  String? senha;
  String permissao = 'personal';
  String? cref;
  String? validadeCref;

  Future<int> salvar() async {
    Database banco = await Conexao.get();
    Future<int> linhasAfetadas;

     linhasAfetadas = banco.rawInsert(Conexao.inserirPersonal, [
      nome,
      CPF,
      telefone,
      endereco,
      dataNascimento,
      status,
      academia,
      senha,
      permissao,
      cref,
      validadeCref
    ]); 
    
    return linhasAfetadas;
  }

  Future<int> excluir(int id) async {
    Database banco = await Conexao.get();
    String sql = "DELETE FROM usuario WHERE id = ?";
    Future<int> linhaAfetada;
    linhaAfetada = banco.rawDelete(sql, [id]);
    return linhaAfetada;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Cadastro de Personal'),
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
              TextField(
                onChanged: (text) {
                  cref = text;
                },
                decoration: InputDecoration(label: Text('Cref')),
              ),
              TextField(
                onChanged: (text) {
                  validadeCref = text;
                },
                decoration: InputDecoration(label: Text('Validade Cref')),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 30,
                  bottom: 20,
                ),
                child: ElevatedButton(
                  child: Text('Salvar Personal'),
                  onPressed: () {
                    salvar(context, null, nome, CPF, telefone);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
