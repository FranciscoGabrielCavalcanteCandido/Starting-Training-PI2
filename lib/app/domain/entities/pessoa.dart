class Pessoa {
  final dynamic id;
  final String nome;
  final String CPF;
  final String telefone;
  final String endereco;
  final DateTime dataNascimento;
  final String status;
  final String senha;
  final String permissao;

  Pessoa(
      {required this.id,
      required this.nome,
      required this.CPF,
      required this.telefone,
      required this.dataNascimento,
      required this.endereco,
      required this.status,
      required this.senha,
      required this.permissao});
}
