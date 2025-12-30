import 'package:fident_app/core/controller/register_controller.dart';
import 'package:fident_app/theme/template.dart';
import 'package:fident_app/widgets/input_file.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          Get.back();
        }
      },
      child: Scaffold(
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
      ),
    );
  }

  Widget _body(context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const SizedBox(height: 100),

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

        Expanded(
          child: Container(
            padding: const EdgeInsets.all(40),
            margin: const EdgeInsets.only(top: 60),
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
                  const Center(
                    child: Text(
                      "Create Your Account",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0C2D48),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  InputField(
                    label: "Full Name:",
                    controller: controller.nameC,
                    validator: controller.validateName,
                  ),
                  const SizedBox(height: 28),

                  InputField(
                    label: "Email address:",
                    controller: controller.emailC,
                    validator: controller.validateEmail,
                  ),
                  const SizedBox(height: 28),

                  Text("Password:", style: ChessTextStyle.labelStyle),
                  const SizedBox(height: 8),

                  Obx(() {
                    return TextFormField(
                      controller: controller.passC,
                      obscureText: controller.isPassHidden.value,
                      validator: controller.validatePassword,
                      onChanged: controller.checkPasswordStrength,
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 18,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade600,
                            width: 1,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red.shade400,
                            width: 1.5,
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isPassHidden.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () => controller.isPassHidden.toggle(),
                        ),
                      ),
                    );
                  }),

                  Obx(() {
                    if (controller.passwordStrength.value == "") {
                      return SizedBox.shrink();
                    }

                    return Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        "Strength: ${controller.passwordStrength.value}",
                        style: TextStyle(
                          color: controller.passwordStrength.value == "Strong"
                              ? Colors.green
                              : controller.passwordStrength.value == "Medium"
                              ? Colors.orange
                              : Colors.red,
                        ),
                      ),
                    );
                  }),

                  const SizedBox(height: 28),

                  Text("Confirm Password:", style: ChessTextStyle.labelStyle),
                  const SizedBox(height: 8),

                  Obx(() {
                    return TextFormField(
                      controller: controller.confirmC,
                      obscureText: controller.isConfirmHidden.value,
                      validator: controller.validateConfirm,
                      decoration: InputDecoration(
                        hintText: "Re-enter your password",
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 18,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade600,
                            width: 1,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red.shade400,
                            width: 1.5,
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isConfirmHidden.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () => controller.isConfirmHidden.toggle(),
                        ),
                      ),
                    );
                  }),

                  SizedBox(height: 20),

                  Text("Face Photo:", style: ChessTextStyle.labelStyle),
                  const SizedBox(height: 8),

                  Obx(() {
                    return GestureDetector(
                      onTap: () {
                        Get.bottomSheet(
                          Container(
                            color: Colors.white,
                            height: 150,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.camera_alt),
                                  title: Text("Camera"),
                                  onTap: () => controller.pickCamera(),
                                ),
                                ListTile(
                                  leading: Icon(Icons.photo),
                                  title: Text("Gallery"),
                                  onTap: () => controller.pickGallery(),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey),
                          image: controller.faceFile.value != null
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(controller.faceFile.value!),
                                )
                              : null,
                        ),
                        child: controller.faceFile.value == null
                            ? Icon(
                                Icons.camera_alt,
                                size: 50,
                                color: Colors.grey,
                              )
                            : null,
                      ),
                    );
                  }),

                  const SizedBox(height: 28),

                  const Text(
                    "Role: Employee",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 20),

                  const SizedBox(height: 28),

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
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
