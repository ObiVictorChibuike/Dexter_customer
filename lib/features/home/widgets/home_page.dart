import 'package:flutter/material.dart';
import 'package:nettapp/core/widgets/text_widget.dart';
import 'package:nettapp/features/home/widgets/app_actions.dart';
import 'package:nettapp/features/auth/widgets/app_bar_row.dart';
import 'package:nettapp/features/home/widgets/summary_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: AppBarRow(
                secondWidget: Image.asset(
                  "assets/images/logout.png",
                  width: 25,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(0),
                children: const [SummaryView(), AppActions()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
