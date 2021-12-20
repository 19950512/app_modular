abstract class MeInformationsState {}

class MeInformationsIdle implements MeInformationsState {}

class MeInformationsSuccess implements MeInformationsState {}

class MeInformationsLoading implements MeInformationsState {}

class MeInformationsFailure implements MeInformationsState {
  final String message;

  MeInformationsFailure(this.message);
}
