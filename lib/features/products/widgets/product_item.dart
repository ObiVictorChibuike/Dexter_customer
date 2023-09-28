import 'package:flutter/material.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/widgets/text_widget.dart';

class ProductItem extends StatelessWidget {
  final String productName;
  final String outletName;
  final String productBrand;
  const ProductItem({super.key, this.onTap, required this.productName, required this.outletName, required this.productBrand});
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
             TextWidget(
              text: productBrand,
              fontSize: 14,
            ),
            TextWidget(
              text: outletName,
              fontSize: 14,
            ),
             TextWidget(
              text: productName,
              fontSize: 14,
            ),
          ],
        ),
      ),
    );
  }
}
