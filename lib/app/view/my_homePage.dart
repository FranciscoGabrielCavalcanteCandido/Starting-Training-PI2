import 'package:flutter/material.dart';
import 'package:starting_training/app/domain/entities/login.dart';
import 'package:starting_training/app/view/components/botao.dart';
import 'package:starting_training/app/view/components/botao_entrar.dart';
import 'package:starting_training/app/view/components/criar_campo_input-login.dart';
import 'package:starting_training/app/view/components/criar_campo_input.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String CPF;
  late String senha;
  String permissao = '';
  final formeKey = GlobalKey<FormState>();

  definirRota(Login login) {
    if (login.CPF == "000" && login.senha == "adm") {
      Navigator.pushNamed(context, "/admPage");
    } else if (login.CPF == "123" && login.senha == 'adm') {
      Navigator.pushNamed(
        context,
        "/personalPage",
      );
    } else if (login.CPF == '456' && login.senha == 'aluno') {
      Navigator.pushNamed(
        context,
        "/alunoPage",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          key: formeKey,
          child: ListView(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xfff45d27),
                      Color(0xFFf5851f),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.only(
                    //bottomRight: Radius.circular(100),
                    bottomLeft: Radius.circular(100),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 62),
                child: Column(
                  children: [
                    CampoTextoLogin(
                        icone: const Icon(Icons.person),
                        visibilidade: false,
                        rotulo: 'CPF',
                        tipo: TextInputType.number,
                        vincularCampo: (value) => CPF = value,
                        retornoValidador: 'Campo obrigatório'),
                    SizedBox(
                      height: 32,
                    ),
                    CampoTextoLogin(
                        icone: const Icon(Icons.key),
                        visibilidade: true,
                        rotulo: 'Senha',
                        tipo: TextInputType.visiblePassword,
                        vincularCampo: (value) => senha = value,
                        retornoValidador: 'Campo obrigatório'),
                    Spacer(),
                    ButtonEntrar(
                        rotulo: 'Login',
                        icone: Icon(Icons.arrow_forward_ios_outlined),
                        cor: Colors.amber,
                        borda: StadiumBorder(),
                        acao: () => definirRota(Login(
                            CPF: CPF, senha: senha, permissao: permissao))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
