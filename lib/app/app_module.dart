import 'package:flutter_modular/flutter_modular.dart';
import '/app/app_splash_page.dart';
import '/app/modules/auth/auth_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const AppSplashPage()),
        ModuleRoute('/auth', module: AuthModule()),
      ];
}
