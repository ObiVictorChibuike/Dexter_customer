import 'package:flutter/material.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/features/auth/widgets/app_bar_row.dart';
import 'package:nettapp/features/trade_visit/widgets/completed_visits_filter.dart';
import 'package:nettapp/features/trade_visit/widgets/completed_visits_list.dart';

class CompletedVisitsScreen extends StatelessWidget {
  const CompletedVisitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: AppBarRow(),
          ),
          CompletedVisitsList()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blue,
        child: const Icon(
          Icons.filter_list,
          size: 30,
        ),
        onPressed: () {
          showCompletedVisitsFilter(context);
        },
      ),
    );
  }
}
