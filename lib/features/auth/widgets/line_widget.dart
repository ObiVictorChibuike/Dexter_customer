import 'package:flutter/material.dart';

class LineWidget extends StatelessWidget {
  const LineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
        offset: const Offset(0, -20),
        child: Image.asset("assets/images/white_line.png"));
  }
}
