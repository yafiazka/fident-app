import 'package:fident_app/theme/template.dart';
import 'package:flutter/material.dart';

class AttendanceCard extends StatelessWidget {
  const AttendanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: ChessColor.black.withValues(alpha: 0.2),
            blurRadius: 2.5,
            spreadRadius: 2.5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Day (DD MM YYYY)",
            style: ChessTextStyle.pawn.copyWith(fontSize: 12),
          ),

          const SizedBox(height: 4),

          Text(
            "PT. Bongkar Turet Mobile Legend",
            style: ChessTextStyle.pawn.copyWith(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          Text(
            "Attendance Required",
            style: ChessTextStyle.pawn.copyWith(fontSize: 12),
          ),
          Text(
            "11:30 - 14:00",
            style: ChessTextStyle.pawn.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Absent Now",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
