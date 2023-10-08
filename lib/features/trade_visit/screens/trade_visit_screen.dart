import 'package:flutter/material.dart';
import 'package:nettapp/data/local_storage_data_model/outlets/local_storage_outlet_model.dart';
import 'package:nettapp/features/auth/widgets/app_bar_row.dart';
import 'package:nettapp/features/trade_visit/widgets/trade_visit_tab_view.dart';

class TradeVisitFormScreen extends StatelessWidget {
  final OutletRequestModelResponse outletRequestModelResponse;
  final String? dayOfTheWeek;
  final List<OutletRequestModelResponse>? outletList;
  const TradeVisitFormScreen({super.key, required this.outletRequestModelResponse, this.dayOfTheWeek, this.outletList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const AppBarRow(),
          TradeVisitTabView(outletRequestModelResponse: outletRequestModelResponse, dayOfTheWeek: dayOfTheWeek, outletList: outletList,)],
      ),
    );
  }
}
