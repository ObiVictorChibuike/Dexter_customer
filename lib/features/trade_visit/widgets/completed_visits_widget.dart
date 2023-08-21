import 'package:flutter/material.dart';
import 'package:nettapp/core/widgets/text_widget.dart';
import 'package:nettapp/features/trade_visit/widgets/accordion_widget.dart';

class CompletedVisitsWidget extends StatelessWidget {
  const CompletedVisitsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 30),
      child: Column(
        children: [
          TextWidget(
              text:
                  "Visits that have been completed for the week will appear here"),
          SizedBox(
            height: 20,
          ),
          AccordionWidget()
        ],
      ),
    );
  }
}
