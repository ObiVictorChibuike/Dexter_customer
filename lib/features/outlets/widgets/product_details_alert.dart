import 'package:flutter/material.dart';
import 'package:nettapp/features/trade_visit/widgets/outlet_details_row.dart';

class ProductDetailsAlert extends StatelessWidget {
  const ProductDetailsAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
          height: 280,
          width: 600,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutletDetailsRow(label: "Category", value: "Wines"),
              OutletDetailsRow(label: "Brand", value: "Gerard Betrand"),
              OutletDetailsRow(label: "SKU", value: "Pinot noir"),
              OutletDetailsRow(label: "Availability", value: "In Stock"),
              OutletDetailsRow(label: "New Listing", value: "No"),
              OutletDetailsRow(label: "Price Changed", value: "No"),
              OutletDetailsRow(label: "Price", value: "₦85,000"),
            ],
          )),
    );
  }
}
