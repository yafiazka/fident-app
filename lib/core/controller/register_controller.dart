import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fident_app/utils/firebase_error_parser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final emailC = TextEditingController();
  final passC = TextEditingController();
  final confirmC = TextEditingController();

  final formKey = GlobalKey<FormState>();

  var isLoading = false.obs;

  // Validator
  String? validateEmail(String? value) {
    if (value == null || !value.contains("@")) return "Invalid email";
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

  // REGISTER
  Future<void> doRegister() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    try {
      final cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailC.text.trim(),
        password: passC.text.trim(),
      );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(cred.user!.uid)
          .set({"email": emailC.text});

      Get.offAllNamed("/register-success");
    } catch (e) {
      Get.snackbar("Register Failed", FirebaseErrorParser.parse(e.toString()));
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    confirmC.dispose();
    super.onClose();
  }
}
