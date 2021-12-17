import 'package:app_modular/app/modules/auth/blocs/login_bloc.dart';
import 'package:app_modular/app/modules/auth/repositories/login_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'views/login_page.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => LoginRepository()),
        Bind.singleton((i) => LoginBloc(i(), i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const LoginPage()),
      ];
}
