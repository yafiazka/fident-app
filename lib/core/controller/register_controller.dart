import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {
  final emailC = TextEditingController();
  final passC = TextEditingController();
  final confirmC = TextEditingController();
  final nameC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  RxBool isPassHidden = true.obs;
  RxBool isConfirmHidden = true.obs;
  RxString passwordStrength = "".obs;

  // untuk foto wajah
  Rx<File?> faceFile = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  // ================= FOTO =================
  Future<void> pickCamera() async {
    final XFile? x = await _picker.pickImage(source: ImageSource.camera);
    if (x != null) faceFile.value = File(x.path);
  }

  Future<void> pickGallery() async {
    final XFile? x = await _picker.pickImage(source: ImageSource.gallery);
    if (x != null) faceFile.value = File(x.path);
  }

  // ================= VALIDATORS =================
  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) return "Name is required";
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return "Email is required";
    if (!value.contains("@")) return "Invalid email format";
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.length < 6) return "Minimum 6 characters";
    return null;
  }

  String? validateConfirm(String? value) {
    if (value != passC.text) return "Passwords do not match";
    return null;
  }

  // ================= PASSWORD STRENGTH =================
  void checkPasswordStrength(String v) {
    if (v.length < 6) {
      passwordStrength.value = "Weak";
    } else if (v.length < 10) {
      passwordStrength.value = "Medium";
    } else {
      passwordStrength.value = "Strong";
    }
  }

  // ================= REGISTER =================
  Future<void> doRegister() async {
    if (!formKey.currentState!.validate()) return;

    if (faceFile.value == null) {
      Get.snackbar("Foto Wajah", "Silakan unggah foto wajah terlebih dahulu.");
      return;
    }

    isLoading.value = true;

    try {
      final cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailC.text.trim(),
        password: passC.text.trim(),
      );

      final uid = cred.user!.uid;

      final rawBytes = await faceFile.value!.readAsBytes();
      final compressedBytes = await FlutterImageCompress.compressWithList(
        rawBytes,
        minWidth: 500,
        minHeight: 500,
        quality: 30, // semakin kecil semakin kompres
      );

      final base64Image = base64Encode(compressedBytes);

      if (base64Image.length > 900000) {
        isLoading.value = false;
        Future.delayed(Duration.zero, () {
          Get.snackbar(
            "Foto Terlalu Besar",
            "Silakan ambil ulang foto lebih dekat agar ukuran lebih kecil",
          );
        });
        return;
      }

      await FirebaseFirestore.instance.collection("users").doc(uid).set({
        "uid": uid,
        "name": nameC.text.trim(),
        "email": emailC.text.trim(),
        "role": "Employee",
        "face_base64": base64Image,
        "created_at": DateTime.now(),
      });

      Get.offAllNamed("/register-success");
    } catch (e) {
      Future.delayed(Duration.zero, () {
        Get.snackbar("Register Failed", e.toString());
      });
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    confirmC.dispose();
    nameC.dispose();
    super.onClose();
  }
}
