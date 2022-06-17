import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color bgColor = const Color.fromARGB(255, 255, 255, 255);
  static Color primaryColor = const Color.fromARGB(255, 0, 3, 27);
  static Color accentColor = const Color(0xFF0065ff);

  // List of colors for the cards

  static List<Color> cardColors = [
    const Color.fromARGB(255, 179, 12, 0),
    const Color.fromARGB(255, 0, 116, 4),
    const Color.fromARGB(255, 0, 84, 153),
    const Color.fromARGB(255, 165, 148, 0),
    Colors.orange,
    const Color.fromARGB(255, 113, 4, 133),
    const Color.fromARGB(255, 189, 0, 63),
    const Color.fromARGB(255, 48, 20, 10),
    const Color.fromARGB(255, 31, 25, 25),
    const Color.fromARGB(255, 0, 0, 0),
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
