import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SobrePage extends StatefulWidget {
  const SobrePage({Key? key}) : super(key: key);

  @override
  State<SobrePage> createState() => _SobrePageState();
}

class _SobrePageState extends State<SobrePage> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  Widget _infoTile(String title, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle.isEmpty ? 'Not set' : subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre Aplicativo'),
      ),
      body: Center(
        child: Column(
          children: [
            _infoTile('Nome do Aplicativo', _packageInfo.appName),
            _infoTile('Nome do Package', _packageInfo.packageName),
            _infoTile('Versao do Aplicativo', _packageInfo.version),
            _infoTile('Build Número', _packageInfo.buildNumber),
            _infoTile('Build Assinatura', _packageInfo.buildSignature),
            Container(
              height: 50,
            ),
            const Text(
              'Desenvolvido por Matheus Maydana',
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
