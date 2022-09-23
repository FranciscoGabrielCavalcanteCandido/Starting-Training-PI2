import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  String rotulo;
  ValueChanged vincularCampo;
  TextInputType tipo;

  CampoTexto(
      {Key? key,
      required this.rotulo,
      required this.tipo,
      required this.vincularCampo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: tipo,
      onChanged: vincularCampo,
      decoration: InputDecoration(label: Text(rotulo)),
    );
  }
}
