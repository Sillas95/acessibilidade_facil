// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_const_declarations
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'cadastro_estabelecimento.dart';
import 'package:flutter/material.dart';
import 'lista_editar.dart';
import 'myhomepage.dart';

class PerfilGerente extends StatefulWidget {
  final String id;
  PerfilGerente({
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  State<PerfilGerente> createState() => _PerfilGerenteState();
}

//Instância do Firebase
FirebaseFirestore db = FirebaseFirestore.instance;

Future<DocumentSnapshot> getData(String cpf) async {
  return await db.collection("gerente").doc(cpf).get();
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

class _PerfilGerenteState extends State<PerfilGerente> {
  @override
  Widget build(BuildContext context) {
    String cpf = widget.id.toString();
    return FutureBuilder(
      future: getData(cpf),
      builder: (context, AsyncSnapshot<DocumentSnapshot> gerenteDb) {
        if (gerenteDb.connectionState == ConnectionState.done) {
          final foto = const CircleAvatar(
            backgroundImage: AssetImage('images/123.jpg'),
            radius: 80,
          );
          final nome = Text(
            'Nome: ' + gerenteDb.data?.get("nome"),
            style: TextStyle(fontSize: 25),
          );
          final idade = Text(
            'Idade: ' +
                calcularIdade(gerenteDb.data?.get("data_nascimento")) +
                ' ano(s)',
            style: TextStyle(fontSize: 18),
          );
          final sexo = Text(
            'Sexo: ' + gerenteDb.data?.get("sexo"),
            style: TextStyle(fontSize: 18),
          );
          final email = Text(
            'E-mail: ' + gerenteDb.data?.get("email"),
            style: TextStyle(fontSize: 18),
          );
          final cpf = Text(
            "CPF: " + gerenteDb.data?.get("cpf"),
            style: TextStyle(fontSize: 18),
          );
          final tipo = Text(
            'Tipo: Gerente',
            style: TextStyle(fontSize: 18),
          );

          return Scaffold(
            appBar: AppBar(
              title: const Text('Perfil'),
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
                                  builder: (context) => CadastroEstabelecimento(
                                      id: widget.id.toString())),
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
        } else if (gerenteDb.connectionState == ConnectionState.none) {
          return Text("Não foi econtrado dados para esse Usuário");
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
