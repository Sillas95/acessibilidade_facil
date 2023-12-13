// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:acessibilidade_facil/View/perfil_gerente.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
//import 'package:mysql1/mysql1.dart';

//import 'package:email_validator/email_validator.dart';
//enum SingingCharacter { usuario, gerente }

class CadastroEstabelecimento extends StatefulWidget {
  final String id;
  CadastroEstabelecimento({
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  State<CadastroEstabelecimento> createState() =>
      _CadastroEstabelecimentoState();
}

//Instância do Firebase
FirebaseFirestore db = FirebaseFirestore.instance;

class _CadastroEstabelecimentoState extends State<CadastroEstabelecimento> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController enderecoController = TextEditingController();
  final TextEditingController cnpjController = TextEditingController();
  final TextEditingController tipoController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  SelectTipo? selectTipo;

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<SelectTipo>> tipoEntries =
        <DropdownMenuEntry<SelectTipo>>[];
    for (final SelectTipo tipo in SelectTipo.values) {
      tipoEntries.add(
        DropdownMenuEntry<SelectTipo>(
            value: tipo, label: tipo.tipos, enabled: tipo.tipos != ''),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro Estabelecimento'),
        ),
        body: Center(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: TextField(
                    controller: nomeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nome do Estabelecimento',
                    ),
                    inputFormatters: [],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: TextField(
                    controller: enderecoController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Endereço',
                    ),
                    inputFormatters: [],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: cnpjController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'CNPJ',
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CnpjInputFormatter(),
                    ],
                  ),
                ),
                DropdownMenu<SelectTipo>(
                  //initialSelection: SelectSexo.masculino,
                  textStyle: const TextStyle(fontSize: 15),
                  controller: tipoController,
                  label: const Text('Tipo'),
                  dropdownMenuEntries: tipoEntries,
                  onSelected: (SelectTipo? tipos) {
                    setState(() {
                      selectTipo = tipos;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: TextField(
                    controller: descricaoController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        //hintText: 'Descrição',
                        labelStyle: TextStyle(),
                        labelText: 'Descrição'),
                    inputFormatters: [],
                    maxLines: 5,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 120,
                      height: 55,
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          fixedSize: const Size(120.0, 55.0),
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        child: const Text('Enviar'),
                        onPressed: () {
                          if (nomeController.text.isNotEmpty &&
                              cnpjController.text.isNotEmpty &&
                              enderecoController.text.isNotEmpty &&
                              tipoController.value.text.isNotEmpty &&
                              descricaoController.text.isNotEmpty) {
                            enviarDados();
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    //title: const Text('CADASTRO'),
                                    content: const Text(
                                        'Cadastro feito com Sucesso'),
                                    actions: <Widget>[
                                      TextButton(
                                        style: TextButton.styleFrom(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .labelLarge),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PerfilGerente(
                                                        id: widget.id
                                                            .toString())),
                                          );
                                        },
                                        child: const Text('Continuar'),
                                      ),
                                    ],
                                  );
                                });
                          } else {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    //title: const Text('CADASTRO'),
                                    content:
                                        const Text('Informe todos os dados'),
                                    actions: <Widget>[
                                      TextButton(
                                        style: TextButton.styleFrom(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .labelLarge),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Continuar'),
                                      ),
                                    ],
                                  );
                                });
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    SizedBox(
                      width: 120,
                      height: 55,
                      child: ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            fixedSize: const Size(120.0, 55.0),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          child: const Text('Cancelar'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ),
                  ],
                ),
              ]),
        ));
  }

  void enviarDados() {
    String cnpj = cnpjController.text
        .replaceAll('.', '')
        .replaceAll('-', '')
        .replaceAll('/', '');
    if (cnpj.isNotEmpty) {
      db.collection("estabelecimento").doc(cnpj).set({
        "nome": nomeController.text,
        "endereco": enderecoController.text,
        "cnpj": cnpj,
        "tipo": tipoController.text,
        "descricao": descricaoController.text,
      });
    }
  }
}

enum SelectTipo {
  padaria('Padaria'),
  restaurante('Restaurante'),
  comercio('Comércio'),
  pizzaria('Pizzaria'),
  outro('Outro'),
  casaNoturna('Casa Noturna');

  const SelectTipo(this.tipos);
  final String tipos;
}
