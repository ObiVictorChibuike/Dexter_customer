import 'package:flutter/material.dart';
import 'package:nettapp/features/trade_visit/widgets/outlet_details_row.dart';

class OutletDetails extends StatelessWidget {
  const OutletDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        OutletDetailsRow(label: "Outlet name", value: "Wines et al"),
        OutletDetailsRow(
            label: "Outlet name",
            value: "Multilinks, 19 Lewis Fadipe III Lane, Aja Lagos"),
        OutletDetailsRow(label: "Outlet name", value: "Wines et al"),
        OutletDetailsRow(label: "Outlet name", value: "Wines et al"),
        OutletDetailsRow(label: "Outlet name", value: "Wines et al"),
        OutletDetailsRow(label: "Outlet name", value: "Wines et al"),
        OutletDetailsRow(label: "Outlet name", value: "Wines et al")
      ],
    );
  }
}
