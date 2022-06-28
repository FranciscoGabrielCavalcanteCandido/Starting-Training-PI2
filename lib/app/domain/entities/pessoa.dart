class Pessoa {
  int id;
  String nome;
  String CPF;
  String telefone;
  String endereco;
  DateTime dataNascimento;
  String status;
  String academia;

  Pessoa(
      {required this.id,
      required this.nome,
      required this.CPF,
      required this.telefone,
      required this.academia,
      required this.dataNascimento,
      required this.endereco,
      required this.status});
}
