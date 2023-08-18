import 'package:flutter/material.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/widgets/text_widget.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {super.key, required this.product, required this.price, this.onTap});
  final String product;
  final String price;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        margin: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        decoration: BoxDecoration(
            color: AppColors.blue, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
              text: product,
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            TextWidget(
              text: "₦$price",
              color: Colors.white,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
      ),
    );
  }
}
