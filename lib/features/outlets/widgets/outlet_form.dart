import 'package:flutter/material.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/constants/lists.dart';
import 'package:nettapp/core/widgets/outlined_container.dart';
import 'package:nettapp/core/widgets/text_widget.dart';
import 'package:nettapp/features/auth/widgets/blue_button_widget.dart';
import 'package:nettapp/features/outlets/widgets/drop_down_widget.dart';
import 'package:nettapp/features/outlets/widgets/form_header.dart';
import 'package:nettapp/features/outlets/widgets/form_input_field.dart';
import 'package:nettapp/features/outlets/widgets/show_alert.dart';

class OutletForm extends StatefulWidget {
  const OutletForm({super.key});

  @override
  State<OutletForm> createState() => _OutletFormState();
}

class _OutletFormState extends State<OutletForm> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FormHeaderWidget(title: "Register Outlet"),
            const Padding(
              padding: EdgeInsets.only(left: 15.0, top: 10),
              child: Row(
                children: [
                  TextWidget(
                    text: "'*'",
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextWidget(
                    text: "Mandatory fields",
                    fontSize: 12,
                    color: Color.fromARGB(255, 107, 106, 106),
                  ),
                ],
              ),
            ),
            FormInputFieldWidget(
                isMandatory: true,
                label: "Outlet name",
                hintText: "",
                onChanged: (val) {},
                textFieldkey: formfieldkey_1),
            FormInputFieldWidget(
                isMandatory: true,
                label: "Address",
                hintText: "",
                onChanged: (val) {},
                textFieldkey: formfieldkey_2),
            DropDownInput(
              isMandatory: true,
              onChanged: (val) {
                state = val.name;
                setState(() {});
              },
              label: "State",
              options: states(),
              enableSearch: true,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 4, top: 15, left: 22),
              child: TextWidget(
                text: "Region:",
                fontSize: 15,
                color: Color.fromARGB(255, 110, 111, 117),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.inputBorder),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 12),
                    child: TextWidget(text: getRegion(state))),
              ),
            ),
            DropDownInput(
              isMandatory: true,
              onChanged: (val) {
                city = val.name;
              },
              label: "City",
              enableSearch: true,
              options: cities(),
            ),
            DropDownInput(
                isMandatory: true,
                onChanged: (val) {
                  channel = val.name;
                },
                label: "Channel",
                options: channels),
            DropDownInput(
              isMandatory: true,
              onChanged: (val) {
                subChannel = val.name;
              },
              label: "Sub Channels",
              enableSearch: true,
              options: subChannels(),
            ),
            FormInputFieldWidget(
                isMandatory: false,
                label: "Name of Manager",
                hintText: "",
                onChanged: (val) {},
                textFieldkey: formfieldkey_3),
            FormInputFieldWidget(
                isMandatory: false,
                label: "Phone Number of Manager",
                hintText: "",
                onChanged: (val) {},
                textFieldkey: formfieldkey_4),
            FormInputFieldWidget(
                isMandatory: false,
                label: "Supplier(s)",
                hintText: "",
                onChanged: (val) {},
                textFieldkey: formfieldkey_5),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: BlueButtonWidget(
                  onTap: () {
                    showAlert(context);
                  },
                  label: "Register"),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
