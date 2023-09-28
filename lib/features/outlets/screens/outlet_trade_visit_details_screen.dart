import 'package:flutter/material.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/data/local_storage_data_model/outlets/local_storage_outlet_model.dart';
import 'package:nettapp/features/auth/widgets/app_bar_row.dart';
import 'package:nettapp/features/auth/widgets/blue_button_widget.dart';
import 'package:nettapp/features/outlets/widgets/trade_visit_details_widget.dart';
import 'package:nettapp/features/trade_visit/widgets/outlet_details.dart';

class OutletTradeVisitDetailsScreen extends StatefulWidget {
  final OutletRequestModelResponse? outletRequestModelResponse;
  const OutletTradeVisitDetailsScreen({super.key, this.outletRequestModelResponse});

  @override
  State<OutletTradeVisitDetailsScreen> createState() => _OutletTradeVisitDetailsScreenState();
}

class _OutletTradeVisitDetailsScreenState extends State<OutletTradeVisitDetailsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  static const List<Tab> myTabs = <Tab>[
    Tab(
      text: "Outlet Details",
    ),
    Tab(text: "Trade Visits"),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const AppBarRow(),
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: AppColors.blue,
                    labelColor: Colors.black,
                    tabs: const [...myTabs],
                  ),
                ),
                SizedBox(
                  height: 500,
                  child: TabBarView(
                    controller: _tabController,
                    children: [OutletDetails(outletRequestModelResponse: widget.outletRequestModelResponse!,), TradeVisitDetailsWidget(outletRequestModelResponse: widget.outletRequestModelResponse!,)],
                  ),
                ),
                SizedBox(
                    width: 150,
                    height: 60,
                    child: BlueButtonWidget(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        label: "Back to Outlets"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
