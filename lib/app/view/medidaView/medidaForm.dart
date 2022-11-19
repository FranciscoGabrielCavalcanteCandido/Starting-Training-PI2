import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:starting_training/app/dao/alunoDAO.dart';
import 'package:starting_training/app/dao/medidaDAO.dart';
import 'package:starting_training/app/domain/entities/medida.dart';
import 'package:starting_training/app/domain/entities/pessoaAluno.dart';
import 'package:starting_training/app/view/components/criar_campo_input.dart';

class MedidaForm extends StatefulWidget {
  const MedidaForm({Key? key}) : super(key: key);

  @override
  State<MedidaForm> createState() => _MedidaFormState();
}

class _MedidaFormState extends State<MedidaForm> {
  MedidaDAO medidaDAO = MedidaDAO();
  AlunoDAO alunoDAO = AlunoDAO();
  Medida? medida;
  int? id;
  double? altura;
  double? peso;
  double? cintura;
  double? braco;
  double? quadril;
  double? perna;
  String? dataAvaliacao;
  double? imc;
  Aluno? aluno;
  String nomeAluno = 'Selecione o Aluno';

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Widget dropdownMedida() {
      return FutureBuilder(
        future: alunoDAO.listarAluno(),
        builder: (context, AsyncSnapshot<List<Aluno>> dados) {
          var alunos = dados.data;
          return SizedBox(
            width: 300,
            height: 100,
            child: DropdownButtonFormField<Aluno>(
              isExpanded: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
              hint: Text(nomeAluno),
              items: alunos!.map<DropdownMenuItem<Aluno>>((Aluno aluno) {
                return DropdownMenuItem<Aluno>(
                    value: aluno, child: Text(aluno.nome));
              }).toList(),
              onChanged: (treino) {
                ///nomeTreino = treino!.nome;
                this.aluno = aluno;
                print(this.aluno!.nome);
              },
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 47, 47, 47),
        title: Text("Cadastro de Medida"),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        child: Form(
          key: formKey,
          child: ListView(children: <Widget>[
            CampoTexto(
              rotulo: 'Altura',
              tipo: TextInputType.number,
              vincularCampo: (value) => altura = value as double,
              retornoValidador: 'Campo Obrigatório',
              visibilidade: false,
            ),
            CampoTexto(
              rotulo: 'Peso',
              tipo: TextInputType.number,
              vincularCampo: (value) => peso = value as double,
              retornoValidador: 'Campo Obrigatório',
              visibilidade: false,
            ),
            CampoTexto(
              rotulo: 'Cintura',
              tipo: TextInputType.number,
              vincularCampo: (value) => cintura = value as double,
              retornoValidador: 'Campo Obrigatório',
              visibilidade: false,
            ),
            CampoTexto(
              rotulo: 'Braço',
              tipo: TextInputType.number,
              vincularCampo: (value) => braco = value as double,
              retornoValidador: 'Campo Obrigatório',
              visibilidade: false,
            ),
            CampoTexto(
              rotulo: 'Quadril',
              tipo: TextInputType.number,
              vincularCampo: (value) => quadril = value as double,
              retornoValidador: 'Campo Obrigatório',
              visibilidade: false,
            ),
            CampoTexto(
              rotulo: 'Perna',
              tipo: TextInputType.number,
              vincularCampo: (value) => perna = value as double,
              retornoValidador: 'Campo Obrigatório',
              visibilidade: false,
            ),
            CampoTexto(
              rotulo: 'Data da Avaliação',
              tipo: TextInputType.text,
              vincularCampo: (value) => dataAvaliacao = value,
              retornoValidador: 'Campo Obrigatório',
              visibilidade: false,
            ),
            CampoTexto(
              rotulo: 'IMC',
              tipo: TextInputType.number,
              vincularCampo: (value) => imc = value as double,
              retornoValidador: 'Campo Obrigatório',
              visibilidade: false,
            ),
            dropdownMedida(),
          ]),
        ),
      ),
    );
  }
}
