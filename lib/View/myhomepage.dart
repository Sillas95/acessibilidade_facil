//import 'package:acessibilidade_facil/view/perfil.dart';
// ignore_for_file: prefer_const_constructors

import 'package:acessibilidade_facil/View/perfil_gerente.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'cadastro_usuario2.dart';
//import 'perfil.dart';
import 'package:flutter/material.dart';

import 'perfil.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum SingingCharacter { usuario, gerente }

//Instância do Firebase
FirebaseFirestore db = FirebaseFirestore.instance;

class _MyHomePageState extends State<MyHomePage> {
  //Criação das Controllers para cada dado do Usuário/Gerente
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  SingingCharacter? tipo = SingingCharacter.usuario;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            const Text('LOGIN',
                style: TextStyle(
                    fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: TextField(
                controller: cpfController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'CPF',
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: TextField(
                controller: senhaController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Senha',
                ),
                obscureText: true,
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 160,
                    child: ListTile(
                        title: const Text('Usuário'),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.usuario,
                          groupValue: tipo,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              tipo = value;
                            });
                          },
                        )),
                  ),
                  SizedBox(
                    width: 160,
                    child: ListTile(
                      title: const Text('Gerente'),
                      leading: Radio<SingingCharacter>(
                          value: SingingCharacter.gerente,
                          groupValue: tipo,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              tipo = value;
                            });
                          }),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () async {
                String cpf = cpfController.text;
                if (tipo == SingingCharacter.usuario && cpf.isNotEmpty) {
                  db
                      .collection('usuario')
                      .doc(cpf)
                      .get()
                      .then((DocumentSnapshot doc) {
                    final usuarioDb = doc.data() as Map<String, dynamic>;
                    if (usuarioDb["senha"] == senhaController.text) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Perfil(id: cpf)),
                      );
                    }
                  });
                } else if (tipo == SingingCharacter.gerente) {
                  db
                      .collection('gerente')
                      .doc(cpf)
                      .get()
                      .then((DocumentSnapshot doc) {
                    final gerenteDb = doc.data() as Map<String, dynamic>;
                    if (gerenteDb["senha"] == senhaController.text) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PerfilGerente(id: cpf)),
                      );
                    }
                  });
                }
              },
              child: const Text('Entrar'),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text('Não é Cadastrado?'),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CadastroUsuario2()),
                  );
                },
                child: const Text('Cadastre-se'),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
