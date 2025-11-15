import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChessColor {
  static const Color green = Color(0xFF2FC373);
  static const Color mintSoft = Color(0xFFDCF4F1);
  static const Color navy = Color(0xFF0D3B64);
  static const Color steelBlue = Color(0xFF4B6D8F);
  static const Color iceGrey = Color(0xFFB8CCD0);
  static const Color deepSlate = Color(0xFF355677);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color textPrimary = deepSlate;
  static const Color textSecondary = steelBlue;
  static const Color highlight = green;
}

class ChessTextStyle {
  static final TextStyle king = GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w800,
    letterSpacing: 1.2,
    color: ChessColor.navy,
  );

  static final TextStyle queen = GoogleFonts.inter(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.1,
    color: ChessColor.deepSlate,
  );

  static final TextStyle rook = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: ChessColor.steelBlue,
  );

  static final TextStyle bishop = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: ChessColor.textPrimary,
  );

  static final TextStyle knight = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: ChessColor.textSecondary,
  );

  static final TextStyle pawn = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: ChessColor.textPrimary,
  );

  static final TextStyle accent = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: ChessColor.green,
  );

  static final TextStyle caption = GoogleFonts.inter(
    fontSize: 13,
    color: ChessColor.iceGrey,
  );
}
