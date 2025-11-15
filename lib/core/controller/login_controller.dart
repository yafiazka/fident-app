import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fident_app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var isLoading = false.obs;

  final FirebaseAuth auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final box = GetStorage();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Email cannot be empty";
    if (!value.contains("@")) return "Invalid email";
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.length < 6) return "Password too short";
    return null;
  }

  Future<void> doLogin() async {
    if (!formKey.currentState!.validate()) return;

    try {
      isLoading(true);

      final credential = await auth.signInWithEmailAndPassword(
        email: emailC.text.trim(),
        password: passwordC.text.trim(),
      );

      final uid = credential.user!.uid;

      box.write("uid", uid);

      Get.offAllNamed(Routes.mainPage);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message ?? "Login failed");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    emailC.dispose();
    passwordC.dispose();
    super.onClose();
  }
}
