import 'package:fident_app/core/services/auth_storage_service.dart';
import 'package:fident_app/routes/app_pages.dart';
import 'package:fident_app/theme/template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), checkSession);
  }

  void checkSession() {
    if (authStorage.isLoggedIn) {
      Get.offAllNamed(Routes.mainPage);
    } else {
      Get.offAllNamed(Routes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {},
        child: Scaffold(
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
        ),
      ),
    );
  }
}
