import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:gendisdesa/models/difabel_model.dart';
import 'package:gendisdesa/repositories/difabel_repository.dart';
part 'difabelbloc_event.dart';
part 'difabelbloc_state.dart';

class DifabelBloc extends Bloc<DifabelBlocEvent, DifabelBlocState> {
  DifabelBloc() : super(DifabelBlocInitial());

  @override
  Stream<DifabelBlocState> mapEventToState(
    DifabelBlocEvent event,
  ) async* {
    if (event is CariDataDifabelBlocEvent) {
      yield DifabelBlocLoading();
      Map<String, dynamic> res = await DifabelRepository.cekStatus(event.nik);
      if (res['statusCode'] == 200 && res['data']['status'] == 1) {
        yield DifabelBlocSuccess(res['data']);
      } else if (res['statusCode'] == 400) {
        yield DifabelBlocError(res['data']['message']);
      } else {
        yield DifabelBlocError(res['message']);
      }
    } else if (event is DifabelGetListBlocEvent) {
      List<DifabelModel> difabels;
      if (state is DifabelBlocInitial || event.refresh) {
        Map<String, dynamic> res = await DifabelRepository.getDifabels(10, 0);
        if (res['statusCode'] == 200 && res['data']['status'] == 1) {
          var jsonObject = res['data']['data']['data'] as List;
          difabels = jsonObject
              .map<DifabelModel>((e) => DifabelModel.createFromJson(e))
              .toList();
          yield DifabelBlocListLoaded(difabels: difabels, hasReachMax: false);
        } else if (res['statusCode'] == 400) {
          yield DifabelBlocError(res['data']['message']);
        } else {
          yield DifabelBlocError(res['message']);
        }
      } else if (state is DifabelBlocListLoaded) {
        DifabelBlocListLoaded difabelBlocList = state;
        Map<String, dynamic> res = await DifabelRepository.getDifabels(
            10, difabelBlocList.difabels.length);
        if (res['statusCode'] == 200 && res['data']['status'] == 1) {
          var jsonObject = res['data']['data']['data'] as List;
          if (jsonObject.length == 0) {
            yield difabelBlocList.copyWith(hasReachMax: true);
          } else {
            difabels = jsonObject
                .map<DifabelModel>((e) => DifabelModel.createFromJson(e))
                .toList();
            yield DifabelBlocListLoaded(
                difabels: difabelBlocList.difabels + difabels,
                hasReachMax: false);
          }
        } else if (res['statusCode'] == 400) {
          yield DifabelBlocError(res['data']['message']);
        } else {
          yield DifabelBlocError(res['message']);
        }
      }
    } else if (event is DifabelGetStaticBlocEvent) {
      Map<String, dynamic> res = await DifabelRepository.getStaticData();
      if (res['statusCode'] == 200 && res['data']['status'] == 1) {
        yield DifabelBlocStaticSuccess(res['data']['data']);
      } else if (res['statusCode'] == 400) {
        yield DifabelBlocError(res['data']['message']);
      } else {
        yield DifabelBlocError(res['message']);
      }
    } else if (event is DifabelFormBlocEvent) {
      Map<String, dynamic> res;
      print("data ${event.difabel.difabel_id}");
      if (event.difabel.difabel_id != null) {
        res = await DifabelRepository.updateDifabel(event.difabel.toJson());
      } else {
        res = await DifabelRepository.insertDifabel(event.difabel.toJson());
      }
      if (res != null) {
        if (res['statusCode'] == 200 && res['data']['status'] == 1) {
          yield DifabelBlocSuccess(res['data']);
        } else if (res['statusCode'] == 400) {
          yield DifabelBlocError(res['data']['message']);
          this..add(DifabelGetListBlocEvent(refresh: true));
        } else {
          yield DifabelBlocError(res['message']);
        }
      }
    } else if (event is DifabelDeleteBlocEvent) {
      Map<String, dynamic> res =
          await DifabelRepository.deleteDifabel(event.id);
      if (res['statusCode'] == 200 && res['data']['status'] == 1) {
        yield DifabelBlocSuccess(res['data']);
        this..add(DifabelGetListBlocEvent(refresh: true));
      } else if (res['statusCode'] == 400) {
        yield DifabelBlocError(res['data']['message']);
        this..add(DifabelGetListBlocEvent(refresh: true));
      } else {
        yield DifabelBlocError(res['message']);
        this..add(DifabelGetListBlocEvent(refresh: true));
      }
    }
  }
}
