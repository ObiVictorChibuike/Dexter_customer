import 'package:flutter/material.dart';
import 'package:nettapp/features/outlets/widgets/product_item.dart';
import 'package:nettapp/features/outlets/widgets/show_product_details_alert.dart';

class TradeVisitDetailsWidget extends StatelessWidget {
  const TradeVisitDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        ProductItem(
          product: "Pinot noir",
          price: "85,000",
          onTap: () {
            showProductDetailsAlert(context);
          },
        ),
        ProductItem(
          product: "Pinot noir",
          price: "85,000",
          onTap: () {
            showProductDetailsAlert(context);
          },
        ),
        ProductItem(
          product: "Pinot noir",
          price: "85,000",
          onTap: () {
            showProductDetailsAlert(context);
          },
        ),
        ProductItem(
          product: "Pinot noir",
          price: "85,000",
          onTap: () {
            showProductDetailsAlert(context);
          },
        )
      ],
    );
  }
}
