import 'package:acessibilidade_facil/view/visualizar_estabelecimento.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

/// Flutter code sample for [ListTile].

class ListaEstabelecimento extends StatefulWidget {
  const ListaEstabelecimento({super.key});

  @override
  State<ListaEstabelecimento> createState() => _ListaEstabelecimentoState();
}

FirebaseFirestore db = FirebaseFirestore.instance;

Future<DocumentSnapshot> getData(String cnpj) async {
  return await db.collection("estabelecimento").doc(cnpj).get();
}

class _ListaEstabelecimentoState extends State<ListaEstabelecimento> {
  @override
  Widget build(BuildContext context) {
    String cnpj = widget.toString();
    return FutureBuilder(
        future: getData(cnpj),
        builder: (context, AsyncSnapshot<DocumentSnapshot> estabelecimentoDb) {
          if (estabelecimentoDb.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(title: const Text('Selecione o Estabelecimento')),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Selecione o estabelecimento para Visualizar',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SizedBox(
                      width: 500,
                      height: 410,
                      child: ListView(
                        children: <Widget>[
                          Card(
                            shape: const BeveledRectangleBorder(
                                side: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.zero),
                            elevation: 10,
                            margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: SizedBox(
                              height: 100,
                              child: Center(
                                child: ListTile(
                                  leading: Image.asset('images/123.jpg'),
                                  title: Text(
                                    estabelecimentoDb.data?.get('nome'),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: const Text(
                                      "asdasd" //estabelecimentoDb.data?.get('endereco'),
                                      ),
                                  isThreeLine: true,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const VizualizarEstabelecimento()),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      fixedSize: const Size(120.0, 55.0),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: const Text('Cancelar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            );
          } else if (estabelecimentoDb.connectionState ==
              ConnectionState.none) {
            return const Text(
                "Não foi econtrado dados para esse Estabelecimento");
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
