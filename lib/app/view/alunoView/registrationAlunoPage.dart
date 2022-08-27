import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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

  /*salvar(BuildContext context, int? id, String? nome,String? CPF,String? telefone,) async {
    var caminho = join(await getDatabasesPath(), 'banco.db');
    Database banco = await openDatabase(caminho);

    String sql;

    if (id == null) {
      sql = 'INSERT INTO usuario (nome, descricao) VALUES (?,?)';
      banco.rawInsert(sql, [nome, descricao]);
    } else {
      sql = 'UPDATE usuario SET nome = ?, descricao = ? WHRE id = ?';
      banco.rawUpdate(sql, [nome, descricao, id]);
    }

    Navigator.push(context, new MaterialPageRoute(
        builder:(context)=> MyApp()
    ),);
  }
  
  
  cadastrar(int? id, String nome, String descricao) async {
    var caminho = join(await getDatabasesPath(), 'banco.db');
    var banco = await openDatabase(caminho);

    String sql;

    if (id == null) {
      sql = 'INSERT INTO usuario (nome, descricao) VALUES (?,?)';
      banco.rawInsert(sql, [nome, descricao]);
    } else {
      sql = 'UPDATE usuario SET nome = ?, descricao = ? WHRE id = ?';
      banco.rawUpdate(sql, [nome, descricao, id]);
    }
  }
  
  Future<int> excluir(int id) async {
    String caminho = join(await getDatabasesPath(), 'banco.db');
    Database banco = await openDatabase(caminho, version: 1);
    String sql = "DELETE FROM usuario WHERE id = ?";
    Future<int> linhaAfetada;
    linhaAfetada = banco.rawDelete(sql, [id]);
    return linhaAfetada;

    navigator.pop
  }*/

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
