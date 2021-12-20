import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants.dart';
import '../interfaces/client_http_interface.dart';

class ClientHttpService implements IClientHttp {
  final Dio dio = Dio();
  final Future<SharedPreferences> shared = SharedPreferences.getInstance();

  final baseUrl = Constants.baseUrl;

  @override
  void addToken(String token) {}

  @override
  Future get(String url) async {
    var token = await shared.then((value) => value.getString('jwt_token'));
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['token'] = Constants.tokenTerceiro;
    dio.options.headers["Authorization"] = "Bearer " + token!;

    try {
      var response = await dio.get(baseUrl + url);

      return response;
    } catch (e) {
      return {'r': 'no', 'data': 'Token Expirou'};
    }
  }

  @override
  Future post(String endpoint, Object data) async {
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['token'] = Constants.tokenTerceiro;

    try {
      var response = await dio.post(baseUrl + endpoint, data: jsonEncode(data));
      return response.data;
    } on DioError catch (e) {
      String mensagemErro = 'Não foi possível, tente novamente mais tarde.';
      return ({"r": "no", "data": mensagemErro});
    }
  }
}
