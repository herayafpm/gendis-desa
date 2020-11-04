part of 'difabel_bloc.dart';

@immutable
abstract class DifabelBlocState {}

class DifabelBlocInitial extends DifabelBlocState {}

class DifabelBlocLoading extends DifabelBlocState {}

class DifabelBlocSuccess extends DifabelBlocState {
  final Map<String, dynamic> data;

  DifabelBlocSuccess(this.data);
}

class DifabelBlocStaticSuccess extends DifabelBlocState {
  final Map<String, dynamic> data;

  DifabelBlocStaticSuccess(this.data);
}

// class DifabelBlocLoaded extends DifabelBlocState {
//   final DifabelModel difabel;

//   DifabelBlocLoaded(this.difabel);
// }

// ignore: must_be_immutable
class DifabelBlocListLoaded extends DifabelBlocState {
  List<DifabelModel> difabels;
  bool hasReachMax;

  DifabelBlocListLoaded({this.difabels, this.hasReachMax});
  DifabelBlocListLoaded copyWith(
      {List<DifabelModel> difabels, bool hasReachMax}) {
    return DifabelBlocListLoaded(
        difabels: difabels ?? this.difabels,
        hasReachMax: hasReachMax ?? this.hasReachMax);
  }
}

class DifabelBlocError extends DifabelBlocState {
  final String error;

  DifabelBlocError(this.error);
}

class DifabelBlocErrorValidasi extends DifabelBlocState {
  final Map<String, dynamic> errors;

  DifabelBlocErrorValidasi(this.errors);
}
