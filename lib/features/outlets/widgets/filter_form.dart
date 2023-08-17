import 'package:flutter/material.dart';
import 'package:nettapp/core/constants/lists.dart';
import 'package:nettapp/core/widgets/outlined_container.dart';
import 'package:nettapp/features/auth/widgets/blue_button_widget.dart';
import 'package:nettapp/features/outlets/widgets/drop_down_widget.dart';

class FilterForm extends StatefulWidget {
  const FilterForm({super.key});

  @override
  State<FilterForm> createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
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
              label: "Filter by City:",
              enableSearch: true,
              options: cities(),
            ),
            DropDownInput(
                isMandatory: false,
                onChanged: (val) {
                  channel = val.name;
                },
                label: "Filter by Channel:",
                options: channels),
            DropDownInput(
              isMandatory: false,
              onChanged: (val) {
                subChannel = val.name;
              },
              label: "Filter by Sub Channels:",
              enableSearch: true,
              options: subChannels(),
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
