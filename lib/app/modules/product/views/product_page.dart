import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produto '),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Modular.to.pushNamed('./list/57'),
          child: const Text('Listar Produtos'),
        ),
      ),
    );
  }
}
