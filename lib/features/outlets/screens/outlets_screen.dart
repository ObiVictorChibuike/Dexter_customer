import 'dart:developer';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/constants/lists.dart';
import 'package:nettapp/core/widgets/outlined_container.dart';
import 'package:nettapp/core/widgets/text_widget.dart';
import 'package:nettapp/data/local_storage_data_model/channel/get_all_channel_response_model.dart';
import 'package:nettapp/data/local_storage_services/local_storage.dart';
import 'package:nettapp/features/auth/widgets/app_bar_row.dart';
import 'package:nettapp/features/auth/widgets/blue_button_widget.dart';
import 'package:nettapp/features/auth/widgets/input_field_widget.dart';
import 'package:nettapp/features/home/controller/home_controller.dart';
import 'package:nettapp/features/outlets/widgets/drop_down_widget.dart';
import 'package:nettapp/features/outlets/widgets/outlet_item.dart';
import 'outlet_trade_visit_details_screen.dart';

class OutletsScreen extends StatefulWidget {
  const OutletsScreen({super.key});

  @override
  State<OutletsScreen> createState() => _OutletsScreenState();
}

class _OutletsScreenState extends State<OutletsScreen> {
  final GlobalKey<FormFieldState> key_1 = GlobalKey<FormFieldState>();
  TextEditingController query = TextEditingController();
  final _controller = Get.put(HomeController());
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
    _controller.getAllOutletList();

