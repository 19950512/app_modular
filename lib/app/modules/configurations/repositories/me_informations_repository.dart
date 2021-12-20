import 'package:app_modular/app/modules/configurations/models/me_informations_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../interfaces/client_http_interface.dart';

class MeInformationsRepository {
  late final IClientHttp client;
  late final SharedPreferences shared;

  MeInformationsRepository(this.client, this.shared);

  Future me() async {
    var resposta = await client.get('/login/me');

    if (resposta['r'] == 'no') {
      shared.remove('jwt_token');
      shared.setBool('isLogged', false);
      throw (resposta['data']);
    }

    return resposta['data'];
  }
}
