import 'package:app_modular/app/modules/configurations/bloc/me_informations_bloc.dart';
import 'package:app_modular/app/modules/configurations/repositories/me_informations_repository.dart';
import 'package:app_modular/app/modules/configurations/views/me_informations_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'services/client_http_services.dart';
import 'views/configurations_page.dart';
import 'views/notificacoes_page.dart';
import 'views/sobre_page.dart';

class ConfigurationsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => ClientHttpService()),
        Bind.factory((i) => MeInformationsRepository(i(), i())),
        Bind.singleton((i) => MeInformationsBloc(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const ConfigurationsPage()),
        ChildRoute('/sobre', child: (context, args) => const SobrePage()),
        ChildRoute('/minhasinformacoes',
            child: (context, args) => const MinhasinformacoesPage()),
        ChildRoute('/notificacoes',
            child: (context, args) => const NotificacoesPage()),
      ];
}
