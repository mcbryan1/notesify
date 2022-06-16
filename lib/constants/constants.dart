import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color bgColor = const Color(0xFFe2e2ff);
  static Color primaryColor = const Color(0xFF000633);
  static Color accentColor = const Color(0xFF0065ff);

  // List of colors for the cards

  static List<Color> cardColors = [
    const Color(0xFF0065ff),
    const Color(0xFF00ff00),
    const Color(0xFFff0000),
    const Color(0xFFff00ff),
    const Color(0xFF0000ff),
    const Color(0xFFff00ff),
    const Color(0xFFff0000),
    const Color(0xFF00ff00),
    const Color(0xFF0065ff),
    const Color(0xFFff00ff),
    const Color(0xFFff0000),
    const Color(0xFFFFFFFF),
  ];

  // Setting the text style

  static TextStyle titleStyle = GoogleFonts.roboto(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle contentStyle = GoogleFonts.nunito(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static TextStyle dateStyle = GoogleFonts.roboto(
    fontSize: 13.0,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
}
