import 'package:flutter/material.dart';
import 'package:nettapp/data/local_storage_data_model/outlets/local_storage_outlet_model.dart';
import 'package:nettapp/features/trade_visit/widgets/outlet_details_row.dart';

class OutletDetails extends StatelessWidget {
  final OutletRequestModelResponse outletRequestModelResponse;
  const OutletDetails({super.key, required this.outletRequestModelResponse});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutletDetailsRow(label: "Outlet name", value: outletRequestModelResponse.name ?? ""),
        OutletDetailsRow(label: "Address", value: outletRequestModelResponse.address ?? ""),
        OutletDetailsRow(label: "State", value: outletRequestModelResponse.state ?? ""),
        OutletDetailsRow(label: "Region", value: outletRequestModelResponse.region ?? ""),
        OutletDetailsRow(label: "City", value: outletRequestModelResponse.city ?? ""),
        OutletDetailsRow(label: "Channel", value: outletRequestModelResponse.channel ?? ""),
        OutletDetailsRow(label: "Sub-Channel", value: outletRequestModelResponse.subChannel ?? ""),
        OutletDetailsRow(label: "Name of Manager", value: outletRequestModelResponse.managerName ?? ""),
        OutletDetailsRow(label: "Phone of Manager", value: outletRequestModelResponse.managerPhoneNumber ?? ""),
      ],
    );
  }
}
