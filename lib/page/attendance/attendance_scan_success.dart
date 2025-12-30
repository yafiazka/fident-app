// lib/attendance/attendance_success_page.dart
import 'dart:io';

import 'package:fident_app/routes/app_pages.dart';
import 'package:fident_app/theme/template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceSuccessPage extends StatelessWidget {
  AttendanceSuccessPage({super.key});

  final File? image = Get.arguments?["image"];
  final double? similarity = Get.arguments?["similarity"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ChessColor.navy,
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 80),
              const SizedBox(height: 16),
              Text("Attendance Verified", style: ChessTextStyle.rook),
              const SizedBox(height: 8),
              if (similarity != null)
                Text(
                  "Face match: ${similarity!.toStringAsFixed(1)}%",
                  style: TextStyle(color: Colors.grey[700], fontSize: 13),
                ),
              const SizedBox(height: 16),
              if (image != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(
                    image!,
                    width: 160,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAllNamed(Routes.mainPage),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ChessColor.highlight,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Back to Home",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
