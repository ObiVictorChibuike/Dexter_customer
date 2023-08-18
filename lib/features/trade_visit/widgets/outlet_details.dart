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
            label: "Address",
            value: "Multilinks, 19 Lewis Fadipe III Lane, Aja Lagos"),
        OutletDetailsRow(label: "State", value: "Lagos"),
        OutletDetailsRow(label: "Region", value: "South-West"),
        OutletDetailsRow(label: "City", value: "Lagos"),
        OutletDetailsRow(label: "Channel", value: "Off-Channel"),
        OutletDetailsRow(label: "Sub-Channel", value: "Supermarket"),
        OutletDetailsRow(label: "Name of Manager", value: "Mr Frank Ellis"),
        OutletDetailsRow(label: "Phone of Manager", value: "+2340932442231"),
      ],
    );
  }
}
