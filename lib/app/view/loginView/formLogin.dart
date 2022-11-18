/*import 'package:flutter/material.dart';

import '../../domain/entities/login.dart';
import '../components/criar_campo_input.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late String permissao;
  late String email;
  late String senha;

  LoginDAO loginDAO = LoginDAO();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Cadastre-se'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CampoTexto(
                    rotulo: 'Nome',
                    tipo: TextInputType.name,
                    vincularCampo: (valorDigitado) => nome = valorDigitado,
                    retornoValidador: 'Campo nome é obrigatório',
                    visibilidade: false),
                CriarEspaco(),
                CampoTexto(
                    rotulo: 'Email',
                    tipo: TextInputType.emailAddress,
                    vincularCampo: (valorDigitado) => email = valorDigitado,
                    retornoValidador: 'Campo e-mail é obrigatório',
                    visibilidade: false),
                CriarEspaco(),
                CampoTexto(
                    rotulo: 'Senha',
                    tipo: TextInputType.visiblePassword,
                    visibilidade: true,
                    vincularCampo: (valorDigitado) => senha = valorDigitado,
                    retornoValidador: 'Campo senha é obrigatório'),
                CriarEspaco(),
                Container(
                    child: Button(
                  icone: Icon(Icons.person_add),
                  rotulo: 'Salvar',
                  cor: Colors.amber,
                  borda: StadiumBorder(),
                  acao: () {
                    var valida = formKey.currentState?.validate();
                    if (valida == true) {
                      loginDAO
                          .salvarLogin(Login(
                              CPF: email, senha: senha, permissao: permissao))
                          .then((value) => Navigator.pop(context));
                    }
                  },
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  static LoginDAO() {}
}*/
