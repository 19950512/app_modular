import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_splash_page.dart';
import 'modules/auth/auth_module.dart';
import 'modules/auth/guards/auth_guard.dart';
import 'modules/product/product_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        AsyncBind((i) => SharedPreferences.getInstance()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const AppSplashPage()),
        ModuleRoute('/auth', module: AuthModule()),
        ModuleRoute('/product', module: ProductModule(), guards: [AuthGuard()]),
        WildcardRoute(
          child: (_, __) => const Scaffold(
            body: Center(
              child: Text('Pagina não encontrada'),
            ),
          ),
        )
      ];
}
