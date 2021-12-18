import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produto '),
      ),
      body: Column(children: [
        ElevatedButton(
          onPressed: () => Modular.to.pushNamed('./list/57'),
          child: const Text('Listar Produtos'),
        ),
        ElevatedButton(
          onPressed: () => Modular.to.pushNamed('/auth/'),
          child: const Text('SAIR?'),
        ),
      ]),
    );
  }
}
