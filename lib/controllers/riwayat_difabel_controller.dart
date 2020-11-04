import 'package:get/get.dart';

class RiwayatDifabelController extends GetxController {
  final page = 1.obs;
  final totalPage = 1.obs;
  final status = false.obs;

  // void changePage(DifabelBloc bloc) {
  //   bloc..add(DifabelGetBlocEvent());
  // }

  // void prev(DifabelBloc bloc) {
  //   if (page.value > 1) {
  //     page.value = page.value - 1;
  //     changePage(bloc);
  //   }
  // }

  // void next(DifabelBloc bloc) {
  //   if (page.value >= 1 && page.value < totalPage.value) {
  //     page.value = page.value + 1;
  //     changePage(bloc);
  //   }
  // }

  // void delete(DifabelBloc bloc, int id) {
  //   bloc..add(DifabelDeleteBlocEvent());
  // }
}
