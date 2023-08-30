class UsuarioModel {
  late int _idusuario;
  late String _nome;
  late String _cpf;
  late DateTime _dataNasc;
  late String _email;
  late String _sexo;

  int get idusuario => _idusuario;

  set idusuario(value) => _idusuario = value;

  get nome => _nome;

  set nome(value) => _nome = value;

  get cpf => _cpf;

  set cpf(value) => _cpf = value;

  get dataNasc => _dataNasc;

  set dataNasc(value) => _dataNasc = value;

  get email => _email;

  set email(value) => _email = value;

  get sexo => _sexo;

  set sexo(value) => _sexo = value;
}
