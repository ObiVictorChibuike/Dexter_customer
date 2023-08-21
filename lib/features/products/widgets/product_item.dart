import 'package:flutter/material.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/widgets/text_widget.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 2, color: AppColors.inputGrey))),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TextWidget(
              text: "Wines",
              fontSize: 14,
            ),
            Transform.translate(
              offset: const Offset(20, 0),
              child: const TextWidget(
                text: "Cubana hotels.",
                fontSize: 14,
              ),
            ),
            const TextWidget(
              text: "Hennesey",
              fontSize: 14,
            ),
          ],
        ),
      ),
    );
  }
}
