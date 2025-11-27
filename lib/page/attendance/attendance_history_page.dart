import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fident_app/theme/template.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class AttendanceHistoryPage extends StatelessWidget {
  const AttendanceHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final uid = box.read<String>("uid");

    if (uid == null) {
      return const Scaffold(body: Center(child: Text("User not found")));
    }

    final stream = FirebaseFirestore.instance
        .collection("attendance")
        .doc(uid)
        .collection("history")
        .orderBy("timestamp", descending: true)
        .snapshots();

    return Scaffold(
      backgroundColor: ChessColor.navy,
      appBar: AppBar(
        backgroundColor: ChessColor.navy,
        elevation: 0,
        title: Text(
          "Attendance History",
          style: ChessTextStyle.rook.copyWith(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        ),
        padding: const EdgeInsets.all(16),
        child: StreamBuilder<QuerySnapshot>(
          stream: stream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            final docs = snapshot.data?.docs ?? [];

            if (docs.isEmpty) {
              return Center(
                child: Text(
                  "No attendance history yet.",
                  style: ChessTextStyle.pawn.copyWith(color: Colors.grey),
                ),
              );
            }

            return ListView.separated(
              itemCount: docs.length,
              separatorBuilder: (_, __) => const Divider(height: 16),
              itemBuilder: (context, index) {
                final data = docs[index].data() as Map<String, dynamic>;
                final ts = (data["timestamp"] as Timestamp).toDate();
                final status = data["status"] ?? "Present";

                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    backgroundColor: ChessColor.steelBlue,
                    child: const Icon(Icons.check, color: Colors.white),
                  ),
                  title: Text(
                    status,
                    style: ChessTextStyle.pawn.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "${ts.toLocal()}",
                    style: ChessTextStyle.pawn.copyWith(fontSize: 12),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
