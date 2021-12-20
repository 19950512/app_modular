// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DrawerCustom extends StatefulWidget {
  @override
  _DrawerCustomState createState() {
    print('Sou kk');
    return _DrawerCustomState();
  }
}

// nao tem nada disso ainda. i dot know
class _DrawerCustomState extends State<DrawerCustom> {
  @override
  Widget build(BuildContext context) {
    print('Sou Drawer');
    return Drawer(
      child: Column(
        children: [
          Text('PHP'),
          Text('Java'),
        ],
      ),
    );
  }
}
