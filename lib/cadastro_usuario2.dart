import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';

final dropvalue = ValueNotifier('');
final dropopcoe = ['Feminino', 'Masculino', 'Outro'];
String valornome = '';

class CadastroUsuario2 extends StatefulWidget {
  const CadastroUsuario2({super.key});

  @override
  State<CadastroUsuario2> createState() => _CadastroUsuario2State();
}

enum SingingCharacter { usuario, gerente, asd }

class _CadastroUsuario2State extends State<CadastroUsuario2> {
  SingingCharacter? tipo = SingingCharacter.usuario;
  @override
  Widget build(BuildContext context) {
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
                  const Text(
                      style: TextStyle(fontSize: 17, color: Colors.black54),
                      'Sexo:'),
                  const SizedBox(
                    width: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ValueListenableBuilder<String>(
                      valueListenable: dropvalue,
                      builder: (BuildContext context, String value, _) {
                        return DropdownButton(
                          value: (value.isEmpty) ? null : value,
                          onChanged: (escolha) =>
                              dropvalue.value = escolha.toString(),
                          items: dropopcoe
                              .map((op) =>
                                  DropdownMenuItem(value: op, child: Text(op)))
                              .toList(),
                          //borderRadius: BorderRadius.circular(200),
                        );
                      }),
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
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: const Text('Enviar'),
                onPressed: () {},
              )
            ])));
  }
}
