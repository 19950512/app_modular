import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_modular/app/modules/auth/views/login_page.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const LoginPage()),
      ];
}
