import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';

//import 'package:email_validator/email_validator.dart';
//enum SingingCharacter { usuario, gerente }

class EditarEstabelecimento extends StatefulWidget {
  const EditarEstabelecimento({super.key});

  @override
  State<EditarEstabelecimento> createState() => _EditarEstabelecimentoState();
}

class _EditarEstabelecimentoState extends State<EditarEstabelecimento> {
  final TextEditingController tipoController = TextEditingController();
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
          title: const Text('Editar Estabelecimento'),
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
                      labelText: 'Nome do Estabelecimento',
                    ),
                    inputFormatters: [],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: TextField(
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
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: TextField(
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
                    ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 26.0, vertical: 16.0),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      child: const Text('Enviar'),
                      onPressed: () {},
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
                        child: const Text('Cancelar'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ],
                ),
              ]),
        ));
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
