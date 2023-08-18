import 'package:flutter/material.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/widgets/outlined_container.dart';
import 'package:nettapp/features/outlets/widgets/form_header.dart';
import 'package:nettapp/features/trade_visit/widgets/outlet_details.dart';
import 'package:nettapp/features/trade_visit/widgets/product_details_form.dart';

class TradeVisitTabView extends StatefulWidget {
  const TradeVisitTabView({super.key});

  @override
  State<TradeVisitTabView> createState() => _TradeVisitTabViewState();
}

class _TradeVisitTabViewState extends State<TradeVisitTabView>
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
    return OutlinedContainer(
      content: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FormHeaderWidget(title: "Trade Visit Form"),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
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
                children: const [
                  OutletDetails(),
                  ProductDetailsForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
