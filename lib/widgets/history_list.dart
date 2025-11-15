import 'package:fident_app/theme/template.dart';
import 'package:flutter/material.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final historyData = [
      {
        "status": "Attendance Success",
        "day": "Day (DD MM YYYY)",
        "time": "09:00 - 11:30",
      },
      {
        "status": "Attendance Success",
        "day": "Day (DD MM YYYY)",
        "time": "14:00 - 16:30",
      },
      {
        "status": "Attendance Success",
        "day": "Friday (14 November 2025)",
        "time": "11:30 - 14:00",
      },
      {
        "status": "Attendance Success",
        "day": "Day (DD MM YYYY)",
        "time": "09:00 - 10:40",
      },
    ];

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ChessColor.white,
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
            "Attendance History",
            style: ChessTextStyle.rook.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 12),
          ...historyData.map((item) => _historyItem(item)),
        ],
      ),
    );
  }

  Widget _historyItem(dynamic data) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(width: 4, height: 50, color: ChessColor.navy),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data["status"],
                style: ChessTextStyle.pawn.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                data["day"],
                style: ChessTextStyle.pawn.copyWith(fontSize: 12),
              ),
              Text(
                data["time"],
                style: ChessTextStyle.pawn.copyWith(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
