import 'package:flutter/material.dart';
import 'package:nettapp/core/widgets/outlined_container.dart';
import 'package:nettapp/features/auth/widgets/blue_button_widget.dart';
import 'package:nettapp/features/outlets/widgets/drop_down_widget.dart';

class FilterProductsForm extends StatefulWidget {
  const FilterProductsForm({super.key});

  @override
  State<FilterProductsForm> createState() => _FilterProductsFormState();
}

class _FilterProductsFormState extends State<FilterProductsForm> {
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

  @override
  Widget build(BuildContext context) {
    return OutlinedContainer(
      content: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropDownInput(
              isMandatory: false,
              onChanged: (val) {
                city = val.name;
              },
              label: "Filter by Category:",
              enableSearch: true,
              options: const [],
            ),
            DropDownInput(
                isMandatory: false,
                onChanged: (val) {
                  channel = val.name;
                },
                label: "Filter by Brand:",
                options: const []),
            DropDownInput(
              isMandatory: false,
              onChanged: (val) {
                subChannel = val.name;
              },
              label: "Filter by Outlet:",
              enableSearch: true,
              options: const [],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: BlueButtonWidget(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  label: "Filter"),
            ),
          ],
        ),
      ),
    );
  }
}
