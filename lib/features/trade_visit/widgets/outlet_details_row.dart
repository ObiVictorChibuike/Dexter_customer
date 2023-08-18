import 'package:flutter/material.dart';
import 'package:nettapp/core/widgets/text_widget.dart';

class OutletDetailsRow extends StatelessWidget {
  const OutletDetailsRow({super.key, required this.label, required this.value});
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: TextWidget(
              text: label,
              textAlign: TextAlign.left,
              fontWeight: FontWeight.w600,
            ),
          ),
          Flexible(
            child: TextWidget(
              textAlign: TextAlign.right,
              text: value,
              color: Colors.black.withOpacity(0.5),
            ),
          )
        ],
      ),
    );
  }
}
