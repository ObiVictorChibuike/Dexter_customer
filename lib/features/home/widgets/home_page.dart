import 'package:flutter/material.dart';
import 'package:nettapp/core/widgets/text_widget.dart';
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
            const SizedBox(
              height: 20,
            ),
            const SummaryView(),
            const AppActions()
          ],
        ),
      ),
    );
  }
}

class AppActions extends StatelessWidget {
  const AppActions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Column(
        children: [
          Action(
            image: "store",
            label: "View Outlets",
          ),
          Action(
            image: "add",
            label: "Create a new outlet",
          ),
          Action(
            image: "outlet",
            label: "Completed visits",
          ),
          Action(
            image: "outlet",
            label: "Scheduled visits",
          ),
        ],
      ),
    );
  }
}

class Action extends StatelessWidget {
  const Action({super.key, required this.image, required this.label});
  final String image;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(border: Border.all(width: .5)),
      child: Row(
        children: [
          Image.asset(
            "assets/images/$image.png",
            width: 30,
          ),
          const SizedBox(
            width: 20,
          ),
          TextWidget(
            text: label,
            fontSize: 13,
          )
        ],
      ),
    );
  }
}
