import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color bgColor = const Color.fromARGB(255, 255, 255, 255);
  static Color primaryColor = const Color.fromARGB(255, 0, 3, 27);
  static Color accentColor = const Color(0xFF0065ff);

  // List of colors for the cards

  static List<Color> cardColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.brown,
    Colors.grey,
    Colors.black,
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
