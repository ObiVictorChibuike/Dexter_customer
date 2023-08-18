import 'package:flutter/material.dart';
import 'package:nettapp/config/router/routes.dart';

import 'package:nettapp/core/constants/lists.dart';
import 'package:nettapp/core/widgets/text_widget.dart';
import 'package:nettapp/features/auth/widgets/blue_button_widget.dart';
import 'package:nettapp/features/outlets/widgets/drop_down_widget.dart';
import 'package:nettapp/features/outlets/widgets/form_input_field.dart';
import 'package:nettapp/features/outlets/widgets/horizontal_line.dart';
import 'package:nettapp/features/trade_visit/widgets/outlet_details_row.dart';
import 'package:nettapp/features/trade_visit/widgets/yes_no_buttons.dart';

class ProductDetailsForm extends StatefulWidget {
  const ProductDetailsForm({
    super.key,
  });

  @override
  State<ProductDetailsForm> createState() => _ProductDetailsFormState();
}

class _ProductDetailsFormState extends State<ProductDetailsForm> {
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

  bool _isPriceChanged = false;
  bool _isNoSelected2 = false;

  bool _isAvailable = false;
  bool _isNoSelected3 = false;
  @override
  Widget build(BuildContext context) {
    // final product = ref.read(productsProvider.notifier);

    return Form(
      key: _formKey,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .7,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const OutletDetailsRow(
                  label: "Total time spent", value: "1:00:00"),
              const OutletDetailsRow(
                  label: "Outlet Name", value: "Wines et al"),
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const HorizontalDivider(width: 500),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: TextWidget(
                      text: "Enter details on relevant brands and products",
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const HorizontalDivider(width: 500),

                  DropDownInput(
                      isMandatory: true,
                      onChanged: (val) {
                        setState(() {
                          category = val.name.toString();
                        });
                      },
                      enableSearch: true,
                      label: "Category:",
                      options: theCategories()),

                  DropDownInput(
                      isMandatory: true,
                      onChanged: (val) {
                        setState(() {
                          brand = val.name.toString();
                        });
                      },
                      enableSearch: true,
                      label: "Brand:",
                      options: category == "Wines"
                          ? theWineBrandList()
                          : category == "Spirits"
                              ? theSpiritBrandList()
                              : theFoodBrandList()),
                  DropDownInput(
                      isMandatory: true,
                      onChanged: (val) {
                        setState(() {
                          sku = val.name.toString();
                        });
                      },
                      enableSearch: true,
                      label: "Sku:",
                      options: category == "Wines"
                          ? theWines()
                          : category == "Spirits"
                              ? theSpirits()
                              : thefoods()),

                  YesNoRadioButtons(
                    label: "Is this brand available?",
                    groupValueYes: _isAvailable,
                    groupValueNo: _isNoSelected3,
                    radioLabel1: "In stock",
                    radioLabel2: "Out of stock",
                    onChangedYes: (value) {
                      setState(() {
                        _isAvailable = value ?? false;
                        _isNoSelected3 = !_isAvailable;
                      });
                    },
                    onChangedNo: (value) {
                      setState(() {
                        _isNoSelected3 = value ?? false;
                        _isAvailable = !_isNoSelected3;
                      });
                    },
                  ),

                  YesNoRadioButtons(
                    label: "Is it a new listing?",
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
                      label: "What is it's price?",
                      hintText: "",
                      onChanged: (val) {},
                      textFieldkey: formfieldkey_1),

                  YesNoRadioButtons(
                    label: "Has it's price changed?",
                    groupValueYes: _isPriceChanged,
                    groupValueNo: _isNoSelected2,
                    onChangedYes: (value) {
                      setState(() {
                        _isPriceChanged = value ?? false;
                        _isNoSelected2 = !_isPriceChanged;
                      });
                    },
                    onChangedNo: (value) {
                      setState(() {
                        _isNoSelected2 = value ?? false;
                        _isPriceChanged = !_isNoSelected2;
                      });
                    },
                  ),

                  _isPriceChanged
                      ? FormInputFieldWidget(
                          isMandatory: true,
                          label: "What is it's new price?",
                          hintText: "",
                          onChanged: (val) {},
                          textFieldkey: formfieldkey_2)
                      : const Text(""),
                  const SizedBox(
                    height: 20,
                  ),
                  // const TextWidget(

                  Column(
                    children: [
                      BlueButtonWidget(
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.productsListScreen);
                          },
                          label: "Save")
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
