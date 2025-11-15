import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterSuccessPage extends StatelessWidget {
  const RegisterSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed("/login");
    });

    return Scaffold(
      backgroundColor: const Color(0xFF0C2D48),
      body: Column(
        children: [
          const SizedBox(height: 100),
          const Text(
            "Fident",
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 80),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.check_circle, size: 70, color: Color(0xFF0C2D48)),
                  SizedBox(height: 20),
                  Text(
                    "Create Success",
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xFF0C2D48),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
