import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final int? maxLines;
  final Color? color;
  const TitleText(
      {Key? key,
      required this.title,
      this.fontSize = 18.0,
      this.overflow,
      this.maxLines,
      this.color,
      this.fontWeight = FontWeight.bold})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.quicksand(
          fontSize: fontSize, fontWeight: fontWeight, color: color),
    );
  }
}
