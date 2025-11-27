import 'package:fident_app/core/controller/main_controller.dart';
import 'package:fident_app/theme/template.dart';
import 'package:fident_app/widgets/attendance_card.dart';
import 'package:fident_app/widgets/header_card.dart';
import 'package:fident_app/widgets/history_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<MainController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: ChessColor.white),
        Image.asset('assets/ellipse.png'),
        Container(
          padding: EdgeInsets.all(40),
          child: ListView(
            shrinkWrap: true,
            children: [
              Obx(
                () => HeaderCard(
                  name: controller.name.value,
                  role: controller.role.value,
                  img: controller.faceBase64.value,
                ),
              ),

              const SizedBox(height: 16),
              const AttendanceCard(),
              const SizedBox(height: 16),

              const Divider(),
              const SizedBox(height: 12),

              HistoryList(),
            ],
          ),
        ),
      ],
    );
  }
}
