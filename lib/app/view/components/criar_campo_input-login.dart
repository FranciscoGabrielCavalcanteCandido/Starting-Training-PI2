import 'package:flutter/material.dart';

class CampoTextoLogin extends StatelessWidget {
  String rotulo;
  ValueChanged<String>? vincularCampo;
  Icon icone;
  TextInputType tipo;
  String? valorInicial;
  String? retornoValidador;
  bool visibilidade = false;

  CampoTextoLogin(
      {Key? key,
      required this.icone,
      required this.visibilidade,
      required this.rotulo,
      required this.tipo,
      required this.vincularCampo,
      required this.retornoValidador})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width / 1.2,
      padding: const EdgeInsets.only(
        top: 4,
        bottom: 4,
        right: 16,
        left: 16,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
            ),
          ]),
      child: TextFormField(
        keyboardType: tipo,
        onChanged: vincularCampo,
        decoration: InputDecoration(
          icon: icone,
          hintText: rotulo,
        ),
        initialValue: valorInicial ??= '',
        obscureText: visibilidade,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return retornoValidador;
          }
        },
      ),
    );
  }
}
