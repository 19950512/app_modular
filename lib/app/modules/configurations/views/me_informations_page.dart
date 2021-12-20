import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '/app/core/components/drawer_custom_component.dart';
import '../bloc/events/me_informations_events.dart';
import '../bloc/me_informations_bloc.dart';
import '../bloc/states/me_informations_state.dart';

class MinhasinformacoesPage extends StatefulWidget {
  const MinhasinformacoesPage({Key? key}) : super(key: key);

  @override
  State<MinhasinformacoesPage> createState() => _MinhasinformacoesPageState();
}

class _MinhasinformacoesPageState extends State<MinhasinformacoesPage> {
  final bloc = Modular.get<MeInformationsBloc>();

  @override
  void initState() {
    super.initState();
    bloc.stream.listen((state) async {
      if (state is MeInformationsFailure) {
        Modular.to.pushNamedAndRemoveUntil('/auth/', (p0) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Informações'),
      ),
      body: BlocBuilder<MeInformationsBloc, MeInformationsState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is MeInformationsFailure) {
            Modular.to.pushReplacementNamed('/auth/');
          }

          if (state is MeInformationsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is MeInformationsSuccess) {
            return Column(
              children: [
                TextButton(
                  onPressed: () {
                    Modular.to.navigate('/product/');
                  },
                  child: Text('ir produtos'),
                ),
              ],
            );
          }

          return Center(
            child: ElevatedButton(
              onPressed: () => {bloc.add(MeInformations())},
              child: const Text('Entrar'),
            ),
          );
        },
      ),
      drawer: DrawerCustom(),
    );
  }
}
