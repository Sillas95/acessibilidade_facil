import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
//import 'package:email_validator/email_validator.dart';
//enum SingingCharacter { usuario, gerente }

final dropvalue = ValueNotifier('');
final dropopcoe = ['Feminino', 'Masculino', 'Outro'];
String valornome = '';

class CadastroUsuario extends StatelessWidget {
  const CadastroUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login Usuário'),
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
                      border: UnderlineInputBorder(),
                      hintText: 'Nome Completo',
                    ),
                    inputFormatters: [],
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 12,
                    ),
                    const Text(
                        style: TextStyle(fontSize: 17, color: Colors.black54),
                        'Sexo:'),
                    const SizedBox(
                      width: 10,
                    ),
                    ValueListenableBuilder<String>(
                        valueListenable: dropvalue,
                        builder: (BuildContext context, String value, _) {
                          return DropdownButton(
                            value: (value.isEmpty) ? null : value,
                            onChanged: (escolha) =>
                            dropvalue.value = escolha.toString(),
                            items: dropopcoe
                                .map((op) => DropdownMenuItem(
                                value: op, child: Text(op)))
                                .toList(),
                          );
                        }),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'CPF',
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
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'E-mail',
                    ),
                  ),
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
                ),
              ]),
        ));
  }
}
