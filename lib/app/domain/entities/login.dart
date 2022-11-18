class Login {
  dynamic id;
  final String CPF;
  final String senha;
  final String permissao;

  Login(
      {required this.CPF,
      this.id,
      required this.senha,
      required this.permissao});
}
