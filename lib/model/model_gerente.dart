class GereteModel {
  late int _idgerente;
  late String _nome;
  late String _cpf;
  late DateTime _dataNasc;
  late String _email;
  late String sexo;

  get idgerente => _idgerente;

  set idgerente(value) => _idgerente = value;

  get nome => _nome;

  set nome(value) => _nome = value;

  get cpf => _cpf;

  set cpf(value) => _cpf = value;

  get dataNasc => _dataNasc;

  set dataNasc(value) => _dataNasc = value;

  get email => _email;

  set email(value) => _email = value;

  get getSexo => sexo;

  set setSexo(sexo) => sexo = sexo;
}
