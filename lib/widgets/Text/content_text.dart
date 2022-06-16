import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesify/constants/constants.dart';

class ContentText extends StatelessWidget {
  String title;
  ContentText({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.comicNeue(
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : AppStyle.primaryColor,
      ),
    );
  }
}
