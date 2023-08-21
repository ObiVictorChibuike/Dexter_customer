import 'package:flutter/material.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/widgets/text_widget.dart';
import 'package:nettapp/features/auth/widgets/app_bar_row.dart';
import 'package:nettapp/features/trade_visit/widgets/product_item.dart';

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

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    List<int> indexes = [1, 2, 3, 4];

    return Column(
      children: [
        const Row(
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
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 900,
          child: ListView.builder(
              itemCount: indexes.length,
              itemBuilder: (context, index) {
                bool menuIsVisible = false;
                return ProductItem(
                    menuIsVisible: menuIsVisible,
                    label: "Pinot noir",
                    onTap: () {
                      setState(() {
                        menuIsVisible = !menuIsVisible;
                      });
                    },
                    onDelete: () {},
                    price: "₦30000",
                    onEdit: () {},
                    index: index);
              }),
        )
      ],
    );
  }
}
