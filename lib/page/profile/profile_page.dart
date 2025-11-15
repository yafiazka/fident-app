import 'package:fident_app/core/controller/main_controller.dart';
import 'package:fident_app/theme/template.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<MainController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Profile",
            style: ChessTextStyle.king.copyWith(color: ChessColor.black),
          ),

          const SizedBox(height: 24),

          Obx(() {
            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // ICON
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade200,
                    ),
                    child: const Icon(Icons.person, size: 28),
                  ),
                  const SizedBox(width: 12),

                  // NAME & EMAIL
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.name.value,
                        style: ChessTextStyle.pawn.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        controller.email.value,
                        style: ChessTextStyle.pawn.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),

          const SizedBox(height: 30),

          _menuItem(Icons.chat_bubble_outline, "Complaints & Suggestions"),
          _menuItem(
            Icons.info_outline,
            "About PT. Bongkar Turet Mobile Legend",
          ),
          _menuItem(Icons.menu_book_outlined, "Vision & mission"),
          _menuItem(Icons.privacy_tip_outlined, "Privacy Policy"),
          _menuItem(Icons.article_outlined, "Terms of Service"),
          _menuItem(Icons.thumb_up_alt_outlined, "Leave a Review"),

          const SizedBox(height: 10),

          Divider(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextButton(
              onPressed: () => _showLogoutModal(context),
              child: Row(
                children: [
                  Icon(Icons.logout, color: Colors.grey.shade600),
                  const SizedBox(width: 8),
                  Text(
                    "Logout",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Icon(icon, color: ChessColor.navy),
          const SizedBox(width: 12),
          Text(
            title,
            style: ChessTextStyle.pawn.copyWith(
              fontSize: 14,
              color: ChessColor.black,
            ),
          ),
        ],
      ),
    );
  }

  void _showLogoutModal(BuildContext context) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.warning_amber_rounded,
                color: Colors.red,
                size: 40,
              ),
              const SizedBox(height: 12),
              Text("Logout Confirmation", style: ChessTextStyle.rook),
              const SizedBox(height: 8),
              Text(
                "Are you sure you want to logout?",
                textAlign: TextAlign.center,
                style: ChessTextStyle.pawn.copyWith(fontSize: 13),
              ),
              const SizedBox(height: 20),

              // BUTTONS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: const Text("Cancel"),
                    onPressed: () => Get.back(),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade600,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Logout",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      controller.box.erase();
                      Get.offAllNamed("/login");
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
