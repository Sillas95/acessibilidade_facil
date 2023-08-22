import 'package:acessibilidade_facil/list_tile.dart';
import 'package:flutter/material.dart';

class PerfilGerente extends StatefulWidget {
  const PerfilGerente({super.key});

  @override
  State<PerfilGerente> createState() => _PerfilGerenteState();
}

class _PerfilGerenteState extends State<PerfilGerente> {
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
  final email = const Text(
    'Email: sillas123silva@gmail.com',
    style: TextStyle(fontSize: 18),
  );
  final cpf = const Text(
    'CPF: 108.181.111.80',
    style: TextStyle(fontSize: 18),
  );
  final tipo = const Text(
    'Tipo: Gerente',
    style: TextStyle(fontSize: 18),
  );
  @override
  Widget build(BuildContext context) {
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
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  IconButton(
                    color: Colors.black,
                    iconSize: 80,
                    icon: const Icon(Icons.edit_location_alt_outlined),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Listtile()),
                      );
                    },
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Cadastrar\n estabelecimento',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Text(
                    'Editar\n estabelecimento',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
