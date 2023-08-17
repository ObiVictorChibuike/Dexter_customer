import 'package:flutter/material.dart';
import 'package:nettapp/features/trade_visit/widgets/outlet_details_row.dart';

class OutletDetails extends StatelessWidget {
  const OutletDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [OutletDetailsRow(label: "Outlet name", value: "Wines et al")],
    );
  }
}
