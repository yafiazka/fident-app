import 'package:fident_app/core/controller/login_controller.dart';
import 'package:fident_app/routes/app_pages.dart';
import 'package:fident_app/theme/template.dart';
import 'package:fident_app/widgets/input_file.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ChessColor.navy,

      body: TweenAnimationBuilder(
        tween: Tween(begin: 40.0, end: 0.0),
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOut,
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(0, value),
            child: Opacity(opacity: (40 - value) / 40, child: child),
          );
        },
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const SizedBox(height: 80),

        Center(
          child: Text(
            "Fident",
            style: ChessTextStyle.king.copyWith(color: ChessColor.white),
          ),
        ),

        Container(
          height: Get.height * 0.80,
          margin: const EdgeInsets.only(top: 60),
          padding: const EdgeInsets.all(40),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),

          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Sign in to your account",
                    style: ChessTextStyle.rook,
                  ),
                ),

                const SizedBox(height: 40),

                InputField(
                  label: "Email address:",
                  controller: controller.emailC,
                  validator: controller.validateEmail,
                ),

                const SizedBox(height: 28),

                InputField(
                  label: "Password:",
                  controller: controller.passwordC,
                  obscure: true,
                  validator: controller.validatePassword,
                ),

                const SizedBox(height: 12),

                Center(
                  child: Container(
                    width: 120,
                    height: 1,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 20),

                Obx(() {
                  return SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: TextButton(
                      onPressed: controller.isLoading.isFalse
                          ? () => controller.doLogin()
                          : null,
                      style: TextButton.styleFrom(
                        backgroundColor: ChessColor.steelBlue,
                        disabledBackgroundColor: Colors.grey.shade400,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: controller.isLoading.isFalse
                          ? Text(
                              "Sign In",
                              style: ChessTextStyle.pawn.copyWith(
                                color: ChessColor.white,
                              ),
                            )
                          : const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                    ),
                  );
                }),

                const Spacer(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account?",
                      style: ChessTextStyle.pawn.copyWith(color: Colors.black),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.register),
                      child: Text(
                        "Create Account",
                        style: ChessTextStyle.pawn.copyWith(
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
