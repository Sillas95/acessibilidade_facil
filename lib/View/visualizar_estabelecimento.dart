import 'package:acessibilidade_facil/view/avaliacao.dart';
import 'package:flutter/material.dart';

class VizualizarEstabelecimento extends StatefulWidget {
  const VizualizarEstabelecimento({super.key});

  @override
  State<VizualizarEstabelecimento> createState() =>
      _VizualizarEstabelecimentoState();
}

class _VizualizarEstabelecimentoState extends State<VizualizarEstabelecimento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Estabelecimento')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'images/123.jpg',
              height: 280,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Padaria 2 Irmãos',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  color: Colors.amberAccent,
                  iconSize: 50,
                  icon: const Icon(Icons.star),
                  onPressed: () {}),
              IconButton(
                  color: Colors.amberAccent,
                  iconSize: 50,
                  icon: const Icon(Icons.star),
                  onPressed: () {}),
              IconButton(
                  color: Colors.amberAccent,
                  iconSize: 50,
                  icon: const Icon(Icons.star),
                  onPressed: () {}),
              IconButton(
                  color: Colors.amberAccent,
                  iconSize: 50,
                  icon: const Icon(Icons.star),
                  onPressed: () {}),
              IconButton(
                  color: Colors.amberAccent,
                  iconSize: 50,
                  icon: const Icon(Icons.star_half),
                  onPressed: () {}),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Rua São Paulo, 120, Sidil',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 30,
          ),
          Card(
            shape: const BeveledRectangleBorder(
                side: BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.zero),
            elevation: 10,
            margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: SizedBox(
              height: 100,
              width: 250,
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.accessible_forward),
                    title: Text('Fácil Acesso'),
                  ),
                  ListTile(
                    leading: Icon(Icons.accessible_forward),
                    title: Text('Banheiro Adaptado'),
                  ),
                  ListTile(
                    leading: Icon(Icons.hearing),
                    title: Text('Cardápio em Áudio'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  fixedSize: const Size(120.0, 55.0),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: const Text('Voltar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(
                width: 50,
              ),
              ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  fixedSize: const Size(120.0, 55.0),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: const Text('Avaliar'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Avaliacao()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
