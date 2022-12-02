import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  String rotulo;
  ValueChanged<String>? vincularCampo;
  TextInputType tipo;
  String? valorInicial;
  String? retornoValidador;
  bool visibilidade = false;

  CampoTexto(
      {Key? key,
      required this.visibilidade,
      required this.rotulo,
      required this.tipo,
      required this.vincularCampo,
      required this.retornoValidador})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 300,
        child: TextFormField(
          keyboardType: tipo,
          onChanged: vincularCampo,
          decoration: InputDecoration(
              label: Text(rotulo),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          initialValue: valorInicial ??= '',
          obscureText: visibilidade,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return retornoValidador;
            }
          },
        ),
      ),
    );
  }
}
