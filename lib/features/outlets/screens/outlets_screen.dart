import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/constants/lists.dart';
import 'package:nettapp/core/widgets/outlined_container.dart';
import 'package:nettapp/core/widgets/text_widget.dart';
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
  String? city;
  String? channel;
  String? subChannel;
  @override
  void initState() {
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
                        controller.createdOutletList.isEmpty ?
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
                if(city != null){
                  await LocalCachedData.instance.getAllCreatedOutletList().then((value){
                    _controller.createdOutletList = value.where((element) => element.city == city).toList();
                    setState(() {});
                    Navigator.of(context).pop();
                  });
                }else if(channel != null){
                  await LocalCachedData.instance.getAllCreatedOutletList().then((value){
                    _controller.createdOutletList = value.where((element) => element.channel == channel).toList();
                    setState(() {});
                    Navigator.of(context).pop();
                  });
                }else if(subChannel != null){
                  await LocalCachedData.instance.getAllCreatedOutletList().then((value){
                    _controller.createdOutletList = value.where((element) => element.subChannel == subChannel).toList();
                    setState(() {});
                    Navigator.of(context).pop();
                  });
                }else if(city != null && channel != null){
                  await LocalCachedData.instance.getAllCreatedOutletList().then((value){
                    _controller.createdOutletList = value.where((element) => element.channel == channel && element.city == city).toList();
                    setState(() {});
                    Navigator.of(context).pop();
                  });
                }else if(city != null && subChannel != null){
                  await LocalCachedData.instance.getAllCreatedOutletList().then((value){
                    _controller.createdOutletList = value.where((element) => element.subChannel == subChannel && element.city == city).toList();
                    setState(() {});
                    Navigator.of(context).pop();
                  });
                }else if(subChannel != null && channel != null){
                  await LocalCachedData.instance.getAllCreatedOutletList().then((value){
                    _controller.createdOutletList = value.where((element) => element.subChannel == subChannel && element.channel == channel).toList();
                    setState(() {});
                    Navigator.of(context).pop();
                  });
                }else if(subChannel != null && channel != null && city != null){
                  await LocalCachedData.instance.getAllCreatedOutletList().then((value){
                    _controller.createdOutletList = value.where((element) => element.subChannel == subChannel && element.channel == channel && element.city == city).toList();
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
