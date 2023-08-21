import 'package:flutter/material.dart';
import 'package:nettapp/features/auth/widgets/app_bar_row.dart';
import 'package:nettapp/features/outlets/widgets/form_header.dart';
import 'package:nettapp/features/scheduled%20visits/presentation/widgets/add_to_schedule_alert.dart';
import 'package:nettapp/features/scheduled%20visits/presentation/widgets/add_visit_button.dart';
import 'package:nettapp/features/scheduled%20visits/presentation/widgets/scheduled_visits_tab_view.dart';

class ScheduledVisitsScreen extends StatelessWidget {
  const ScheduledVisitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const AppBarRow(),
            const FormHeaderWidget(title: "Scheduled Outlets"),
            AddVisitButton(onTap: () {
              showAddVisitAlert(context);
            }),
            const ScheduledVisitTabView(),
          ],
        ),
      ),
    );
  }
}
