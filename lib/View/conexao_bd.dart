import 'package:mysql1/mysql1.dart';

class Conexao {
  String _statusConexao = '';

  void conectar() async {
    try {
      String host = '10.0.2.2';
      int porta = 3306;
      String usuario = 'root';
      String bd = 'app';
      String password = '1234';
      try {
        MySqlConnection conn = await MySqlConnection.connect(
          ConnectionSettings(
              host: host,
              port: porta,
              user: usuario,
              password: password,
              db: bd),
        );
        await conn.close();
      } catch (e) {
        _statusConexao = 'Conexão falhou: $e';
      }
    } catch (e) {
      _statusConexao = 'Conexão falhou: $e';
    }
    print(_statusConexao);
  }
}
