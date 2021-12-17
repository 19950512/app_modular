import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../blocs/events/login_events.dart';
import '../blocs/login_bloc.dart';
import '../blocs/states/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final bloc = Modular.get<LoginBloc>();

  @override
  initState() {
    super.initState();
    bloc.stream.listen((state) async {
      if (state is LoginFailure) {
        final banner = MaterialBanner(
          backgroundColor: Colors.red,
          actions: [
            ElevatedButton(onPressed: () {}, child: const Text('Close'))
          ],
          content: const Text('Erro Login'),
        );

        ScaffoldMessenger.of(context).showMaterialBanner(banner);
      }
      if (state is LoginSuccess) {
        Modular.to.navigate('/product/');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela de Login'),
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is LoginLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is LoginSuccess) {
              return const Center(
                child: Text('Logado com sucesso'),
              );
            }

            return Center(
              child: ElevatedButton(
                onPressed: () => {
                  bloc.add(LoginWithEmail(
                      password: "123", email: "mattmaydana@gmail.com"))
                },
                child: const Text('Entrar'),
              ),
            );
          }),
    );
  }
}
