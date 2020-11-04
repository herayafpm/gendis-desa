import 'package:flutter/material.dart';
import 'package:gendisdesa/controllers/home_controller.dart';
import 'package:gendisdesa/models/user_model.dart';
import 'package:gendisdesa/splash_screen_page.dart';
import 'package:gendisdesa/ui/auth/forgotpass_page.dart';
import 'package:gendisdesa/ui/auth/login_page.dart';
import 'package:gendisdesa/ui/auth/register_page.dart';
import 'package:gendisdesa/ui/difabel/cari_difabel_page.dart';
import 'package:gendisdesa/ui/difabel/dashboard/akun/ubah_pass_page.dart';
import 'package:gendisdesa/ui/difabel/dashboard/daftar_difabel_page.dart';
import 'package:gendisdesa/ui/difabel/dashboard/difabel/detail_difabel_page.dart';
import 'package:gendisdesa/ui/difabel/dashboard/difabel/image_view.dart';
import 'package:gendisdesa/ui/difabel/dashboard_page.dart';
import 'package:gendisdesa/ui/difabel/splash_dashboard_page.dart';
import 'package:gendisdesa/ui/home_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart' as Trans;
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var appDocumentDirectory =
      await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(UserModelAdapter());
  runApp(App());
}

final ThemeData appThemeData = ThemeData(
  scaffoldBackgroundColor: Color(0xFF30318B),
  primaryColor: Colors.blueAccent,
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: 'Roboto',
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  ),
);

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Gendis Desa",
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: appThemeData,
      defaultTransition: Trans.Transition.fadeIn,
      getPages: [
        GetPage(name: "/", page: () => SplashScreenPage()),
        GetPage(name: "/home", page: () => HomePage(), binding: HomeBinding()),
        GetPage(name: "/login", page: () => LoginPage()),
        GetPage(name: "/register", page: () => RegisterPage()),
        GetPage(name: "/forgotpass", page: () => ForgotPassPage()),
        GetPage(name: "/cari_difabel", page: () => CariDifabelPage()),
        GetPage(name: "/splash_dashboard", page: () => SplashDashboardPage()),
        GetPage(name: "/dashboard", page: () => DashboardPage()),
        GetPage(name: "/ubah_pass", page: () => UbahPassPage()),
        GetPage(name: "/detail_difabel", page: () => DetailDifabelPage()),
        GetPage(name: "/image_view", page: () => ImageView()),
        GetPage(name: "/daftar_difabel", page: () => DaftarDifabelPage()),
      ],
    );
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());
  }
}