    super.initState();
  }

  void showFilter({required BuildContext context, required void Function() onTap}) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.6,
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: Column(
                children: [
                  const Flexible(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  OutlinedContainer(
                    content: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DropDownInput(
                            isMandatory: false,
                            onChanged: (val) {
                              _controller.city = val.name;
                            },
                            label: "Filter by City:",
                            enableSearch: true,
                            options: cities == [] ? [] : cities.map((e) => DropDownValueModel(name: e, value: e)).toList(),
                          ),
                          DropDownInput(
                              isMandatory: false,
                              onChanged: (val) async {
                                _controller.channel = val.name;
                                if(_controller.channel == "On trade"){
                                  final data = await LocalCachedData.instance.getAllChannelList();
                                  subChannel = data.where((e) => e.channel!.toLowerCase() == "on trade").toList();
                                  setState(() {});
                                }else if(_controller.channel == "Off trade"){
                                  final data = await LocalCachedData.instance.getAllChannelList();
                                  subChannel = data.where((e) => e.channel!.toLowerCase() == "off trade").toList();
                                  setState(() {});
                                }
                              },
                              label: "Filter by Channel:",
                              options: channels
                          ),
                          DropDownInput(
                            isMandatory: false,
                            onChanged: (val) {
                              _controller.subChannel = val.value.toString();
                            },
                            label: "Filter by Sub Channels:",
                            enableSearch: true,
                            options:  subChannel == [] ? [] : subChannel!.map((e) => DropDownValueModel(name: e.subChannel!, value: e.subChannel)).toList(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: BlueButtonWidget(
                                onTap: onTap,
                                label: "Filter"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:  [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: AppBarRow(),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: InputFieldWidget(
                    controller: query,
                    label: "",
                    hintText: "Search for outlet",
                    onChanged: (val) async {
                      if(query.text.isEmpty){
                        _controller.createdOutletList = await LocalCachedData.instance.getAllCreatedOutletList();
                        _controller.pendingOutletList = await LocalCachedData.instance.getAllPendingOutletList();
                        setState(() {});
                      }else{
                        final outlet = _controller.createdOutletList.where((restaurants){
                          final nameLowerCase = restaurants.name!.toLowerCase();
                          final queryLowerCase = query.text.toLowerCase();
                          return nameLowerCase.contains(queryLowerCase);
                        }).toList();
                        setState(() {
                          _controller.createdOutletList = outlet;
                        });
                        final pendingOutlet = _controller.pendingOutletList.where((restaurants){
                          final nameLowerCase = restaurants.name!.toLowerCase();
                          final queryLowerCase = query.text.toLowerCase();
                          log(queryLowerCase);
                          log(nameLowerCase);
                          return nameLowerCase.contains(queryLowerCase);
                        }).toList();
                        setState(() {
                          _controller.pendingOutletList = pendingOutlet;
                        });
                      }
                    },
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
              GetBuilder<HomeController>(
                  init: HomeController(),
                  builder: (controller){
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                          margin: const EdgeInsets.only(top: 50, bottom: 20),
                          decoration: const BoxDecoration(color: AppColors.blue),
                          child:  const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextWidget(
                                text: "Outlet Name",
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              TextWidget(
                                text: "Last Visited",
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                        controller.createdOutletList.isEmpty  && controller.pendingOutletList.isEmpty?
                        Center(
                          child: Column(
                            children: [
                              const SizedBox(height: 30,),
                              Image.asset("assets/images/empty_folder.png", width: 120, height: 120,),
                              const SizedBox(height: 15,),
                              Text("No Outlet Record", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),),
                            ],
                          ),
                        ) :
                        Column(
                          children: [
                            ...List.generate(controller.createdOutletList.length, (index){
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> OutletTradeVisitDetailsScreen(outletRequestModelResponse: controller.createdOutletList[index],)));
                                },
                                child: OutletItem(
                                  outletRequestModelResponse: controller.createdOutletList[index],
                                ),
                              );
                            }),
                            ...List.generate(controller.pendingOutletList.length, (index){
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> OutletTradeVisitDetailsScreen(outletRequestModelResponse: controller.pendingOutletList[index],)));
                                },
                                child: OutletItem(
                                  outletRequestModelResponse: controller.pendingOutletList[index],
                                ),
                              );
                            }),
                          ],
                        )
                      ],
                    );
                  })
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blue,
        child: const Icon(
          Icons.filter_list,
          size: 30,
        ),
        onPressed: () {
          showFilter(
              context: context,
            onTap: () async {
                if(_controller.city != null){
                  await LocalCachedData.instance.getAllCreatedOutletList().then((value){
                    _controller.createdOutletList = value.where((element) => element.city?.toLowerCase() == _controller.city?.toLowerCase()).toList();
                    setState(() {});
                    Navigator.of(context).pop();
                  });
                  await LocalCachedData.instance.getAllPendingOutletList().then((value){
                    _controller.pendingOutletList = value.where((element) => element.city?.toLowerCase() == _controller.city?.toLowerCase()).toList();
                    setState(() {});
                    Navigator.of(context).pop();
                  });
                }else if(_controller.channel != null){
                  await LocalCachedData.instance.getAllCreatedOutletList().then((value){
                    _controller.createdOutletList = value.where((element) => element.channel?.toLowerCase() == _controller.channel?.toLowerCase()).toList();
                    setState(() {});
                    Navigator.of(context).pop();
                  });
                  await LocalCachedData.instance.getAllPendingOutletList().then((value){
                    _controller.pendingOutletList = value.where((element) => element.channel?.toLowerCase() == _controller.channel?.toLowerCase()).toList();
                    setState(() {});
                    Navigator.of(context).pop();
                  });
                }else if(_controller.subChannel != null){
                  await LocalCachedData.instance.getAllCreatedOutletList().then((value){
                    _controller.createdOutletList = value.where((element) => element.subChannel?.toLowerCase() == _controller.subChannel?.toLowerCase()).toList();
                    setState(() {});
                    Navigator.of(context).pop();
                  });
                  await LocalCachedData.instance.getAllPendingOutletList().then((value){
                    _controller.pendingOutletList = value.where((element) => element.subChannel?.toLowerCase() == _controller.subChannel?.toLowerCase()).toList();
                    setState(() {});
                    Navigator.of(context).pop();
                  });
                }else if(_controller.city != null && _controller.channel != null){
                  await LocalCachedData.instance.getAllCreatedOutletList().then((value){
                    _controller.createdOutletList = value.where((element) => element.channel?.toLowerCase() == _controller.channel?.toLowerCase() && element.city?.toLowerCase() == _controller.city?.toLowerCase()).toList();
                    setState(() {});
                    Navigator.of(context).pop();
                  });
                  await LocalCachedData.instance.getAllPendingOutletList().then((value){
                    _controller.pendingOutletList = value.where((element) => element.channel?.toLowerCase() == _controller.channel?.toLowerCase() && element.city?.toLowerCase() == _controller.city?.toLowerCase()).toList();
                    setState(() {});
                    Navigator.of(context).pop();
                  });
                }else if(_controller.city != null && _controller.subChannel != null){
                  await LocalCachedData.instance.getAllCreatedOutletList().then((value){
                    _controller.createdOutletList = value.where((element) => element.subChannel?.toLowerCase() == _controller.subChannel?.toLowerCase() && element.city?.toLowerCase() == _controller.city?.toLowerCase()).toList();
                    setState(() {});
                    Navigator.of(context).pop();
                  });
                  await LocalCachedData.instance.getAllPendingOutletList().then((value){
                    _controller.pendingOutletList = value.where((element) => element.subChannel?.toLowerCase() == _controller.subChannel?.toLowerCase() && element.city?.toLowerCase() == _controller.city?.toLowerCase()).toList();
                    setState(() {});
                    Navigator.of(context).pop();
                  });
                }else if(_controller.subChannel != null && _controller.channel != null){
                  await LocalCachedData.instance.getAllCreatedOutletList().then((value){
                    _controller.createdOutletList = value.where((element) => element.subChannel?.toLowerCase() == _controller.subChannel?.toLowerCase() && element.channel?.toLowerCase() == _controller.channel?.toLowerCase()).toList();
                    setState(() {});
                    Navigator.of(context).pop();
                  });
                  await LocalCachedData.instance.getAllPendingOutletList().then((value){
                    _controller.pendingOutletList = value.where((element) => element.subChannel?.toLowerCase() == _controller.subChannel?.toLowerCase() && element.channel?.toLowerCase() == _controller.channel?.toLowerCase()).toList();
                    setState(() {});
                    Navigator.of(context).pop();
                  });
                }else if(_controller.subChannel != null && _controller.channel != null && _controller.city != null){
                  await LocalCachedData.instance.getAllCreatedOutletList().then((value){
                    _controller.createdOutletList = value.where((element) => element.subChannel?.toLowerCase() == _controller.subChannel?.toLowerCase() && element.channel?.toLowerCase() == _controller.channel?.toLowerCase() && element.city?.toLowerCase() == _controller.city?.toLowerCase()).toList();
                    setState(() {});
                    Navigator.of(context).pop();
                  });
                  await LocalCachedData.instance.getAllPendingOutletList().then((value){
                    _controller.pendingOutletList = value.where((element) => element.subChannel?.toLowerCase() == _controller.subChannel?.toLowerCase() && element.channel?.toLowerCase() == _controller.channel?.toLowerCase() && element.city?.toLowerCase() == _controller.city?.toLowerCase()).toList();
                    setState(() {});
                    Navigator.of(context).pop();
                  });
                }
            }
          );
        },
      ),
    );
  }
}
