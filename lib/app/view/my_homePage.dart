import 'package:flutter/material.dart';
import 'package:starting_training/app/dao/loginDAO.dart';
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
  late String cpf;
  late String senha;
  String permissao = '';
  final formeKey = GlobalKey<FormState>();

  definirRota(Login login) {
    if (login.CPF == "000" && login.senha == "adm") {
      Navigator.pushNamed(context, "/admPage");
    } else if (login.CPF == "09500996944" && login.senha == 'personal123') {
      Navigator.pushNamed(
        context,
        "/personalPage",
      );
    } else if (login.CPF == '09500969644' && login.senha == 'aluno123') {
      Navigator.pushNamed(
        context,
        "/alunoPage",
      );
    }
  }

  defineRota(Login loginDigitado) {
    if (loginDigitado.permissao == 'aluno') {
      Navigator.pushNamed(context, "/alunoPage");
    } else if (loginDigitado.permissao == 'personal') {
      Navigator.pushNamed(context, "/personalPage");
    } else if (loginDigitado.senha == 'adm') {
      Navigator.pushNamed(context, "/admPage");
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
                child: SizedBox(
                  child: Image.asset('assets/StartLogo.png'),
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
                        vincularCampo: (value) => cpf = value,
                        retornoValidador: 'Campo obrigatório'),
                    const SizedBox(
                      height: 32,
                    ),
                    CampoTextoLogin(
                        icone: const Icon(Icons.vpn_key),
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
                        acao: () {
                          /*var validaLogin = LoginDAO().verificaLogin(Login(
                              CPF: cpf, senha: senha, permissao: permissao));

                          print(validaLogin);*/

                          definirRota(Login(
                              CPF: cpf, senha: senha, permissao: permissao));
                        })
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
