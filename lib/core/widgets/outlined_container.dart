import 'package:flutter/material.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';

class OutlinedContainer extends StatelessWidget {
  const OutlinedContainer({super.key, required this.content});
  final Widget content;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.inputBorder, width: 2)),
      child: content,
    );
  }
}
