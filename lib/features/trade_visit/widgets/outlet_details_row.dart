import 'package:flutter/material.dart';
import 'package:nettapp/core/widgets/text_widget.dart';

class OutletDetailsRow extends StatelessWidget {
  const OutletDetailsRow({super.key, required this.label, required this.value});
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(text: label),
        TextWidget(
          text: value,
        )
      ],
    );
  }
}
