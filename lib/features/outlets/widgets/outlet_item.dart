import 'package:flutter/material.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/widgets/text_widget.dart';

class OutletItem extends StatelessWidget {
  const OutletItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 2, color: AppColors.inputGrey))),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      margin: const EdgeInsets.only(top: 10),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            text: "Outlet News",
            fontSize: 14,
          ),
          TextWidget(
            text: "Last Visited",
            fontSize: 14,
          ),
        ],
      ),
    );
  }
}
