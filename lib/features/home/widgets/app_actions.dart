import 'package:flutter/material.dart';
import 'package:nettapp/config/router/routes.dart';
import 'package:nettapp/features/home/widgets/app_action.dart';

class AppActions extends StatelessWidget {
  const AppActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Column(
        children: [
          AppAction(
            onTap: () {
              Navigator.pushNamed(context, Routes.outlets);
            },
            image: "store",
            label: "View Outlets",
          ),
          AppAction(
            onTap: () {
              Navigator.pushNamed(context, Routes.outletForm);
            },
            image: "add",
            label: "Create a new outlet",
          ),
          AppAction(
            onTap: () {
              Navigator.pushNamed(context, Routes.completedVisits);
            },
            image: "done",
            label: "Completed visits",
          ),
          const AppAction(
            image: "schedule",
            label: "Scheduled visit",
          ),
          const AppAction(
            image: "products",
            label: "Products",
          ),
          const AppAction(
            image: "competition",
            label: "Competition Reviews",
          ),
          const AppAction(
            image: "download",
            label: "Download Schedule",
          ),
        ],
      ),
    );
  }
}
