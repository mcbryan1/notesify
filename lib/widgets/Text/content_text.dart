import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContentText extends StatelessWidget {
  final String title;
  final TextOverflow? overflow;
  final int? maxLines;
  final Color? color;
  final double? fontSize;
  const ContentText(
      {Key? key,
      required this.title,
      this.overflow,
      this.maxLines,
      this.color,
      this.fontSize = 14.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.comicNeue(
          fontSize: fontSize, fontWeight: FontWeight.w500, color: color),
      overflow: overflow ?? TextOverflow.ellipsis,
      maxLines: maxLines ?? 2,
    );
  }
}
