part of 'difabel_bloc.dart';

@immutable
abstract class DifabelBlocEvent {}

class CariDataDifabelBlocEvent extends DifabelBlocEvent {
  final String nik;

  CariDataDifabelBlocEvent(this.nik);
}

class DifabelGetListBlocEvent extends DifabelBlocEvent {
  final bool refresh;

  DifabelGetListBlocEvent({this.refresh = false});
}

// class DifabelGetDataBlocEvent extends DifabelBlocEvent {
//   final int id;

//   DifabelGetDataBlocEvent(this.id);
// }

class DifabelFormBlocEvent extends DifabelBlocEvent {
  final DifabelModel difabel;
  DifabelFormBlocEvent(this.difabel);
}

class DifabelDeleteBlocEvent extends DifabelBlocEvent {
  final int id;

  DifabelDeleteBlocEvent(this.id);
}

class DifabelGetStaticBlocEvent extends DifabelBlocEvent {}
