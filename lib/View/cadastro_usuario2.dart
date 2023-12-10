// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';

import 'myhomepage.dart';
import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';

class CadastroUsuario2 extends StatefulWidget {
  const CadastroUsuario2({super.key});
  @override
  State<CadastroUsuario2> createState() => _CadastroUsuario2State();
}

enum SingingCharacter { usuario, gerente }

//Instância do Firebase
FirebaseFirestore db = FirebaseFirestore.instance;

class _CadastroUsuario2State extends State<CadastroUsuario2> {
  //Criação das Controllers para cada dado do Usuário/Gerente
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController sexoController = TextEditingController();
  final TextEditingController dataNascimentoController =
      TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  SelectSexo? selectSexo;

  SingingCharacter? tipo = SingingCharacter.usuario;
  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<SelectSexo>> sexoEntries =
        <DropdownMenuEntry<SelectSexo>>[];
    for (final SelectSexo sexo in SelectSexo.values) {
      sexoEntries.add(
        DropdownMenuEntry<SelectSexo>(
            value: sexo, label: sexo.sexos, enabled: sexo.sexos != ''),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro'),
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
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nome Completo',
                  ),
                  inputFormatters: [],
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 12,
                    height: 4,
                  ),
                  DropdownMenu<SelectSexo>(
                    //initialSelection: SelectSexo.masculino,
                    textStyle: const TextStyle(fontSize: 15),
                    controller: sexoController,
                    label: const Text('Sexo'),
                    dropdownMenuEntries: sexoEntries,
                    onSelected: (SelectSexo? sexos) {
                      setState(() {
                        selectSexo = sexos;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  SizedBox(
                    width: 150,
                    child: TextFormField(
                      controller: dataNascimentoController,
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(
                        labelText: 'Data de Nascimento',
                        border: OutlineInputBorder(),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        DataInputFormatter()
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: cpfController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'CPF',
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CpfInputFormatter()
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-mail',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: TextField(
                  controller: senhaController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Senha',
                  ),
                  inputFormatters: [],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 160,
                      child: ListTile(
                          title: const Text('Usuário'),
                          leading: Radio<SingingCharacter>(
                            value: SingingCharacter.usuario,
                            groupValue: tipo,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                tipo = value;
                              });
                            },
                          )),
                    ),
                    SizedBox(
                      width: 160,
                      child: ListTile(
                          title: const Text('Gerente'),
                          leading: Radio<SingingCharacter>(
                            value: SingingCharacter.gerente,
                            groupValue: tipo,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                tipo = value;
                              });
                            },
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 15.0),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: const Text('Enviar'),
                    onPressed: () {
                      enviarDados();
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              //title: const Text('CADASTRO'),
                              content: const Text('Cadastro feito com Sucesso'),
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
                                              const MyHomePage(
                                                title: 'Acessibilidade Fácil',
                                              )),
                                    );
                                  },
                                  child: const Text('Continuar'),
                                ),
                              ],
                            );
                          });
                    },
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 15.0),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      child: const Text('Voltar'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ],
              ),
              const SizedBox(width: 20),
            ])));
  }

  void enviarDados() {
    String cpf = cpfController.text.replaceAll('.', '').replaceAll('-', '');
    if (cpf.isNotEmpty) {
      if (tipo == SingingCharacter.gerente) {
        db.collection("gerente").doc(cpf).set({
          "nome": nomeController.text.isEmpty ? "" : nomeController.text,
          "cpf": cpf,
          "data_nascimento": dataNascimentoController.text.isEmpty
              ? ""
              : dataNascimentoController.text,
          "email": emailController.text.isEmpty ? "" : emailController.text,
          "sexo": sexoController.text.isEmpty ? "" : sexoController.text,
          "senha": senhaController.text.isEmpty ? "" : senhaController.text,
        });
      } else {
        db.collection("usuario").doc(cpf).set({
          "nome": nomeController.text.isEmpty ? "" : nomeController.text,
          "cpf": cpf,
          "data_nascimento": dataNascimentoController.text.isEmpty
              ? ""
              : dataNascimentoController.text,
          "email": emailController.text.isEmpty ? "" : emailController.text,
          "sexo": sexoController.text.isEmpty ? "" : sexoController.text,
          "senha": senhaController.text.isEmpty ? "" : senhaController.text,
        });
      }
    }
  }
}

enum SelectSexo {
  masculino('Masculino'),
  feminino('Feminino');

  const SelectSexo(this.sexos);
  final String sexos;
}
