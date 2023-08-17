import 'package:flutter/material.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/widgets/text_widget.dart';
import 'package:nettapp/features/home/widgets/summary_row.dart';

class SummaryView extends StatelessWidget {
  const SummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: AppColors.blue, borderRadius: BorderRadius.circular(8)),
        height: 200,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: "Overview",
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 20,
            ),
            SummaryRow(
              label: "Registered Outlets",
              value: 20,
            ),
            SummaryRow(
              label: "Scheduled Outlets",
              value: 8,
            ),
            SummaryRow(
              label: "Completed Visits",
              value: 5,
            ),
            SummaryRow(
              label: "Pending Visits",
              value: 3,
            )
          ],
        ));
  }
}
