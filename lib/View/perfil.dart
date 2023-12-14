// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_declarations, prefer_const_constructors, prefer_interpolation_to_compose_strings, unused_local_variable

import 'package:acessibilidade_facil/view/lista_avaliar.dart';
import 'package:acessibilidade_facil/view/lista_visualizar.dart';
import 'package:acessibilidade_facil/view/myhomepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Perfil extends StatefulWidget {
  final String id;
  Perfil({
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

enum SingingCharacter { usuario, gerente }

//Instância do Firebase
FirebaseFirestore db = FirebaseFirestore.instance;

Future<DocumentSnapshot> getData(String cpf) async {
  return await db.collection("usuario").doc(cpf).get();
}

String calcularIdade(String dataNascimento) {
  var formatoEntrada = DateFormat('dd/MM/yyyy');
  var data1 = formatoEntrada.parse(dataNascimento);
  var formatoSaida = DateFormat('yyyy-MM-dd');
  var dataNascimentoConvertida = formatoSaida.format(data1);

  DateTime dataHoje = DateTime.now();
  int idade = dataHoje.year - DateTime.parse(dataNascimentoConvertida).year;
  int mes1 = dataHoje.month;
  int mes2 = DateTime.parse(dataNascimentoConvertida).month;
  if (mes2 > mes1) {
    idade--;
  } else if (mes1 == mes2) {
    int dia1 = dataHoje.day;
    int dia2 = DateTime.parse(dataNascimentoConvertida).day;
    if (dia2 > dia1) {
      idade--;
    }
  }
  return idade.toString();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext contexto) {
    String cpf = widget.id.toString();

    return FutureBuilder(
      future: getData(cpf),
      builder: (context, AsyncSnapshot<DocumentSnapshot> usuarioDb) {
        if (usuarioDb.connectionState == ConnectionState.done) {
          final mail = Text(
            'E-mail: ' + usuarioDb.data?.get("email"),
            style: TextStyle(fontSize: 18),
          );
          final foto = const CircleAvatar(
            backgroundImage: AssetImage("images/123.jpg"),
            radius: 80,
          );
          final nome = Text(
            'Nome: ' + usuarioDb.data?.get("nome"),
            style: TextStyle(fontSize: 25),
          );
          final idade = Text(
            'Idade: ' +
                calcularIdade(usuarioDb.data?.get("data_nascimento")) +
                ' ano(s)',
            style: TextStyle(fontSize: 18),
          );
          final sexo = Text(
            'Sexo: ' + usuarioDb.data?.get("sexo"),
            style: TextStyle(fontSize: 18),
          );

          final cpf = Text(
            'CPF: ' + usuarioDb.data?.get("cpf"),
            style: TextStyle(fontSize: 18),
          );
          final tipo = Text(
            'Tipo: Usuário',
            style: TextStyle(fontSize: 18),
          );

          return Scaffold(
            appBar: AppBar(
              title: Text('Perfil'),
              //leading: Icon(Icons.menu),
            ),
            drawer: Drawer(
              child: Column(
                children: [
                  ListTile(
                    title: Text("Sair"),
                    leading: const Icon(Icons.exit_to_app_rounded),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyHomePage(
                                  title: 'Acessibilidade Fácil',
                                )),
                      );
                    },
                  ),
                ],
              ),
            ),
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
                                  builder: (context) => ListaEstabelecimento()),
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
        } else if (usuarioDb.connectionState == ConnectionState.none) {
          return Text("Não foi econtrado dados para esse Gerente");
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
