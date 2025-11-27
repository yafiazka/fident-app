// lib/attendance/attendance_page.dart

import 'package:fident_app/core/controller/attendance_controller.dart';
import 'package:fident_app/theme/template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceScanPage extends GetView<AttendanceController> {
  const AttendanceScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ChessColor.navy,
      appBar: AppBar(
        backgroundColor: ChessColor.navy,
        elevation: 0,
        title: const Text(
          "Face Attendance",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Obx(() {
        return Center(
          child: controller.isLoading.value
              ? const CircularProgressIndicator(color: Colors.white)
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4),
                      ),
                      child: const Icon(
                        Icons.face_retouching_natural,
                        color: Colors.white,
                        size: 80,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Scan Your Face",
                      style: ChessTextStyle.king.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Pastikan wajahmu jelas dan penuh di kamera",
                      style: TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () => controller.startFaceAttendance(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ChessColor.highlight,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Start Face Scan",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
        );
      }),
    );
  }
}
