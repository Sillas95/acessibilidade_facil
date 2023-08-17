import 'package:flutter/material.dart';

// ignore: camel_case_types
class listTile extends StatefulWidget {
  const listTile({super.key});

  @override
  State<listTile> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<listTile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista'),
        ),
        body: const Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  leading: Image(
                    image: NetworkImage(
                        'https://scontent.fplu19-1.fna.fbcdn.net/v/t1.6435-9/49806306_10218100905303583_3187912206708637696_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=MDS4bimSAMkAX-Aut6I&_nc_ht=scontent.fplu19-1.fna&oh=00_AfDOWXTG8Q9kyFt50stFq6vtaaQroyadTd3K7Zt3jg6zdQ&oe=64EFAC6D'),
                  ),
                  title: Text('SIllas Francisco'),
                  subtitle: Text('Aluno'),
                  trailing: Icon(Icons.more_vert),
                )
              ]),
        ));
  }
}
