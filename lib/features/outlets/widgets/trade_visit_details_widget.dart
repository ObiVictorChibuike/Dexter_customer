import 'package:flutter/material.dart';
import 'package:nettapp/features/outlets/widgets/product_item.dart';

class TradeVisitDetailsWidget extends StatelessWidget {
  const TradeVisitDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: const [
        ProductItem(product: "Pinot noir", price: "85,000"),
        ProductItem(product: "Pinot noir", price: "85,000"),
        ProductItem(product: "Pinot noir", price: "85,000"),
        ProductItem(product: "Pinot noir", price: "85,000")
      ],
    );
  }
}
