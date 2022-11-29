class Pessoa {
  final dynamic id;
  final String nome;
  final String cpf;
  final String telefone;
  final String endereco;
  final String dataNascimento;
  final String status;
  final String senha;
  final String permissao;

  Pessoa(
      {required this.id,
      required this.nome,
      required this.cpf,
      required this.telefone,
      required this.dataNascimento,
      required this.endereco,
      required this.status,
      required this.senha,
      required this.permissao});
}
