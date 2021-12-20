import 'package:app_modular/app/core/components/drawer_custom_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ConfigurationsPage extends StatelessWidget {
  const ConfigurationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: const CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage(
                  "https://scontent.fpfb5-1.fna.fbcdn.net/v/t1.6435-9/72188662_1577855245682030_319180112350150656_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=730e14&_nc_eui2=AeET1OCCuv-mH4gm86tHsBattiiXKfF21_u2KJcp8XbX-8pNu5x3tIjan3gMxunYEH3ICWW8SjXX2csj8vq7lsWP&_nc_ohc=q2rQW3ynXQoAX-R-lUu&_nc_ht=scontent.fpfb5-1.fna&oh=00_AT9aeYlWG1Z0YgDMuWb4w4saKEUAToYonGvJb4qDS8tRew&oe=61E49819"),
              backgroundColor: Colors.transparent,
            ),
          ),
          Text(
            'Matheus Maydana',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 20,
          ),
          const Divider(
            thickness: 0.5,
          ),
          Container(
            height: 20,
          ),
          ListTile(
            title: const Text('Minhas Informações'),
            subtitle: const Text('Ver ou alterar minhas informações'),
            leading: const Icon(Icons.person_outline_rounded),
            onTap: () {
              Modular.to.pushNamed('./minhasinformacoes');
            },
          ),
          ListTile(
            title: const Text('Notificações'),
            subtitle: const Text('Permissões de Notificações'),
            leading: const Icon(Icons.notification_add_outlined),
            onTap: () {
              Modular.to.pushNamed('./notificacoes');
            },
          ),
          ListTile(
            title: const Text('Aplicativo'),
            subtitle: const Text('Informações do Aplicativo'),
            leading: const Icon(Icons.phonelink_setup_rounded),
            onTap: () {
              Modular.to.pushNamed('./sobre');
            },
          )
        ],
      ),
      drawer: DrawerCustom(),
    );
    // Sorry, falhou. repete?
  }
}
