import 'package:flutter/material.dart';
import 'package:nettapp/features/auth/widgets/app_bar_row.dart';
import 'package:nettapp/features/competition%20review/widgets/competition_review_form.dart';
import 'package:nettapp/features/outlets/widgets/form_header.dart';

class CompetitionReviewScreen extends StatelessWidget {
  const CompetitionReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [AppBarRow(), CompetitionReviewForm()],
        ),
      ),
    );
  }
}
