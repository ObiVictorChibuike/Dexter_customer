import 'package:flutter/material.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';

import 'package:nettapp/core/widgets/text_widget.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            color: AppColors.blue, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: TextWidget(
            text: label,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
