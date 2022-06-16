import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesify/constants/constants.dart';

class TitleText extends StatelessWidget {
  final String title;
  final double? fontSize;
  TitleText({Key? key, required this.title, this.fontSize = 18.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.comicNeue(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : AppStyle.primaryColor,
      ),
    );
  }
}
