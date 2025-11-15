import 'package:fident_app/routes/app_pages.dart';
import 'package:fident_app/services/auth_storage_service.dart';
import 'package:fident_app/theme/template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      if (authStorage.isLoggedIn) {
        Get.offAllNamed(Routes.mainPage);
      } else {
        Get.offAllNamed(Routes.login);
      }
    });

    return Scaffold(
      backgroundColor: ChessColor.navy,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/logo.png'), width: 100),
            Text(
              'Fident',
              style: ChessTextStyle.king.copyWith(color: ChessColor.white),
            ),
          ],
        ),
      ),
    );
  }
}
