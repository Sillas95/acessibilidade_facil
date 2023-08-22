import 'package:flutter/material.dart';
import 'package:acessibilidade_facil/123.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

enum SingingCharacter { usuario, gerente }

class _PerfilState extends State<Perfil> {
  final email = const Text(
    'sillas123silva@gmail.com',
    style: TextStyle(fontSize: 25),
  );
  final foto = const CircleAvatar(
    backgroundImage: NetworkImage(
        'https://scontent.fplu19-1.fna.fbcdn.net/v/t1.6435-9/49806306_10218100905303583_3187912206708637696_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=MDS4bimSAMkAX-Aut6I&_nc_ht=scontent.fplu19-1.fna&oh=00_AfDOWXTG8Q9kyFt50stFq6vtaaQroyadTd3K7Zt3jg6zdQ&oe=64EFAC6D'),
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
              email,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    color: Colors.black,
                    iconSize: 80,
                    icon: const Icon(Icons.domain),
                    onPressed: () {},
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
                            builder: (context) => TestConnectionScreen()),
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
