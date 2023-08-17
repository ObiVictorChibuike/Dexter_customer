import 'package:flutter/material.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/widgets/text_widget.dart';

class BlueButtonWidget extends StatelessWidget {
  const BlueButtonWidget({super.key, required this.onTap, required this.label});
  final VoidCallback onTap;
  final String label;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsetsDirectional.symmetric(vertical: 14),
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.blue, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: TextWidget(
            text: label,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
