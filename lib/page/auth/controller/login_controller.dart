import 'package:fident_app/routes/app_pages.dart';
import 'package:fident_app/services/auth_storage_service.dart';
import 'package:fident_app/utils/firebase_error_parser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailC = TextEditingController();
  final passC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  var isLoading = false.obs;

  String? validateEmail(String? value) {
    if (value == null || !value.contains("@")) {
      return "Please provide a valid email address.";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.length < 6) {
      return "Password must be at least 6 characters.";
    }
    return null;
  }

  Future<void> doLogin() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailC.text.trim(),
        password: passC.text.trim(),
      );

      authStorage.saveUser(credential.user!.uid);

      Get.offAllNamed(Routes.loginSuccess);
    } catch (e) {
      final message = FirebaseErrorParser.parse(e.toString());
      Get.snackbar(
        "Login Failed",
        message,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }
}
