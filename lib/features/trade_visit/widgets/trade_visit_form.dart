import 'package:flutter/material.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/widgets/outlined_container.dart';
import 'package:nettapp/features/outlets/widgets/form_header.dart';

class TradeVisitForm extends StatefulWidget {
  const TradeVisitForm({super.key});

  @override
  State<TradeVisitForm> createState() => _TradeVisitFormState();
}

class _TradeVisitFormState extends State<TradeVisitForm>
    with SingleTickerProviderStateMixin {
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  final formfieldkey_2 = GlobalKey<FormFieldState>();
  final formfieldkey_3 = GlobalKey<FormFieldState>();
  final formfieldkey_4 = GlobalKey<FormFieldState>();
  final formfieldkey_5 = GlobalKey<FormFieldState>();
  String? state;
  String? city;
  String? channel;
  String? region;
  String? subChannel;

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
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
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
                  Icon(Icons.directions_car),
                  Icon(Icons.directions_transit),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
