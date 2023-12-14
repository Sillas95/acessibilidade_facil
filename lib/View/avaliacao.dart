// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Avaliacao extends StatefulWidget {
  const Avaliacao({super.key});

  @override
  State<Avaliacao> createState() => _MyWidgetState();
}

final TextEditingController ratingController = TextEditingController();

class _MyWidgetState extends State<Avaliacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista'),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                /*ListTile(
                  leading: Image(
                    image: NetworkImage(
                        'https://scontent.fplu19-1.fna.fbcdn.net/v/t1.6435-9/49806306_10218100905303583_3187912206708637696_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=MDS4bimSAMkAX-Aut6I&_nc_ht=scontent.fplu19-1.fna&oh=00_AfDOWXTG8Q9kyFt50stFq6vtaaQroyadTd3K7Zt3jg6zdQ&oe=64EFAC6D'),
                  ),
                  title: Text('SIllas Francisco'),
                  subtitle: Text('Aluno'),
                  trailing: Icon(Icons.more_vert),
                )*/

                const Text(
                  'AVALIAÇÂO',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Digite sua avaliação"),
                    maxLines: 8,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                RatingBar(
                  initialRating: 3,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                  ratingWidget: RatingWidget(
                      full: const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      half: const Icon(
                        Icons.star_half,
                        color: Colors.amber,
                      ),
                      empty: const Icon(
                        Icons.star_border,
                        color: Colors.amber,
                      )),
                ),
                //Text(avaliacao),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {},
                  child: const Text('Enviar'),
                ),
              ]),
        ));
  }
}
