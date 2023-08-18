import 'package:flutter/material.dart';
import 'package:nettapp/features/auth/widgets/app_bar_row.dart';
import 'package:nettapp/features/outlets/widgets/outlet_trade_visit_details_tabview.dart';

class OutletTradeVisitDetailsScreen extends StatelessWidget {
  const OutletTradeVisitDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: const [AppBarRow(), OutletTradeVisitDetailsTabView()],
      ),
    );
  }
}
