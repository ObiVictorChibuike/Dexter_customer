import 'package:flutter/material.dart';
import 'package:nettapp/config/router/routes.dart';
import 'package:nettapp/core/widgets/outlined_container.dart';
import 'package:nettapp/core/widgets/text_widget.dart';
import 'package:nettapp/features/auth/widgets/blue_button_widget.dart';
import 'package:nettapp/features/competition%20review/widgets/date_picker_button.dart';
import 'package:nettapp/features/outlets/widgets/form_header.dart';
import 'package:nettapp/features/outlets/widgets/form_input_field.dart';
import 'package:nettapp/features/trade_visit/widgets/yes_no_buttons.dart';

class CompetitionReviewForm extends StatefulWidget {
  const CompetitionReviewForm({
    super.key,
  });

  @override
  State<CompetitionReviewForm> createState() => _CompetitionReviewFormState();
}

class _CompetitionReviewFormState extends State<CompetitionReviewForm> {
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  final formfieldkey_2 = GlobalKey<FormFieldState>();
  final formfieldkey_3 = GlobalKey<FormFieldState>();
  final formfieldkey_4 = GlobalKey<FormFieldState>();
  final formfieldkey_5 = GlobalKey<FormFieldState>();
  final _formKey = GlobalKey<FormState>();

  String sku = "";
  String? brand;
  String? category = "";
  String? channel = "";
  double? price;
  double? newPrice;

  String? isAvailable;
  bool? isOutOfStock;
  bool? isNew;
  bool? hasPriceChanged;

  @override
  void initState() {
    super.initState();
  }

  bool _isNewListing = false;
  bool _isNoSelected1 = false;

  @override
  Widget build(BuildContext context) {
    // final product = ref.read(productsProvider.notifier);

    return OutlinedContainer(
      content: Form(
        key: _formKey,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .7,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const FormHeaderWidget(title: "Competition Review"),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0, top: 30, right: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextWidget(
                        text: "*",
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
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    FormInputFieldWidget(
                        isMandatory: true,
                        label: "What brand is activated?",
                        hintText: "",
                        onChanged: (val) {},
                        textFieldkey: formfieldkey_1),
                    FormInputFieldWidget(
                        isMandatory: true,
                        verticalContentPadding: 20,
                        label: "What is the activation?",
                        hintText: "",
                        maxLines: 3,
                        onChanged: (val) {},
                        textFieldkey: formfieldkey_2),
                    YesNoRadioButtons(
                      label: "Is there a promo running?",
                      groupValueYes: _isNewListing,
                      groupValueNo: _isNoSelected1,
                      onChangedYes: (value) {
                        setState(() {
                          _isNewListing = value ?? false;
                          _isNoSelected1 = !_isNewListing;
                        });
                      },
                      onChangedNo: (value) {
                        setState(() {
                          _isNoSelected1 = value ?? false;
                          _isNewListing = !_isNoSelected1;
                        });
                      },
                    ),
                    FormInputFieldWidget(
                        isMandatory: true,
                        label: "What is the mechanism of the promo?",
                        hintText: "",
                        maxLines: 3,
                        verticalContentPadding: 10,
                        onChanged: (val) {},
                        textFieldkey: formfieldkey_3),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 40),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TextWidget(
                                text: "Date of activation or promo",
                                color: Color.fromARGB(255, 110, 111, 117),
                                fontSize: 15,
                              ),
                              CustomButton(
                                label: "Select Date",
                                onTap: () {},
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    FormInputFieldWidget(
                        isMandatory: true,
                        label: "Any other information?",
                        hintText: "",
                        maxLines: 3,
                        verticalContentPadding: 10,
                        onChanged: (val) {},
                        textFieldkey: formfieldkey_4),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 30.0, left: 20, bottom: 20),
                      child: Row(
                        children: [
                          CustomButton(label: "Add an Image", onTap: () {}),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: BlueButtonWidget(
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.productsListScreen);
                          },
                          label: "Save"),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
