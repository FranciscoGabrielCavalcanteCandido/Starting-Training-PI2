import 'package:flutter/material.dart';
import 'package:starting_training/app/dao/alunoDAO.dart';
import 'package:starting_training/app/dao/personalDAO.dart';
import 'package:starting_training/app/domain/entities/pessoaAluno.dart';
import 'package:starting_training/app/domain/entities/pessoaPersonal_trainer.dart';
import 'package:starting_training/app/view/components/criar_campo_input.dart';

class AlunoForm extends StatefulWidget {
  const AlunoForm({Key? key}) : super(key: key);

  @override
  State<AlunoForm> createState() => _AlunoFormState();
}

class _AlunoFormState extends State<AlunoForm> {
  AlunoDAO alunoDAO = AlunoDAO();
  PersonalDAO personalDAO = PersonalDAO();
  late Aluno aluno;
  dynamic id;
  late String nome;
  late String cpfAluno;
  late String telefone;
  late String endereco;
  late String dataNascimento;
  late String status;
  late String academia;
  late String senha;
  PersonalTreiner? personalTreiner;
  String permissao = 'aluno';
  String nomePersonal = 'Selecione o Personal';
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Widget dropdownPersonal() {
      return FutureBuilder(
          future: personalDAO.listarPersonal(),
          builder: (context, AsyncSnapshot<List<PersonalTreiner>> dados) {
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
                onChanged: (personal) {
                  this.personalTreiner = personal;
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
                CampoTexto(
                  rotulo: 'Nome',
                  tipo: TextInputType.text,
                  vincularCampo: (value) => nome = value,
                  retornoValidador: 'Campo obrigatório',
                  visibilidade: false,
                ),
                CampoTexto(
                  rotulo: 'CPF',
                  tipo: TextInputType.text,
                  vincularCampo: (value) => cpfAluno = value,
                  retornoValidador: 'Campo obrigatório',
                  visibilidade: false,
                ),
                CampoTexto(
                  rotulo: 'Data de nascimento',
                  tipo: TextInputType.datetime,
                  vincularCampo: (value) => dataNascimento = value,
                  retornoValidador: 'Campo obrigatório',
                  visibilidade: false,
                ),
                CampoTexto(
                  rotulo: 'Telefone',
                  tipo: TextInputType.number,
                  vincularCampo: (value) => telefone = value,
                  retornoValidador: 'Campo obrigatório',
                  visibilidade: false,
                ),
                CampoTexto(
                  rotulo: 'Endereço',
                  tipo: TextInputType.text,
                  vincularCampo: (value) => endereco = value,
                  retornoValidador: 'Campo obrigatório',
                  visibilidade: false,
                ),
                CampoTexto(
                  rotulo: 'Status',
                  tipo: TextInputType.text,
                  vincularCampo: (value) => status = value,
                  retornoValidador: 'Campo obrigatório',
                  visibilidade: false,
                ),
                CampoTexto(
                  rotulo: 'Senha',
                  tipo: TextInputType.text,
                  vincularCampo: (value) => senha = value,
                  retornoValidador: 'Campo obrigatório',
                  visibilidade: false,
                ),
                dropdownPersonal(),
                Container(
                  padding: EdgeInsets.only(
                    top: 30,
                    bottom: 20,
                  ),
                  child: ElevatedButton(
                    child: Text('Salvar Aluno'),
                    onPressed: () {
                      alunoDAO
                          .salvarAluno(Aluno(
                              nome: nome,
                              cpf: cpfAluno,
                              telefone: telefone,
                              dataNascimento: dataNascimento,
                              endereco: endereco,
                              status: status,
                              senha: senha,
                              permissao: permissao,
                              frequencia: 0,
                              personal: personalTreiner!))
                          .then((value) => Navigator.pop(context));
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
