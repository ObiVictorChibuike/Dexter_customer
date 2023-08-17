import 'package:flutter/material.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/widgets/text_widget.dart';
import 'package:nettapp/features/auth/widgets/app_bar_row.dart';
import 'package:nettapp/features/auth/widgets/input_field_widget.dart';
import 'package:nettapp/features/outlets/widgets/outlet_item.dart';

class OutletsScreen extends StatelessWidget {
  const OutletsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: AppBarRow(),
          ),
          OutletList()
        ],
      ),
    );
  }
}

class OutletList extends StatefulWidget {
  const OutletList({super.key});

  @override
  State<OutletList> createState() => _OutletListState();
}

class _OutletListState extends State<OutletList> {
  final GlobalKey<FormFieldState> key_1 = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: InputFieldWidget(
              label: "",
              hintText: "Search for outlet",
              onChanged: (val) {},
              textFieldkey: key_1,
              fillColor: Colors.transparent,
              suffixIcon: Transform.scale(
                scale: .4,
                child: Image.asset(
                  "assets/images/search_icon.png",
                  width: 10,
                ),
              ),
              labelColor: Colors.black),
        ),
        const OutletsWidget()
      ],
    );
  }
}

class OutletsWidget extends StatelessWidget {
  const OutletsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          margin: const EdgeInsets.only(top: 50, bottom: 20),
          decoration: const BoxDecoration(color: AppColors.blue),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                text: "Outlet News",
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              TextWidget(
                text: "Last Visited",
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
        const OutletItem()
      ],
    );
  }
}
