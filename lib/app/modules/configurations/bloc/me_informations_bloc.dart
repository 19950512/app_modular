import 'package:flutter_bloc/flutter_bloc.dart';

import 'events/me_informations_events.dart';
import 'states/me_informations_state.dart';
import '../repositories/me_informations_repository.dart';

class MeInformationsBloc
    extends Bloc<MeInformationsEvent, MeInformationsState> {
  final MeInformationsRepository meInformationsRepository;

  MeInformationsBloc(this.meInformationsRepository)
      : super(MeInformationsIdle()) {
    on<MeInformations>(me);
  }

  Future me(MeInformations event, Emitter<MeInformationsState> emit) async {
    emit(MeInformationsLoading());

    try {
      var resposta = await meInformationsRepository.me();
      emit(MeInformationsSuccess());
    } catch (erro) {
      emit(MeInformationsFailure(erro.toString()));
    }
  }
}
