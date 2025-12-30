// lib/core/controller/attendance_controller.dart
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_match_liveness/face_match_liveness.dart';
import 'package:fident_app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class AttendanceController extends GetxController {
  RxBool isLoading = false.obs;
  late FaceCompare faceCompare;

  @override
  void onInit() async {
    faceCompare = await FaceCompare.create();
    super.onInit();
  }

  @override
  void onClose() {
    faceCompare.dispose();
    super.onClose();
  }

  Future<void> startFaceAttendance() async {
    try {
      isLoading.value = true;

      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        Get.snackbar("Error", "User tidak ditemukan, silakan login ulang");
        Get.offAllNamed(Routes.login);
        return;
      }

      final uid = user.uid;

      final snap = await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .get();

      if (!snap.exists || snap["face_base64"] == null) {
        isLoading.value = false;
        Get.snackbar("Error", "Wajah belum terdaftar.");
        return;
      }

      final String base64Ref = snap["face_base64"];

      final referenceFile = await _convertBase64ToFile(base64Ref);

      File? liveFile;
      await FaceLiveness.show(
        Get.context!,
        onResult: (res) {
          if (res.status == LivenessResultStatus.success) {
            liveFile = res.capturedImage;
          }
        },
      );

      if (liveFile == null) {
        isLoading.value = false;
        Get.snackbar(
          "Gagal",
          "Scan wajah gagal, coba ulangi",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      final score = await faceCompare.compare(referenceFile, liveFile!);
      debugPrint("Similarity Score: $score%");

      if (score >= 65) {
        await _saveAttendance(uid, score);
        Get.offAllNamed(Routes.attendanceSuccess);
      } else {
        Get.snackbar(
          "Wajah Tidak Cocok",
          "Similarity $score% — coba ulangi scan.",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<File> _convertBase64ToFile(String base64Str) async {
    final bytes = base64Decode(base64Str);
    final dir = await getTemporaryDirectory();
    final file = File("${dir.path}/ref_face.jpg");
    await file.writeAsBytes(bytes);
    return file;
  }

  Future<void> _saveAttendance(String uid, num score) async {
    await FirebaseFirestore.instance
        .collection("attendance")
        .doc(uid)
        .collection("history")
        .add({
          "timestamp": DateTime.now(),
          "similarity": score,
          "status": "Success",
          "title": "Attendance Success",
        });
  }
}
