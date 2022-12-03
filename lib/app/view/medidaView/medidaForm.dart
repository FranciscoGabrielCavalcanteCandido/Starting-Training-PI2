import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:starting_training/app/dao/alunoDAO.dart';
import 'package:starting_training/app/dao/medidaDAO.dart';
import 'package:starting_training/app/domain/entities/medida.dart';
import 'package:starting_training/app/domain/entities/pessoaAluno.dart';
import 'package:starting_training/app/domain/entities/pessoaPersonal_trainer.dart';
import 'package:starting_training/app/view/components/botao.dart';
import 'package:starting_training/app/view/components/criar_campo_input.dart';

class MedidaForm extends StatefulWidget {
  const MedidaForm({Key? key}) : super(key: key);

  @override
  State<MedidaForm> createState() => _MedidaFormState();
}

class _MedidaFormState extends State<MedidaForm> {
  MedidaDAO medidaDAO = MedidaDAO();
  AlunoDAO alunoDAO = AlunoDAO();
  late Medida medida;
  late int id;
  double altura = 0.0;
  double peso = 0.0;
  late double cintura = 0.0;
  late double braco = 0.0;
  late double quadril = 0.0;
  late double perna = 0.0;
  late String dataAvaliacao = '';
  late double imc = 0.0;
  Aluno? aluno;
  String nomeAluno = 'Selecione o Aluno';

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Widget dropdownMedida() {
      return FutureBuilder(
        future: alunoDAO.listarAluno(),
        builder: (context, AsyncSnapshot<List<Aluno>> dados) {
          List<Aluno> alunos = dados.data as List<Aluno>;
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
              onChanged: (aluno) {
                ///nomeTreino = treino!.nome;
                this.aluno = aluno;
                print(this.aluno!.nome);
              },
            ),
          );
        },
      );
    }

    var argumento = ModalRoute.of(context)?.settings.arguments;
    if (argumento != null) aluno = argumento as Aluno;

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
            dropdownMedida(),
            CampoTexto(
              rotulo: 'Altura',
              tipo: TextInputType.number,
              vincularCampo: (value) => altura = double.parse(value),
              retornoValidador: 'Campo Obrigatório',
              visibilidade: false,
            ),
            CampoTexto(
              rotulo: 'Peso',
              tipo: TextInputType.number,
              vincularCampo: (value) => peso = double.parse(value),
              retornoValidador: 'Campo Obrigatório',
              visibilidade: false,
            ),
            CampoTexto(
              rotulo: 'Cintura',
              tipo: TextInputType.number,
              vincularCampo: (value) => cintura = double.parse(value),
              retornoValidador: 'Campo Obrigatório',
              visibilidade: false,
            ),
            CampoTexto(
              rotulo: 'Braço',
              tipo: TextInputType.number,
              vincularCampo: (value) => braco = double.parse(value),
              retornoValidador: 'Campo Obrigatório',
              visibilidade: false,
            ),
            CampoTexto(
              rotulo: 'Quadril',
              tipo: TextInputType.number,
              vincularCampo: (value) => quadril = double.parse(value),
              retornoValidador: 'Campo Obrigatório',
              visibilidade: false,
            ),
            CampoTexto(
              rotulo: 'Perna',
              tipo: TextInputType.number,
              vincularCampo: (value) => perna = double.parse(value),
              retornoValidador: 'Campo Obrigatório',
              visibilidade: false,
            ),
            CampoTexto(
              rotulo: 'Data da Avaliação',
              tipo: TextInputType.datetime,
              vincularCampo: (value) => dataAvaliacao = value,
              retornoValidador: 'Campo Obrigatório',
              visibilidade: false,
            ),
            CampoTexto(
              rotulo: 'IMC',
              tipo: TextInputType.number,
              vincularCampo: (value) => imc = double.parse(value),
              retornoValidador: 'Campo Obrigatório',
              visibilidade: false,
            ),
            Button(
                icone: Icon(Icons.save),
                rotulo: "Salvar",
                cor: Colors.amber,
                borda: StadiumBorder(),
                acao: () {
                  var validar = formKey.currentState?.validate();
                  if (validar == true) {
                    medidaDAO
                        .salvarMedida(Medida(
                            altura: altura,
                            peso: peso,
                            cintura: cintura,
                            braco: braco,
                            quadril: quadril,
                            perna: perna,
                            dataAvaliacao: dataAvaliacao,
                            imc: imc,
                            aluno: aluno!))
                        .then((value) => Navigator.pop(context));
                  }
                })
          ]),
        ),
      ),
    );
  }
}
