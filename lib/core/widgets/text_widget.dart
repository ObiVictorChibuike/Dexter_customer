import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.text,
      this.fontSize = 16,
      this.fontWeight = FontWeight.normal,
      this.color = Colors.black,
      this.textAlign,
      this.decoration,
      this.overflow});
  final String? text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      overflow: overflow,
      style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          decoration: decoration,
          fontSize: fontSize,
          fontFamily: "neueplak"),
    );
  }
}
