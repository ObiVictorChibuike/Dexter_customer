import 'package:flutter/material.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/widgets/text_widget.dart';
import 'package:nettapp/features/products/widgets/product_item.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
          margin: const EdgeInsets.only(top: 50, bottom: 20),
          decoration: const BoxDecoration(color: AppColors.blue),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextWidget(
                text: "Category",
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              Transform.translate(
                offset: const Offset(-15, 0),
                child: const TextWidget(
                  text: "Outlet",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextWidget(
                text: "Brand",
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
        ProductItem(
          onTap: () {},
        ),
        const ProductItem(),
        const ProductItem(),
        const ProductItem(),
        const ProductItem(),
        const ProductItem(),
        const ProductItem(),
        const ProductItem(),
        const ProductItem(),
        const ProductItem(),
        const ProductItem(),
        const ProductItem(),
        const ProductItem()
      ],
    );
  }
}
