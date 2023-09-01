import 'avaliacao.dart';
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
    backgroundImage: NetworkImage(
        'https://pps.whatsapp.net/v/t61.24694-24/170013206_794371451198735_4887291915801925934_n.jpg?ccb=11-4&oh=01_AdRoN7Gc5xSRPToq8COIemggyhx7_MZEsBKdLJGlUcPMpg&oe=64FDF0B9&_nc_cat=110'),
    radius: 50,
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
                      // _getCustomer();
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
                            builder: (context) => const Avaliacao()),
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
