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

class _CadastroUsuario2State extends State<CadastroUsuario2> {
  final TextEditingController sexoController = TextEditingController();
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
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: TextField(
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
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-mail',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: TextField(
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
                      width: 155,
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
                      width: 155,
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
                          horizontal: 26.0, vertical: 16.0),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: const Text('Enviar'),
                    onPressed: () {
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
                            horizontal: 30.0, vertical: 15.0),
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
}

enum SelectSexo {
  masculino('Masculino'),
  feminino('Feminino');

  const SelectSexo(this.sexos);
  final String sexos;
}
