class Pessoa {
  int id;
  String nome;
  String CPF;
  String telefone;
  String endereco;
  DateTime dataNascimento;
  String status;
  String academia;
  String senha;
  String email;

  Pessoa(
      {required this.id,
      required this.nome,
      required this.CPF,
      required this.telefone,
      required this.academia,
      required this.dataNascimento,
      required this.endereco,
      required this.status,
      required this.senha,
      required this.email});
}
