import 'package:acessibilidade_facil/view/lista_avaliar.dart';
import 'package:acessibilidade_facil/view/lista_visualizar.dart';

import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

enum SingingCharacter { usuario, gerente }

class _PerfilState extends State<Perfil> {
  var email = '';

  final mail = const Text(
    'sillas123silva@gmail.com',
    style: TextStyle(fontSize: 25),
  );
  final foto = const CircleAvatar(
    backgroundImage: AssetImage("images/123.jpg"),
    radius: 80,
  );
  final nome = const Text(
    'Sillas Francisco da Silva',
    style: TextStyle(fontSize: 25),
  );
  final idade = const Text(
    '24 Anos',
    style: TextStyle(fontSize: 18),
  );
  final sexo = const Text(
    'Masculino',
    style: TextStyle(fontSize: 18),
  );

  final cpf = const Text(
    'CPF: 108.181.111.80',
    style: TextStyle(fontSize: 18),
  );
  final tipo = const Text(
    'Tipo: Usuário',
    style: TextStyle(fontSize: 18),
  );

  @override
  Widget build(BuildContext contexto) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      //drawer: const Drawer(),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              foto,
              const SizedBox(
                height: 20,
              ),
              nome,
              const SizedBox(
                height: 5,
              ),
              idade,
              const SizedBox(
                height: 5,
              ),
              sexo,
              const SizedBox(
                height: 5,
              ),
              mail,
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                height: 5,
              ),
              cpf,
              const SizedBox(
                height: 5,
              ),
              tipo,
              const SizedBox(
                height: 30,
              ),
              //const Text('email:'),
              // Text(email),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    color: Colors.black,
                    iconSize: 80,
                    icon: const Icon(Icons.domain),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ListTileApp2()),
                      ); // _getCustomer();L
                    },
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  IconButton(
                    color: Colors.black,
                    iconSize: 80,
                    icon: const Icon(Icons.star_outlined),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ListTileApp3()),
                      );
                    },
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Visualizar\n estabelecimentos',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Text(
                    'Avaliar\n estabelecimentos',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
