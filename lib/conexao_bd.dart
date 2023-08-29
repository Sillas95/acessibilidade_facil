import 'package:mysql1/mysql1.dart';

void main(List<String> arguments) async {
  final conn = await MySqlConnection.connect(
    ConnectionSettings(
      host: '10.0.2.2',
      port: 3306,
      user: 'root',
      db: 'app',
      password: '1234',
    ),
  );

  print(await conn.query('select * from usuario'));
}
