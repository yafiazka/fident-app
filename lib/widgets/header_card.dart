import 'package:fident_app/theme/template.dart';
import 'package:flutter/material.dart';

class HeaderCard extends StatelessWidget {
  final String name;
  final String role;

  const HeaderCard({super.key, required this.name, required this.role});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ChessColor.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: ChessColor.black.withValues(alpha: 0.2),
            blurRadius: 2.5,
            spreadRadius: 2.5,
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundColor: ChessColor.white,
            backgroundImage: AssetImage('assets/icon_user.png'),
          ),

          const SizedBox(width: 12),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name.isEmpty ? "Loading..." : name,
                style: ChessTextStyle.pawn.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                role.isEmpty ? "-" : role,
                style: ChessTextStyle.pawn.copyWith(fontSize: 12),
              ),
            ],
          ),

          Spacer(),
          Image.asset('assets/icon_calendar.png', width: 24),
          SizedBox(width: 8),
          Image.asset('assets/icon_bell.png', width: 24),
        ],
      ),
    );
  }
}
