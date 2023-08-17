import 'package:flutter/material.dart';
import 'package:nettapp/features/auth/widgets/app_bar_row.dart';
import 'package:nettapp/features/trade_visit/widgets/trade_visit_form.dart';

class TradeVisitFormScreen extends StatelessWidget {
  const TradeVisitFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: const [AppBarRow(), TradeVisitForm()],
      ),
    );
  }
}
