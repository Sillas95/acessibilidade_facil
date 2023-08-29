import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

class TestConnectionScreen extends StatefulWidget {
  const TestConnectionScreen({super.key});

  @override
  _TestConnectionScreenState createState() => _TestConnectionScreenState();
}

class _TestConnectionScreenState extends State<TestConnectionScreen> {
  String _connectionStatus = 'Not tested';

  Future<void> testConnection() async {
    final settings = ConnectionSettings(
      host: '10.0.2.2',
      port: 3306,
      user: 'root',
      password: '1234',
      db: 'app',
    );

    try {
      final MySqlConnection conn = await MySqlConnection.connect(settings);
      _connectionStatus = 'Connection successful';
      await conn.close();
    } catch (e) {
      _connectionStatus = 'Connection failed: $e';
    }

    setState(() {}); // Atualiza a interface com o novo status de conexão
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MySQL Connection Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Connection Status:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              _connectionStatus,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: testConnection,
              child: const Text('Test Connection'),
            ),
          ],
        ),
      ),
    );
  }
}
