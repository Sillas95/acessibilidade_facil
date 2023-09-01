import 'package:acessibilidade_facil/view/editar_estabelecimento.dart';
import 'package:flutter/material.dart';

/// Flutter code sample for [ListTile].

class ListTileApp extends StatefulWidget {
  const ListTileApp({super.key});

  @override
  State<ListTileApp> createState() => _ListTileAppState();
}

class _ListTileAppState extends State<ListTileApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Selecione o Estabelecimento')),
      body: ListView(
        children: <Widget>[
          Card(
            elevation: 10,
            shape: const BeveledRectangleBorder(
                side: BorderSide(
                  color: Colors.green,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: SizedBox(
              height: 90,
              child: ListTile(
                leading: Image.asset('images/123.jpg'),
                title: const Text(
                  'Padaria 2 irmaso',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Rua São Paulo, 120, Sidil'),
                isThreeLine: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditarEstabelecimento()),
                  );
                },
              ),
            ),
          ),
          Card(
            elevation: 10,
            shape: const BeveledRectangleBorder(
                side: BorderSide(
                  color: Colors.green,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: SizedBox(
              width: 100,
              height: 90,
              child: ListTile(
                leading: Image.asset('images/123.jpg'),
                title: const Text(
                  'Pizzaria sadasdas',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Rua São Paulo, 120, Sidil'),
                isThreeLine: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditarEstabelecimento()),
                  );
                },
              ),
            ),
          ),
          Card(
            elevation: 10,
            shape: const BeveledRectangleBorder(
                side: BorderSide(
                  color: Colors.green,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: SizedBox(
              width: 100,
              height: 90,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://static-cse.canva.com/blob/759754/IMAGE1.jpg',
                  ),
                  radius: 30,
                ),
                title: const Text(
                  'Pizzaria Italia',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Rua São Paulo, 120, Sidil'),
                isThreeLine: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditarEstabelecimento()),
                  );
                },
              ),
            ),
          ),
          Card(
            elevation: 10,
            shape: const BeveledRectangleBorder(
                side: BorderSide(
                  color: Colors.green,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: SizedBox(
              width: 300,
              height: 90,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://static-cse.canva.com/blob/759754/IMAGE1.jpg',
                  ),
                  radius: 30,
                ),
                title: const Text(
                  'Restaurante Fogão a lenha',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Rua São Paulo, 120, Sidil'),
                isThreeLine: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditarEstabelecimento()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
