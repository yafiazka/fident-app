import 'package:fident_app/core/controller/main_controller.dart';
import 'package:fident_app/page/home/home_page.dart';
import 'package:fident_app/theme/template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ChessColor.navy,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _fab(),
      bottomNavigationBar: _bottomNav(),
      body: Obx(() {
        switch (controller.tabIndex.value) {
          case 0:
            return HomePage();
          case 1:
            return Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: ChessColor.white,
              child: Text(
                "We’re still working on this page to make it better. \nThank you for your patience",
              ),
            );
          case 2:
            return Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: ChessColor.white,
              child: Text(
                "We’re still working on this page to make it better. \nThank you for your patience",
              ),
            );
          case 3:
            return Center(child: Text("Profile Page"));
          default:
            return HomePage();
        }
      }),
    );
  }

  Widget _fab() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 20),
        SizedBox(
          height: 80,
          width: 80,
          child: FloatingActionButton(
            elevation: 0,
            onPressed: () {},
            backgroundColor: ChessColor.highlight,
            shape: CircleBorder(
              side: BorderSide(color: ChessColor.navy, width: 4),
            ),
            child: Image.asset('assets/icon_face_id.png', width: 50),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Absent",
          style: TextStyle(color: Colors.green, fontSize: 11),
        ),
      ],
    );
  }

  Widget _bottomNav() {
    return Obx(() {
      return BottomAppBar(
        color: ChessColor.navy,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(0, "assets/icon_home.png", "Home"),
              _navItem(1, "assets/icon_list.png", "List"),
              const SizedBox(width: 30), // FAB space
              _navItem(2, "assets/icon_location.png", "Location"),
              _navItem(3, "assets/icon_profile.png", "Profile"),
            ],
          ),
        ),
      );
    });
  }

  Widget _navItem(int i, String icon, String label) {
    bool active = controller.tabIndex.value == i;

    return GestureDetector(
      onTap: () => controller.changeTab(i),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            width: 24,
            color: active ? Colors.white : Colors.white70,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: active ? Colors.white : Colors.white70,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
