import 'dart:async';
import 'dart:developer';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/widgets/text_widget.dart';
import 'package:nettapp/data/local_storage_data_model/outlets/local_storage_outlet_model.dart';
import 'package:nettapp/data/local_storage_services/local_storage.dart';
import 'package:nettapp/features/auth/widgets/blue_button_widget.dart';
import 'package:nettapp/features/outlets/widgets/drop_down_widget.dart';
import 'package:nettapp/features/outlets/widgets/form_input_field.dart';
import 'package:nettapp/features/outlets/widgets/horizontal_line.dart';
import 'package:nettapp/features/scheduled%20visits/controller/controller.dart';
import 'package:nettapp/features/trade_visit/widgets/outlet_details_row.dart';
import 'package:nettapp/features/trade_visit/widgets/yes_no_buttons.dart';
import 'package:uuid/uuid.dart';

import 'loader.dart';

class ProductDetailsForm extends StatefulWidget {
  final OutletRequestModelResponse? outletRequestModelResponse;
  const ProductDetailsForm({
    super.key, this.outletRequestModelResponse,
  });

  @override
  State<ProductDetailsForm> createState() => _ProductDetailsFormState();
}

class _ProductDetailsFormState extends State<ProductDetailsForm> {
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  final formfieldkey_2 = GlobalKey<FormFieldState>();
  final _formKey = GlobalKey<FormState>();

  String? sku;
  String? brand;
  String? category;
  List<String> brandList = <String>[];
  List<String> skuList = <String>[];
  String? channel;
  String? price;
  double? newPrice;
  bool? isOutOfStock;
  bool? isNew;
  bool? hasPriceChanged;
  final _controller = Get.find<VisitController>();
  @override
  void initState() {
    _controller.getAllCategoryList();
    startTimer();
    super.initState();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        if (seconds < 59) {
          seconds++;
        } else {
          seconds = 0;
          if (minutes < 59) {
            minutes++;
          } else {
            minutes = 0;
            hours++;
          }
        }
      });
    });
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  Uuid uuid = const Uuid();

  bool _isNewListing = false;
  bool _isNoSelected1 = false;

  bool _isPriceChanged = false;
  bool _isNoSelected2 = false;

  bool _isAvailable = false;
  bool _isNoSelected3 = false;

  String formatTime(int time) {
    return time.toString().padLeft(2, '0');
  }

  int hours = 0;
  int minutes = 0;
  int seconds = 0;
  Timer? timer;
  String? _newPrice;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VisitController>(
      init: VisitController(),
        builder: (controller){
      return Form(
        key: _formKey,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .7,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                OutletDetailsRow(label: "Total time spent", value: '${formatTime(hours)} : ${formatTime(minutes)} : ${formatTime(seconds)}'),
                OutletDetailsRow(label: "Outlet Name", value: widget.outletRequestModelResponse?.name ?? ""),
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
                            final list = controller.brandList.where((element) => element.category?.toLowerCase() == category?.toLowerCase()).toList();
                            brandList = list.map((e) => e.brand.toString()).toSet().toList();
                            skuList =  list.map((e) => e.skuList.toString()).toSet().toList();
                          });
                        },
                        enableSearch: true,
                        label: "Category:",
                        options: controller.categoryList.map((e) => DropDownValueModel(name: e, value: e)).toList()),

                    DropDownInput(
                        isMandatory: true,
                        onChanged: (val) {
                          setState(() {
                            brand = val.name.toString();
                          });
                        },
                        enableSearch: true,
                        label: "Brand:",
                        options: brandList.map((e) => DropDownValueModel(name: e, value: e)).toList()
                    ),
                    DropDownInput(
                        isMandatory: true,
                        onChanged: (val) {
                          setState(() {
                            sku = val.name.toString();
                          });
                        },
                        enableSearch: true,
                        label: "Sku:",
                        options: skuList.map((e) => DropDownValueModel(name: e, value: e)).toList()
                    ),

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
                        hintText: "", keyboardType: TextInputType.phone,
                        validator: (value){
                          if(value!.isEmpty){
                            return "This field is required";
                          }
                          return null;
                        },
                        onChanged: (val) {
                          price = val;
                        },
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
                        hintText: "", keyboardType: TextInputType.phone,
                        validator: (value){
                          if(value!.isEmpty){
                            return "This field is required";
                          }
                          return null;
                        },
                        onChanged: (val) {
                          _newPrice = val;
                        },
                        textFieldkey: formfieldkey_2)
                        : const Text(""),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        BlueButtonWidget(
                            onTap: () async {
                              final userCode = await LocalCachedData.instance.getUserCode();
                              if(_formKey.currentState!.validate()){
                                if(category == null || brand == null || sku == null){
                                  Get.snackbar("Error", "Kindly fill the form properly", colorText: AppColors.white, backgroundColor: Colors.red);
                                }else{
                                  Loader.progressIndicator(Get.context!);
                                  Future.delayed(const Duration(seconds: 5), (){
                                    controller.createTradeVisit(
                                      price: _isPriceChanged == true ? _newPrice.toString() : price.toString(),
                                      category: category.toString(),
                                      availability: _isAvailable == true ? "Yes" : "No",
                                      brand: brand.toString(),
                                      duration: formatTime(hours).toString() != "00" ?
                                      "${formatTime(hours)}hour" : formatTime(minutes).toString() != "00" ?
                                      "${formatTime(minutes)}minutes" : formatTime(seconds).toString() != "00" ?
                                      "${formatTime(seconds)}seconds" : "00seconds",
                                      listing: _isNewListing == true ? "Yes" : "No",
                                      outletCode: widget.outletRequestModelResponse?.outletCode ?? "",
                                      priceChange: _isPriceChanged == true ? "Yes" : "No",
                                      sku: sku.toString(),
                                      userCode: userCode!,
                                      visitCode: uuid.v4(),
                                      outletName: widget.outletRequestModelResponse?.name ?? "",
                                    );
                                  });
                                }
                              }
                            },
                            label: "Save")
                      ],
                    ),
                    const SizedBox(height: 50,)
                  ]),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
