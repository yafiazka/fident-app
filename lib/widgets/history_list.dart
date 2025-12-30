import 'package:fident_app/core/controller/main_controller.dart';
import 'package:fident_app/theme/template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainController>();

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ChessColor.white,
        boxShadow: [
          BoxShadow(
            color: ChessColor.black.withValues(alpha: 0.1),
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

          StreamBuilder<List<Map<String, dynamic>>>(
            stream: controller.streamHistory(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(18.0),
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text("No history yet"),
                );
              }

              final list = snapshot.data!;
              return Column(
                children: list.map((item) => _historyItem(item)).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _historyItem(Map<String, dynamic> data) {
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
                data["title"],
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
                style: ChessTextStyle.pawn.copyWith(fontSize: 14),
              ),
              Text(
                "Similarity: ${data["similarity"]}%",
                style: ChessTextStyle.pawn.copyWith(
                  fontSize: 11,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
