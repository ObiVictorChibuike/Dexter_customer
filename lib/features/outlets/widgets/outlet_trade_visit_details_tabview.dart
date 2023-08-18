import 'package:flutter/material.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/features/auth/widgets/blue_button_widget.dart';
import 'package:nettapp/features/outlets/widgets/trade_visit_details_widget.dart';
import 'package:nettapp/features/trade_visit/widgets/outlet_details.dart';
import 'package:nettapp/features/trade_visit/widgets/outlet_details_row.dart';

class OutletTradeVisitDetailsTabView extends StatefulWidget {
  const OutletTradeVisitDetailsTabView({super.key});

  @override
  State<OutletTradeVisitDetailsTabView> createState() =>
      _OutletTradeVisitDetailsTabViewState();
}

class _OutletTradeVisitDetailsTabViewState
    extends State<OutletTradeVisitDetailsTabView>
    with SingleTickerProviderStateMixin {
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
    return Form(
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
              children: const [OutletDetails(), TradeVisitDetailsWidget()],
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
    );
  }
}
