import 'package:fident_app/theme/template.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ChessColor.navy,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Fident',
            style: ChessTextStyle.king.copyWith(color: ChessColor.white),
          ),
        ],
      ),
    );
  }
}
