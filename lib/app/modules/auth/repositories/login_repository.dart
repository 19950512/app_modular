class LoginRepository {
  Future<bool> login(String email, String password) async {
    if (email == 'mattmaydana@gmail.com' && password == '123') {
      return true;
    }

    throw Exception('Erro no Login');
  }
}
