import 'package:acessibilidade_facil/view/editar_estabelecimento.dart';
import 'package:acessibilidade_facil/view/visualizar_estabelecimento.dart';
import 'package:flutter/material.dart';

/// Flutter code sample for [ListTile].

class ListTileApp2 extends StatefulWidget {
  const ListTileApp2({super.key});

  @override
  State<ListTileApp2> createState() => _ListTileApp2State();
}

class _ListTileApp2State extends State<ListTileApp2> {
  @override
  Widget build(BuildContext context) {
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
                          title: const Text(
                            'Padaria 2 irmãos',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text('Rua São Paulo, 120, Sidil'),
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
                  Card(
                    elevation: 10,
                    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    shape: const BeveledRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.zero),
                    child: SizedBox(
                      height: 100,
                      child: Center(
                        child: ListTile(
                          leading: Image.asset(
                            'images/123.jpg',
                          ),
                          title: const Text(
                            'Pizzaria sadasdas',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text('Rua São Paulo, 120, Sidil'),
                          isThreeLine: true,
                          onTap: () {},
                        ),
                      ),
                    ),
                  ),
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
                          leading: const CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://static-cse.canva.com/blob/759754/IMAGE1.jpg',
                            ),
                            radius: 30,
                          ),
                          title: const Text(
                            'Pizzaria Italia',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text('Rua São Paulo, 120, Sidil'),
                          isThreeLine: true,
                          onTap: () {},
                        ),
                      ),
                    ),
                  ),
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
                          leading: const CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://static-cse.canva.com/blob/759754/IMAGE1.jpg',
                            ),
                            radius: 30,
                          ),
                          title: const Text(
                            'Restaurante Fogão a lenha',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text('Rua São Paulo, 120, Sidil'),
                          isThreeLine: true,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EditarEstabelecimento()),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
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
                          leading: const CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://static-cse.canva.com/blob/759754/IMAGE1.jpg',
                            ),
                            radius: 30,
                          ),
                          title: const Text(
                            'Restaurante Fogão a lenha',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text('Rua São Paulo, 120, Sidil'),
                          isThreeLine: true,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EditarEstabelecimento()),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
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
                          leading: const CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://static-cse.canva.com/blob/759754/IMAGE1.jpg',
                            ),
                            radius: 30,
                          ),
                          title: const Text(
                            'Restaurante Fogão a lenha',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text('Rua São Paulo, 120, Sidil'),
                          isThreeLine: true,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EditarEstabelecimento()),
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
  }
}
