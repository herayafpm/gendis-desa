part of 'home_bloc.dart';

@immutable
abstract class HomeBlocState {}

class HomeBlocInitial extends HomeBlocState {}

class HomeBlocStateLoading extends HomeBlocState {}

class HomeBlocBannerSuccess extends HomeBlocState {
  final List<String> banners;

  HomeBlocBannerSuccess(this.banners);
}

class HomeBlocInfoDifabelSuccess extends HomeBlocState {
  final int verifikasi;
  final int terdaftar;

  HomeBlocInfoDifabelSuccess(this.verifikasi, this.terdaftar);
}

class HomeBlocStateError extends HomeBlocState {
  final String error;

  HomeBlocStateError(this.error);
}
