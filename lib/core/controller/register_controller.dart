import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fident_app/utils/firebase_error_parser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final emailC = TextEditingController();
  final passC = TextEditingController();
  final confirmC = TextEditingController();
  final nameC = TextEditingController();
  var isConfirmHidden = true.obs;

  final formKey = GlobalKey<FormState>();

  var isLoading = false.obs;

  var isPassHidden = true.obs;
  var passwordStrength = "".obs;
  var passwordStrengthColor = Colors.red.obs;

  void checkPasswordStrength(String value) {
    if (value.length < 6) {
      passwordStrength.value = "Weak";
    } else if (value.length < 10) {
      passwordStrength.value = "Medium";
    } else {
      passwordStrength.value = "Strong";
    }
  }

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) return "Name is required";
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || !value.contains("@")) return "Invalid email";
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.length < 6) return "Min 6 characters";
    return null;
  }

  String? validateConfirm(String? value) {
    if (value != passC.text) return "Passwords do not match";
    return null;
  }

  Future<bool> emailAlreadyUsed(String email) async {
    final result = await FirebaseAuth.instance.fetchSignInMethodsForEmail(
      email.trim(),
    );

    return result.isNotEmpty;
  }

  Future<void> doRegister() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    try {
      if (await emailAlreadyUsed(emailC.text)) {
        isLoading.value = false;
        Get.snackbar(
          "Email Used",
          "This email is already registered",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      final cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailC.text.trim(),
        password: passC.text.trim(),
      );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(cred.user!.uid)
          .set({
            "email": emailC.text.trim(),
            "name": nameC.text.trim(),
            "password": passC.text.trim(),
            "role": "Employee",
            "created_at": DateTime.now(),
          });

      Get.offAllNamed("/register-success");
    } catch (e) {
      Get.snackbar(
        "Register Failed",
        FirebaseErrorParser.parse(e.toString()),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
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
