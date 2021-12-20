import 'package:flutter/material.dart';

class NotificacoesPage extends StatelessWidget {
  const NotificacoesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificações'),
      ),
      body: Column(
        children: [
          const Text('Notificações: ..'),
        ],
      ),
    );
  }
}
