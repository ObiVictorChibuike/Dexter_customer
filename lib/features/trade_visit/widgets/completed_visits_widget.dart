import 'package:flutter/material.dart';
import 'package:nettapp/config/router/routes.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/widgets/text_widget.dart';
import 'package:nettapp/features/outlets/widgets/outlet_item.dart';

class CompletedVisitsWidget extends StatelessWidget {
  const CompletedVisitsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          margin: const EdgeInsets.only(top: 50, bottom: 20),
          decoration: const BoxDecoration(color: AppColors.blue),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                text: "Outlet News",
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              TextWidget(
                text: "Last Visited",
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
        OutletItem(
          onTap: () {
            Navigator.pushNamed(context, Routes.tradeVisitDetails);
          },
        ),
        const OutletItem(),
        const OutletItem(),
        const OutletItem(),
        const OutletItem(),
        const OutletItem(),
        const OutletItem(),
        const OutletItem(),
        const OutletItem(),
        const OutletItem(),
        const OutletItem(),
        const OutletItem(),
        const OutletItem()
      ],
    );
  }
}
