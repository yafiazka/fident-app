import 'package:fident_app/page/auth/controller/register_controller.dart';
import 'package:fident_app/widgets/input_file.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C2D48),
      body: TweenAnimationBuilder(
        tween: Tween(begin: 50.0, end: 0.0),
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOut,
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(0, value),
            child: Opacity(opacity: (50 - value) / 50, child: child),
          );
        },
        child: _body(context),
      ),
    );
  }

  Widget _body(context) {
    return ListView(
      children: [
        const SizedBox(height: 80),

        Center(
          child: Text(
            "Fident",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        Container(
          padding: const EdgeInsets.all(40),
          margin: const EdgeInsets.only(top: 60),
          height: MediaQuery.of(context).size.height,
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
              children: [
                const SizedBox(height: 10),
                const Text(
                  "Create Your Account",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0C2D48),
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
                  controller: controller.passC,
                  obscure: true,
                  validator: controller.validatePassword,
                ),

                const SizedBox(height: 28),

                InputField(
                  label: "Confirm Password:",
                  controller: controller.confirmC,
                  obscure: true,
                  validator: controller.validateConfirm,
                ),

                const SizedBox(height: 20),

                Obx(() {
                  return SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: controller.isLoading.isFalse
                          ? () => controller.doRegister()
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3F88C5),
                        disabledBackgroundColor: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: controller.isLoading.isFalse
                          ? const Text(
                              "Create Account",
                              style: TextStyle(color: Colors.white),
                            )
                          : const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                    ),
                  );
                }),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
