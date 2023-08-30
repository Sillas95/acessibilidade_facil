import 'package:acessibilidade_facil/model/model_gerente.dart';

class EstabelecimentoModel {
  late int _idestabelecimento;
  late String _nome;
  late String _cnpj;
  late String _endereco;
  late String _tipo;
  late String _descricao;
  late String _ferramentasAcess;
  late GereteModel _idgerente;

  get idestabelecimento => _idestabelecimento;

  set idestabelecimento(value) => _idestabelecimento = value;

  get nome => _nome;

  set nome(value) => _nome = value;

  get cnpj => _cnpj;

  set cnpj(value) => _cnpj = value;

  get endereco => _endereco;

  set endereco(value) => _endereco = value;

  get tipo => _tipo;

  set tipo(value) => _tipo = value;

  get descricao => _descricao;

  set descricao(value) => _descricao = value;

  get ferramentasAcess => _ferramentasAcess;

  set ferramentasAcess(value) => _ferramentasAcess = value;

  get idgerente => _idgerente;

  set idgerente(value) => _idgerente = value;
}
