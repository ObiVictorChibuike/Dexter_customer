import 'dart:developer';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/constants/lists.dart';
import 'package:nettapp/core/widgets/outlined_container.dart';
import 'package:nettapp/core/widgets/text_widget.dart';
import 'package:nettapp/data/local_storage_data_model/channel/get_all_channel_response_model.dart';
import 'package:nettapp/data/local_storage_services/local_storage.dart';
import 'package:nettapp/features/auth/widgets/blue_button_widget.dart';
import 'package:nettapp/features/home/controller/home_controller.dart';
import 'package:nettapp/features/outlets/widgets/drop_down_widget.dart';
import 'package:nettapp/features/outlets/widgets/form_header.dart';
import 'package:nettapp/features/outlets/widgets/form_input_field.dart';
import 'package:nettapp/features/trade_visit/widgets/loader.dart';

class OutletForm extends StatefulWidget {
  const OutletForm({super.key});

  @override
  State<OutletForm> createState() => _OutletFormState();
}

class _OutletFormState extends State<OutletForm> {
  final formKey = GlobalKey <FormState>();
  List<GetAllChannelResponseModel>? subChannel = <GetAllChannelResponseModel>[];
  List<String> states = <String>[];
  List<String> cities = <String>[];
  void getState()async{
    final location = await LocalCachedData.instance.getAllLocationList();
    states = location.map((e) => e.state!).toSet().toList();
    setState(() {});
  }
  void getCities()async{
    final location = await LocalCachedData.instance.getAllLocationList();
    cities = location.map((e) => e.city!).toSet().toList();
    if(cities.isEmpty){
      log("Message");
    }else{
      log("Ahh");
    }
    setState(() {});
  }


  @override
  void initState() {
    getState();
    getCities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
        builder: (controller){
      return OutlinedContainer(
        content: Form(
          key: formKey,
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
                  hintText: "", validator: (value){
                    if(value!.isEmpty){
                      return "This field is required";
                    }
                    return null;
                    },
                  onChanged: (val) {
                    controller.name = val;
                  },
              ),
              FormInputFieldWidget(
                  isMandatory: true,
                  label: "Address",
                  hintText: "", validator: (value){
                    if(value!.isEmpty){
                      return "This field is required";
                    }
                    return null;
                    },
                  onChanged: (val) {
                    controller.address = val;
                  },
              ),
              DropDownInput(
                isMandatory: true,
                onChanged: (val)  async{
                  controller.state = val.value.toString();
                 await LocalCachedData.instance.getAllLocationList().then((value){
                    setState(() {
                      final index = value.indexWhere((element) => element.state!.toLowerCase() == val.value.toString().toLowerCase());
                      controller.region = value[index].region ?? "";
                      log(controller.region.toString());
                    });
                  });
                },
                label: "State",
                options: states == [] ? [] : states.map((e) => DropDownValueModel(name: e.toString(), value: e.toString())).toList(),
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
                      child: TextWidget(text: controller.region
                      )),
                ),
              ),
              DropDownInput(
                isMandatory: true,
                onChanged: (val) {
                  controller.city = val.value;
                },
                label: "City",
                enableSearch: true,
                options: cities == [] ? [] : cities.map((e) => DropDownValueModel(name: e, value: e)).toList(),
              ),
              DropDownInput(
                  isMandatory: true,
                  onChanged: (val) async {
                    controller.channel = val.value;
                    if(controller.channel == "On trade"){
                      final data = await LocalCachedData.instance.getAllChannelList();
                      subChannel = data.where((e) => e.channel!.toLowerCase() == "on trade").toList();
                      setState(() {});
                    }else if(controller.channel == "Off trade"){
                      final data = await LocalCachedData.instance.getAllChannelList();
                       subChannel = data.where((e) => e.channel!.toLowerCase() == "off trade").toList();
                      setState(() {});
                    }
                  },
                  label: "Channel",
                  options: channels
              ),
              DropDownInput(
                isMandatory: true,
                onChanged: (val) {
                  controller.subChannel = val.value;
                  setState(() {});
                },
                label: "Sub Channels",
                enableSearch: true,
                options: subChannel == [] ? [] : subChannel!.map((e) => DropDownValueModel(name: e.subChannel!, value: e.subChannel)).toList() ,
              ),
              FormInputFieldWidget(
                  isMandatory: false,
                  label: "Name of Manager",
                  hintText: "", validator: (value){
                    if(value!.isEmpty){
                      return "This field is required";
                    }
                    return null;
                    },
                  onChanged: (val) {
                    controller.managerName = val;
                  },
              ),
              FormInputFieldWidget(
                  isMandatory: false,
                  label: "Phone Number of Manager",
                  hintText: "", validator: (value){
                    if(value!.isEmpty){
                      return "This field is required";
                    }return null;
                    },
                  onChanged: (val) {
                    controller.managerPhoneNumber = val;
                  },
              ),
              FormInputFieldWidget(
                  isMandatory: false,
                  label: "Supplier(s)",
                  hintText: "", validator: (value){
                if(value!.isEmpty){
                  return "This field is required";
                }return null;
              },
                onChanged: (val) {
                  controller.supplierName = val;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: BlueButtonWidget(
                    onTap: () async {
                      final outletList = await LocalCachedData.instance.getAllPendingOutletList();
                      final list = outletList.map((element) => element.name?.toLowerCase()).toList();
                      if(controller.name != null && controller.name != "" && list.contains(controller.name!.toLowerCase())){
                        Get.snackbar("Error", "Outlet already exist", backgroundColor: Colors.red, colorText: Colors.white);
                      }else if(controller.name != null && controller.name != "" && !list.contains(controller.name!.toLowerCase())){
                        if(controller.region == ""){
                          Get.snackbar("Error", "Please select a state and region", colorText: AppColors.white, backgroundColor: Colors.red);
                        } else{
                          if(formKey.currentState!.validate()){
                            Loader.progressIndicator(Get.context);
                            Future.delayed(const Duration(seconds: 5), () async {
                              await controller.createOutlet(region: controller.region);
                            });
                          }
                        }
                      }
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
    });
  }
}
