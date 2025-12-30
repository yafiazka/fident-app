import 'package:fident_app/routes/app_pages.dart';
import 'package:fident_app/theme/template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginSuccessPage extends StatelessWidget {
  const LoginSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(Routes.mainPage);
    });

    return Scaffold(
      backgroundColor: ChessColor.navy,
      body: Column(
        children: [
          const SizedBox(height: 100),
          Text(
            'Fident',
            style: ChessTextStyle.king.copyWith(color: Colors.white),
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
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: ChessColor.navy,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Sign in Success",
                    style: ChessTextStyle.rook.copyWith(color: ChessColor.navy),
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
