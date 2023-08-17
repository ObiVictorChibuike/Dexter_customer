import 'package:flutter/material.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/widgets/text_widget.dart';

class AlertAction extends StatelessWidget {
  const AlertAction(
      {super.key,
      required this.backgroundColor,
      required this.label,
      required this.labelColor,
      required this.onTap});
  final Color backgroundColor;
  final String label;
  final Color labelColor;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: AppColors.blue,
            )),
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(5),
          color: backgroundColor,
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TextWidget(
                text: label,
                color: labelColor,
              )),
        ),
      ),
    );
  }
}
