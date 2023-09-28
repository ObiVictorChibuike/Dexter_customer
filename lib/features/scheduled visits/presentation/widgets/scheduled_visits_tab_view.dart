import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/widgets/text_widget.dart';
import 'package:nettapp/data/local_storage_data_model/outlets/local_storage_outlet_model.dart';
import 'package:nettapp/features/home/controller/home_controller.dart';
import 'package:nettapp/features/outlets/screens/outlet_trade_visit_details_screen.dart';
import 'package:nettapp/features/scheduled%20visits/controller/controller.dart';
import 'package:nettapp/features/trade_visit/screens/trade_visit_screen.dart';

class ScheduledOutletDayList extends StatefulWidget {
  final String daysOfTheWeek;
  final List<OutletRequestModelResponse> outletList;
  const ScheduledOutletDayList({super.key, required this.outletList, required this.daysOfTheWeek});

  @override
  State<ScheduledOutletDayList> createState() => _ScheduledOutletDayListState();
}

class _ScheduledOutletDayListState extends State<ScheduledOutletDayList> {

int? selectedIndex;
final _controller = Get.put(HomeController());
final _visitController = Get.put(VisitController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VisitController>(
      init: VisitController(),
        builder: (controller){
      return widget.outletList.isEmpty ? Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/empty_folder.png", width: 120, height: 120,),
            const SizedBox(height: 15,),
            Text("No Schedule Record", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),),
          ],
        ),
      ) :
      ListView(physics: const BouncingScrollPhysics(), padding: const EdgeInsets.all(0),
        children: [
          ...List.generate(widget.outletList.length, (index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: widget.outletList[index].name ?? "",
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(widget.outletList[index].address ?? "",  maxLines: 2, overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.white, fontSize: 14,),
                            ),
                          ],
                        ),

                        //Text(controller.buttonLabel[index], style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w300, color: index != 2 ? Colors.black : Colors.red),),
                        PopupMenuButton(
                          onSelected: (value) {
                            if(value.toString() == "1"){
                              Get.snackbar("Alert", "Under Construction and Pending on Schedule Visit", colorText: Colors.white, backgroundColor: Colors.green);
                            }else if(value.toString() == "2"){
                              // Navigator.push(Get.context!, MaterialPageRoute(builder: (context)=> TradeVisitFormScreen(outletRequestModelResponse: data,)));
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> TradeVisitFormScreen(outletRequestModelResponse: widget.outletList[index],)));
                            }else if(value.toString() == "3"){
                              if(widget.daysOfTheWeek == "MON"){
                                widget.outletList.removeAt(index);
                                _controller.saveAllMondaySchedule(mondaySchedule: widget.outletList);
                                _visitController.getOutletScheduleList();
                                setState(() {});
                                Get.snackbar("Success", "Delete Successful", colorText: Colors.white, backgroundColor: Colors.green);
                              }else if(widget.daysOfTheWeek  == "TUE"){
                                widget.outletList.removeAt(index);
                                _controller.saveAllTuesdaySchedule(tuesdaySchedule: widget.outletList);
                                _visitController.getOutletScheduleList();
                                setState(() {});
                                Get.snackbar("Success", "Delete Successful", colorText: Colors.white, backgroundColor: Colors.green);
                              }else if(widget.daysOfTheWeek  == "WED"){
                                widget.outletList.removeAt(index);
                                _controller.saveAllWednesdaySchedule(wednesdaySchedule: widget.outletList);
                                _visitController.getOutletScheduleList();
                                setState(() {});
                                Get.snackbar("Success", "Delete Successful", colorText: Colors.white, backgroundColor: Colors.green);
                              }else if(widget.daysOfTheWeek  == "THU"){
                                widget.outletList.removeAt(index);
                                _controller.saveAllThursdaySchedule(thursdaySchedule: widget.outletList);
                                _visitController.getOutletScheduleList();
                                setState(() {});
                                Get.snackbar("Success", "Delete Successful", colorText: Colors.white, backgroundColor: Colors.green);
                              }else if(widget.daysOfTheWeek  == "FRI"){
                                widget.outletList.removeAt(index);
                                _controller.saveAllFridaySchedule(fridaySchedule: widget.outletList);
                                _visitController.getOutletScheduleList();
                                setState(() {});
                                Get.snackbar("Success", "Delete Successful", colorText: Colors.white, backgroundColor: Colors.green);
                              }
                            }
                          },
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: const Icon(Icons.more_vert_outlined, size: 18, color: Colors.white,),
                          itemBuilder: (BuildContext bc) {
                            return [
                               PopupMenuItem(
                                value: '1',
                                child: Text("Reschedule this visit", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w300, color: Colors.black)),
                              ),
                               PopupMenuItem(
                                value: '2',
                                child: Text("Carry out a trade visit", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w300, color: Colors.black)),
                              ),
                               PopupMenuItem(
                                value: '3',
                                child: Text("Delete Visit", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w300, color: Colors.red)),
                              )
                            ];
                          },
                        )
                        // GetBuilder<VisitController>(
                        //     init: VisitController(),
                        //     builder: (controller){
                        //       return Column(
                        //         mainAxisAlignment: MainAxisAlignment.start,
                        //         children: [
                        //           PopupMenuButton(
                        //             onSelected: (value){
                        //               log("you clicked me");
                        //             },
                        //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        //             child: const Icon(Icons.more_vert_outlined, size: 18, color: Colors.white,),
                        //             itemBuilder: (context) {
                        //               return List.generate(controller.buttonLabel.length, (index) {
                        //                 return PopupMenuItem(
                        //                   child: Text(controller.buttonLabel[index],
                        //                   style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w300, color: index != 2 ? Colors.black : Colors.red),),
                        //                 );
                        //               });
                        //             },
                        //           ),
                        //           const SizedBox(
                        //             height: 25,
                        //           )
                        //         ],
                        //       );
                        //     })
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
          const SizedBox(height: 100,)
        ],
      );
    });
  }
}
