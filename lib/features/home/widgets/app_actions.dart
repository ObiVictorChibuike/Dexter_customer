import 'package:flutter/material.dart';
import 'package:nettapp/features/home/widgets/app_action.dart';

class AppActions extends StatelessWidget {
  const AppActions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Column(
        children: [
          AppAction(
            image: "store",
            label: "View Outlets",
          ),
          AppAction(
            image: "add",
            label: "Create a new outlet",
          ),
          AppAction(
            image: "outlet",
            label: "Carry out a trade visit",
          ),
          AppAction(
            image: "done",
            label: "Completed visits",
          ),
          AppAction(
            image: "schedule",
            label: "Scheduled visit",
          ),
          AppAction(
            image: "products",
            label: "Products",
          ),
          AppAction(
            image: "competition",
            label: "Competition Reviews",
          ),
        ],
      ),
    );
  }
}
