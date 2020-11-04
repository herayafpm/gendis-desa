import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gendisdesa/repositories/home_repository.dart';
import 'package:meta/meta.dart';

part 'homebloc_event.dart';
part 'homebloc_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBloc() : super(HomeBlocInitial());

  @override
  Stream<HomeBlocState> mapEventToState(
    HomeBlocEvent event,
  ) async* {
    if (event is HomeBlocBannerEvent) {
      yield HomeBlocStateLoading();
      Map<String, dynamic> res = await HomeRepository.getBanners();
      if (res['statusCode'] == 400) {
        yield HomeBlocStateError(res['data']);
      } else if (res['statusCode'] == 200) {
        List<String> banners = new List<String>();
        for (var banner in res['data']) {
          banners.add(banner);
        }
        yield HomeBlocBannerSuccess(banners);
      } else {
        yield HomeBlocStateError(res['message']);
      }
    } else if (event is HomeBlocInfoDifabelEvent) {
      yield HomeBlocStateLoading();
      Map<String, dynamic> res = await HomeRepository.getInfoDifabel();
      if (res['statusCode'] == 400 || res['data']['status'] == 0) {
        yield HomeBlocStateError(res['data']);
      } else if (res['statusCode'] == 200) {
        int verifikasi = res['data']['verifikasi']['total'] ?? 0;
        int terdaftar = res['data']['terdaftar']['total'] ?? 0;
        yield HomeBlocInfoDifabelSuccess(verifikasi, terdaftar);
      } else {
        yield HomeBlocStateError(res['data']);
      }
    }
  }
}
