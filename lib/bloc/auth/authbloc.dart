import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gendisdesa/models/user_model.dart';
import 'package:meta/meta.dart';
import 'package:gendisdesa/repositories/auth_repository.dart';

part 'authbloc_event.dart';
part 'authbloc_state.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBloc() : super(AuthBlocStateInitial());

  @override
  Stream<AuthBlocState> mapEventToState(
    AuthBlocEvent event,
  ) async* {
    if (event is AuthBlocLoginEvent) {
      yield AuthBlocStateLoading();
      Map<String, dynamic> res =
          await AuthRepository.login(event.nik, event.password);
      if (res['statusCode'] == 200 && res['data']['status'] == 1) {
        yield AuthBlocStateSuccess(res['data']);
      } else if (res['statusCode'] == 400) {
        yield AuthBlocStateError(res['data']['message']);
      } else {
        yield AuthBlocStateError(res['message']);
      }
    } else if (event is AuthBlocForgotPassEvent) {
      yield AuthBlocStateLoading();
      Map<String, dynamic> res =
          await AuthRepository.forgotpass(event.nik, event.password);
      if (res['statusCode'] == 200 && res['data']['status'] == 1) {
        yield AuthBlocStateSuccess(res['data']);
      } else if (res['statusCode'] == 400) {
        yield AuthBlocStateError(
            res['data']['message'] ?? res['data']['user_nik']);
      } else {
        yield AuthBlocStateError(res['message']);
      }
    } else if (event is AuthBlocRegisterEvent) {
      yield AuthBlocStateLoading();
      Map<String, dynamic> res = await AuthRepository.register(event.model);
      if (res['statusCode'] == 200 && res['data']['status'] == 1) {
        yield AuthBlocStateSuccess(res['data']);
      } else if (res['statusCode'] == 400) {
        yield AuthBlocStateError(
            res['data']['data']['user_nik'] ?? res['data']['message']);
      } else {
        yield AuthBlocStateError(res['message']);
      }
    } else if (event is AuthBlocChangePassEvent) {
      yield AuthBlocStateLoading();
      Map<String, dynamic> res =
          await AuthRepository.changePass(event.oldPassword, event.newPassword);
      if (res['statusCode'] == 200 && res['data']['status'] == 1) {
        yield AuthBlocStateSuccess(res['data']);
      } else if (res['statusCode'] == 400) {
        yield AuthBlocStateError(
            res['data']['data']['old_password'] ?? res['data']['message']);
      } else {
        yield AuthBlocStateError(res['message']);
      }
    }
  }
}
