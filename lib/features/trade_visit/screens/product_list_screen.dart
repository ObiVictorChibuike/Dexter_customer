import 'package:flutter/material.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/widgets/text_widget.dart';
import 'package:nettapp/features/auth/widgets/app_bar_row.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: const [AppBarRow(), ProductsList()],
      ),
    );
  }
}

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
              text: "SKU",
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            CircleAvatar(
              backgroundColor: AppColors.blue,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        ProductItem(),
        ProductItem(),
        ProductItem(),
        ProductItem()
      ],
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: const Row(
          children: [
            Column(
              children: [
                TextWidget(
                  text: "Pinot noir",
                  color: Colors.white,
                  fontSize: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                TextWidget(
                  text: "₦300000",
                  color: Colors.white,
                  fontSize: 20,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
