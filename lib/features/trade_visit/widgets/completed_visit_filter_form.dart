import 'package:flutter/material.dart';
import 'package:nettapp/core/constants/lists.dart';
import 'package:nettapp/core/widgets/outlined_container.dart';
import 'package:nettapp/features/auth/widgets/blue_button_widget.dart';
import 'package:nettapp/features/outlets/widgets/drop_down_widget.dart';
import 'package:nettapp/features/outlets/widgets/form_input_field.dart';

class CompletedVisitsFilterForm extends StatefulWidget {
  const CompletedVisitsFilterForm({super.key});

  @override
  State<CompletedVisitsFilterForm> createState() =>
      _CompletedVisitsFilterFormState();
}

class _CompletedVisitsFilterFormState extends State<CompletedVisitsFilterForm> {
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
            FormInputFieldWidget(
                label: "Filter by Outlet",
                hintText: '',
                onChanged: (val) {},
                textFieldkey: formfieldkey_1,
                isMandatory: false),
            DropDownInput(
                isMandatory: false,
                onChanged: (val) {
                  channel = val.name;
                },
                enableSearch: true,
                label: "Filter by Month:",
                options: getMonths()),
            DropDownInput(
              isMandatory: false,
              onChanged: (val) {
                subChannel = val.name;
              },
              label: "Filter by Day:",
              enableSearch: true,
              options: getDaysOfMonth(),
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
