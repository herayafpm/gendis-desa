import 'package:flutter/material.dart';
import 'package:gendisdesa/controllers/dashboard_controller.dart';
import 'package:gendisdesa/ui/difabel/dashboard/akun_page.dart';
import 'package:gendisdesa/ui/difabel/dashboard/pendaftaran_difabel_page.dart';
import 'package:gendisdesa/ui/difabel/dashboard/riwayat_difabel_page.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  final controller = Get.put(DashboardController());
  final List<Widget> listPageMenu = [
    PendaftaranDifabelPage(),
    RiwayatDifabelPage(),
    AkunPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => listPageMenu[controller.currentIndex.value]),
      bottomNavigationBar: Obx(() => Theme(
            data: Theme.of(context).copyWith(
                textTheme: Theme.of(context)
                    .textTheme
                    .copyWith(caption: TextStyle(color: Colors.white)),
                canvasColor: Color(0xFF30318B),
                primaryColor: Colors.white),
            child: SizedBox(
              height: 90,
              child: BottomNavigationBar(
                elevation: 10,
                showUnselectedLabels: true,
                items: <BottomNavigationBarItem>[
                  itemBottomNavBar(Icon(Icons.data_usage, color: Colors.white),
                      "Daftar Difabel"),
                  itemBottomNavBar(
                      Icon(Icons.file_present, color: Colors.white),
                      "Riwayat Pendaftaran"),
                  itemBottomNavBar(
                      Icon(Icons.account_circle, color: Colors.white), "Akun"),
                ],
                selectedItemColor: Colors.white54,
                currentIndex: controller.currentIndex.value,
                onTap: (index) => controller.currentIndex.value = index,
              ),
            ),
          )),
    );
  }

  BottomNavigationBarItem itemBottomNavBar(Widget icon, String title) {
    return BottomNavigationBarItem(
      icon: icon,
      label: title,
    );
  }
}
