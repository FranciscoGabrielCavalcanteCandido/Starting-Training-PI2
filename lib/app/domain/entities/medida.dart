import 'dart:html';

class Medida {
  int id;
  double altura;
  double peso;
  double cintura;
  double braco;
  double quadril;
  double perna;
  late double imc;
  DateTime dataAvaliacao;

  Medida(
      {required this.id,
      required this.altura,
      required this.peso,
      required this.cintura,
      required this.braco,
      required this.quadril,
      required this.perna,
      required this.dataAvaliacao});
}
