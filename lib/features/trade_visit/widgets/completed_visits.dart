import 'package:flutter/material.dart';
import 'package:nettapp/features/auth/widgets/input_field_widget.dart';
import 'package:nettapp/features/outlets/widgets/outlets_widget.dart';

class CompletedVisitsList extends StatefulWidget {
  const CompletedVisitsList({super.key});

  @override
  State<CompletedVisitsList> createState() => _OutletListState();
}

class _OutletListState extends State<CompletedVisitsList> {
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
