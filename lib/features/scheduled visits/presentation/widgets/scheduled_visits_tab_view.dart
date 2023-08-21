import 'package:flutter/material.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/features/scheduled%20visits/presentation/widgets/scheduled_outlet_item.dart';

class ScheduledVisitTabView extends StatefulWidget {
  const ScheduledVisitTabView({super.key});

  @override
  State<ScheduledVisitTabView> createState() => _ScheduledVisitTabViewState();
}

class _ScheduledVisitTabViewState extends State<ScheduledVisitTabView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  static const List<Tab> myTabs = <Tab>[
    Tab(text: "MON"),
    Tab(text: "TUE"),
    Tab(text: "WED"),
    Tab(text: "THU"),
    Tab(text: "FRI"),
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
              children: const [
                ScheduledOutletDayList(),
                ScheduledOutletDayList(),
                ScheduledOutletDayList(),
                ScheduledOutletDayList(),
                ScheduledOutletDayList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ScheduledOutletDayList extends StatelessWidget {
  const ScheduledOutletDayList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        ScheduledOutletItem(
          onTap: () {},
          outletName: "Jendol",
          outletAddress: "20 Obanikoro Avenue,Lagos",
        ),
        ScheduledOutletItem(
          onTap: () {},
          outletName: "Jendol",
          outletAddress: "20 Obanikoro Avenue,Lagos",
        ),
        ScheduledOutletItem(
          onTap: () {},
          outletName: "Jendol",
          outletAddress: "20 Obanikoro Avenue,Lagos",
        ),
        ScheduledOutletItem(
          onTap: () {},
          outletName: "Jendol",
          outletAddress: "20 Obanikoro Avenue,Lagos",
        ),
        ScheduledOutletItem(
          onTap: () {},
          outletName: "Jendol",
          outletAddress: "20 Obanikoro Avenue,Lagos",
        ),
        ScheduledOutletItem(
          onTap: () {},
          outletName: "Jendol",
          outletAddress: "20 Obanikoro Avenue,Lagos",
        ),
      ],
    );
  }
}
