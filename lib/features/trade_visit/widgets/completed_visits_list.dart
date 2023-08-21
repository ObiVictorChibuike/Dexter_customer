import 'package:flutter/material.dart';
import 'package:nettapp/features/trade_visit/widgets/completed_visits_widget.dart';

class CompletedVisitsList extends StatefulWidget {
  const CompletedVisitsList({super.key});

  @override
  State<CompletedVisitsList> createState() => _CompletedVisitsListState();
}

class _CompletedVisitsListState extends State<CompletedVisitsList> {
  final GlobalKey<FormFieldState> key_1 = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [CompletedVisitsWidget()],
    );
  }
}
