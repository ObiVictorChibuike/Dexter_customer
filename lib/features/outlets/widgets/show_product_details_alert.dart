import 'package:flutter/material.dart';
import 'package:nettapp/features/outlets/widgets/product_details_alert.dart';

showProductDetailsAlert(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const ProductDetailsAlert();
    },
  );
}
