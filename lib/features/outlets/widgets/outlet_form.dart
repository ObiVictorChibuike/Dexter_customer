import 'package:flutter/material.dart';
import 'package:nettapp/core/constants/lists.dart';
import 'package:nettapp/core/widgets/outlined_container.dart';
import 'package:nettapp/features/outlets/widgets/drop_down_widget.dart';
import 'package:nettapp/features/outlets/widgets/form_input_field.dart';

class OutletForm extends StatelessWidget {
  const OutletForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [],
      ),
    );
  }
}

class OutletDetailsForm extends StatefulWidget {
  const OutletDetailsForm({
    super.key,
  });

  @override
  State<OutletDetailsForm> createState() => _OutletDetailsFormState();
}

class _OutletDetailsFormState extends State<OutletDetailsForm> {
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

  // void createOutlet() {
  //   final outlet = ref.watch(outletProvider.notifier);
  //   outlet.createOutlet(
  //       date: DateFormat.yMMMMd().format(DateTime.now()),
  //       capturedBy: widget.data["capturedBy"],
  //       latitude: widget.data["latitude"],
  //       longitude: widget.data["longitude"],
  //       name: formfieldkey_1.currentState?.value,
  //       managerName: formfieldkey_3.currentState?.value,
  //       managerPhoneNumber: formfieldkey_4.currentState?.value,
  //       supplier: formfieldkey_5.currentState?.value,
  //       address: formfieldkey_2.currentState?.value,
  //       stateCity: state!,
  //       city: city!,
  //       region: region!,
  //       channel: channel!,
  //       subChannel: subChannel!);
  //   widget.controller.animateTo(1,
  //       duration: const Duration(seconds: 1), curve: Curves.bounceIn);
  // }

  @override
  Widget build(BuildContext context) {
    return OutlinedContainer(
      content: Form(
        child: Column(
          children: [
            FormInputFieldWidget(
                label: "Outlet name",
                hintText: "",
                onChanged: (val) {},
                textFieldkey: formfieldkey_1),
            FormInputFieldWidget(
                label: "Address",
                hintText: "",
                onChanged: (val) {},
                textFieldkey: formfieldkey_2),
            DropDownInput(
              onChanged: (val) {
                state = val.name;
              },
              label: "State",
              options: states(),
              enableSearch: true,
            ),
            DropDownInput(
              onChanged: (val) {
                city = val.name;
              },
              label: "City",
              enableSearch: true,
              options: cities(),
            ),
            DropDownInput(
              onChanged: (val) {
                region = val.name;
              },
              label: "Region",
              enableSearch: true,
              options: regions(),
            ),
            DropDownInput(
                onChanged: (val) {
                  channel = val.name;
                },
                label: "Channel",
                options: channels),
            DropDownInput(
              onChanged: (val) {
                subChannel = val.name;
              },
              label: "Sub Channels",
              enableSearch: true,
              options: subChannels(),
            ),
            FormInputFieldWidget(
                label: "Name of Manager",
                hintText: "",
                onChanged: (val) {},
                textFieldkey: formfieldkey_3),
            FormInputFieldWidget(
                label: "Phone Number of Manager",
                hintText: "",
                onChanged: (val) {},
                textFieldkey: formfieldkey_4),
            FormInputFieldWidget(
                label: "Supplier(s)",
                hintText: "",
                onChanged: (val) {},
                textFieldkey: formfieldkey_5),
            const SizedBox(
              height: 20,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(bottom: 10.0),
            //   child: Container(
            //     width: 272,
            //     height: 50,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(5),
            //       border: Border.all(color: AppColors.inputBorder),
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: ElevatedButton(
            //         style: const ButtonStyle(
            //           backgroundColor: MaterialStatePropertyAll(
            //             Color.fromARGB(255, 0, 44, 139),
            //           ),
            //         ),
            //         onPressed: () async {
            //           // createOutlet();
            //         },
            //         child: const TextWidget(
            //           text: "Next",
            //           color: AppColors.white,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
