import 'package:flutter/material.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/features/auth/widgets/app_bar_row.dart';
import 'package:nettapp/features/products/widgets/product_list.dart';
import 'package:nettapp/features/products/widgets/show_product_filter.dart';

class SkuListScreen extends StatelessWidget {
  const SkuListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: AppBarRow(),
          ),
          ProductsList()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blue,
        child: const Icon(
          Icons.filter_list,
          size: 30,
        ),
        onPressed: () {
          showProductFilter(context);
        },
      ),
    );
  }
}
