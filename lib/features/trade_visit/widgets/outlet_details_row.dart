import 'package:flutter/material.dart';
import 'package:nettapp/core/widgets/text_widget.dart';

class OutletDetailsRow extends StatelessWidget {
  const OutletDetailsRow({super.key, required this.label, required this.value});
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: TextWidget(
              text: label,
              fontSize: 14,
              textAlign: TextAlign.left,
              fontWeight: FontWeight.w500,
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
