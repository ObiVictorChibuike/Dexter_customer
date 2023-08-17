import 'package:flutter/material.dart';
import 'package:nettapp/core/widgets/text_widget.dart';

class SummaryRow extends StatelessWidget {
  const SummaryRow({super.key, required this.label, required this.value});
  final String label;
  final int value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(
          text: "$label:",
          color: Colors.white,
          fontSize: 14,
        ),
        TextWidget(
          text: value.toString(),
          color: Colors.white,
          fontSize: 14,
        )
      ],
    );
  }
}
