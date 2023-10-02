import 'cadastro_estabelecimento.dart';
import 'package:flutter/material.dart';
import 'lista_editar.dart';

class PerfilGerente extends StatefulWidget {
  const PerfilGerente({super.key});

  @override
  State<PerfilGerente> createState() => _PerfilGerenteState();
}

class _PerfilGerenteState extends State<PerfilGerente> {
  final foto = const CircleAvatar(
    backgroundImage: AssetImage('images/123.jpg'),
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const CadastroEstabelecimento()),
                      );
                    },
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
                            builder: (context) => const ListTileApp()),
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
