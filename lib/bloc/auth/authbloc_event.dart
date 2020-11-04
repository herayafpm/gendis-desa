part of 'authbloc.dart';

@immutable
abstract class AuthBlocEvent {}

class AuthBlocLoginEvent extends AuthBlocEvent {
  final String nik;
  final String password;

  AuthBlocLoginEvent(this.nik, this.password);
}

class AuthBlocForgotPassEvent extends AuthBlocEvent {
  final String nik;
  final String password;

  AuthBlocForgotPassEvent(this.nik, this.password);
}

class AuthBlocRegisterEvent extends AuthBlocEvent {
  final UserModel model;

  AuthBlocRegisterEvent(this.model);
}

class AuthBlocChangePassEvent extends AuthBlocEvent {
  final String oldPassword;
  final String newPassword;

  AuthBlocChangePassEvent(this.oldPassword, this.newPassword);
}
