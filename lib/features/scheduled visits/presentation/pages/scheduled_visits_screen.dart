import 'dart:developer';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/widgets/text_widget.dart';
import 'package:nettapp/features/auth/widgets/app_bar_row.dart';
import 'package:nettapp/features/home/controller/home_controller.dart';
import 'package:nettapp/features/outlets/widgets/drop_down_widget.dart';
import 'package:nettapp/features/outlets/widgets/form_header.dart';
import 'package:nettapp/features/scheduled%20visits/controller/controller.dart';
import 'package:nettapp/features/scheduled%20visits/presentation/widgets/add_visit_button.dart';
import 'package:nettapp/features/scheduled%20visits/presentation/widgets/scheduled_visits_tab_view.dart';

class ScheduledVisitsScreen extends StatefulWidget {
  const ScheduledVisitsScreen({super.key});

  @override
  State<ScheduledVisitsScreen> createState() => _ScheduledVisitsScreenState();
}

class _ScheduledVisitsScreenState extends State<ScheduledVisitsScreen> with TickerProviderStateMixin{
  final _controller = Get.put(HomeController());
  final _visitController = Get.put(VisitController());
  @override
  void initState() {
    _controller.getAllOutletList();
    _visitController.getOutletScheduleList();
    _tabController = TabController(vsync: this, length: myTabs.length);
    super.initState();
  }

  late DateTime _selectedDate = DateTime.now();
  final dateController = TextEditingController();
  String? dateTimeString;
  getDate(String date) {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(date);
    dateTimeString = inputFormat.parse(date).toString();
    var outputFormat = DateFormat('dd/MM/yyyy');
    return outputFormat.format(inputDate);
  }


  String? selectedOutletCode;
  String? daysOfWeek;
  showAddVisitAlert(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, update){
          selectDate(BuildContext context) async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime(_selectedDate.year, _selectedDate.month, _selectedDate.day),
              firstDate: DateTime(1900),
              lastDate: DateTime(2030),
              helpText: 'SCHEDULE VISIT DATE',
              confirmText: 'SELECT',
            );
            if (picked != null ) {
              update(() {
                final weekDay = picked.weekday;
                if(weekDay == 1 ){
                  daysOfWeek = "MON";
                }else if(weekDay == 2){
                  daysOfWeek = "TUE";
                }else if(weekDay == 3){
                  daysOfWeek = "WED";
                }else if(weekDay == 4){
                  daysOfWeek = "THU";
                }else if(weekDay == 5){
                  daysOfWeek = "FRI";
                }else if(weekDay == 6){
                  daysOfWeek = "SAT";
                }else if(weekDay == 7){
                  daysOfWeek = "SUN";
                }
                _selectedDate = picked;
                dateController.text = getDate(_selectedDate.toString());
              });
            }
          }
          return AlertDialog(
            backgroundColor: Colors.white,
            actions: <Widget>[
              TextButton(
                child: const TextWidget(
                  text: "Cancel",
                  fontSize: 20,
                  color: AppColors.blue,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const TextWidget(
                  text: "OK",
                  fontSize: 20,
                  color: AppColors.blue,
                ),
                onPressed: () {
                  if(_controller.createdOutletList.isEmpty || _controller.createdOutletList == []){
                    Get.snackbar("Notice", "Kindly add an outlet to schedule a visit", colorText: AppColors.white, backgroundColor: Colors.red);
                    Navigator.of(context).pop();
                  }else if(_controller.createdOutletList.isNotEmpty || _controller.createdOutletList != [] && daysOfWeek != null && selectedOutletCode != null){
                    final index = _controller.createdOutletList.indexWhere((element) => element.outletCode == selectedOutletCode.toString());
                    final value = _controller.createdOutletList[index];
                    if(daysOfWeek == "MON"){
                      _controller.outletsWithMondayScheduledVisit.add(value);
                      _controller.saveAllMondaySchedule(mondaySchedule: _controller.outletsWithMondayScheduledVisit);
                      _visitController.getOutletScheduleList();
                      dateController.clear();
                      update(() {});
                      Navigator.of(context).pop();
                      Get.snackbar("Success", "Schedule request successful", colorText: AppColors.white, backgroundColor: Colors.green);
                    }else if(daysOfWeek == "TUE"){
                      _controller.outletsWithTuesdayScheduledVisit.add(value);
                      _controller.saveAllTuesdaySchedule(tuesdaySchedule: _controller.outletsWithTuesdayScheduledVisit);
                      _visitController.getOutletScheduleList();
                      dateController.clear();
                      update(() {});
                      Navigator.of(context).pop();
                      Get.snackbar("Success", "Schedule request successful", colorText: AppColors.white, backgroundColor: Colors.green);
                    }else if(daysOfWeek == "WED"){
                      _controller.outletsWithWednesdayScheduledVisit.add(value);
                      _controller.saveAllWednesdaySchedule(wednesdaySchedule: _controller.outletsWithWednesdayScheduledVisit);
                      _visitController.getOutletScheduleList();
                      dateController.clear();
                      update(() {});
                      Navigator.of(context).pop();
                      Get.snackbar("Success", "Schedule request successful", colorText: AppColors.white, backgroundColor: Colors.green);
                    }else if(daysOfWeek == "THU"){
                      _controller.outletsWithThursdayScheduledVisit.add(value);
                      _controller.saveAllThursdaySchedule(thursdaySchedule: _controller.outletsWithThursdayScheduledVisit);
                      _visitController.getOutletScheduleList();
                      dateController.clear();
                      update(() {});
                      Navigator.of(context).pop();
                      Get.snackbar("Success", "Schedule request successful", colorText: AppColors.white, backgroundColor: Colors.green);
                    }else if(daysOfWeek == "FRI"){
                      _controller.outletsWithFridayScheduledVisit.add(value);
                      _controller.saveAllFridaySchedule(fridaySchedule: _controller.outletsWithFridayScheduledVisit);
                      _visitController.getOutletScheduleList();
                      dateController.clear();
                      update(() {});
                      Navigator.of(context).pop();
                      Get.snackbar("Success", "Schedule request successful", colorText: AppColors.white, backgroundColor: Colors.green);
                    }else if (daysOfWeek == "SAT"){
                      dateController.clear();
                      Navigator.of(context).pop();
                      Get.snackbar("Error", "Schedule cannot be on a saturday", colorText: AppColors.white, backgroundColor: Colors.red);
                    }else if(daysOfWeek == "SUN"){
                      dateController.clear();
                      Navigator.of(context).pop();
                      Get.snackbar("Error", "Schedule cannot be on a sunday", colorText: AppColors.white, backgroundColor: Colors.red);
                    }
                    log(daysOfWeek.toString());
                  }
                },
              ),
            ],
            content: Container(
                height: 280,
                width: 600,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: TextWidget(
                        text: "Add New Visit",
                        fontSize: 18,
                        color: AppColors.blue,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    DropDownInput(
                        onChanged: (val) {
                          selectedOutletCode = val.value.toString();
                        },
                        label: "Select outlet",
                        options: _controller.createdOutletList.map((e) => DropDownValueModel(name: e.name.toString(), value: e.outletCode.toString())).toList(),
                        isMandatory: true),
                    const SizedBox(height: 8,),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Row(
                        children: [
                          TextWidget(
                            text: "Select day",
                            color: Color.fromARGB(255, 110, 111, 117),
                            fontSize: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: TextWidget(
                              text: "*",
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 5,),
                    GestureDetector(
                      onTap: (){
                        selectDate(context);
                      },
                      child: Container(
                        width: double.maxFinite, padding: const EdgeInsets.only(right: 10, left: 10), margin: const EdgeInsets.symmetric(horizontal: 18),
                        height: 47, decoration: BoxDecoration(border: Border.all(color: AppColors.inputBorder), borderRadius: BorderRadius.circular(5)),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                              text: dateController.text,
                              color: AppColors.black,
                              fontSize: 15,
                            ),
                            const Icon(Icons.arrow_drop_down, color: AppColors.textGrey,)
                          ],
                        ),
                      ),
                    ),
                    // DropDownInput(
                    //     onChanged: (val) {
                    //       _selectDate(context);
                    //       // daysOfWeek = val.value.toString();
                    //     },
                    //     label: "Select day",
                    //     options: _controller.daysOfTheWeek.map((e) => DropDownValueModel(name: e, value: e.toString())).toList(),
                    //     isMandatory: true),
                  ],
                )),
          );
        });
      },
    );
  }

  late TabController _tabController;
  static const List<Tab> myTabs = <Tab>[
    Tab(text: "MON"),
    Tab(text: "TUE"),
    Tab(text: "WED"),
    Tab(text: "THU"),
    Tab(text: "FRI"),
  ];

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
        builder: (controller){
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const AppBarRow(),
              const FormHeaderWidget(title: "Scheduled Outlets"),
              AddVisitButton(onTap: () {
                daysOfWeek = null;
                selectedOutletCode = null;
                dateController.clear();
                _selectedDate = DateTime.now();
                showAddVisitAlert(context);
              }),
              GetBuilder<VisitController>(
                  init: VisitController(),
                  builder: (controller){
                    return Form(
                      child: Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                                child: TabBar(
                                  controller: _tabController,
                                  indicatorColor: AppColors.blue,
                                  labelColor: Colors.black,
                                  tabs: const [...myTabs],
                                ),
                              ),
                              SizedBox(
                                height: 500,
                                child: TabBarView(
                                  controller: _tabController,
                                  children: [
                                    ScheduledOutletDayList(outletList: _controller.outletsWithMondayScheduledVisit, daysOfTheWeek: "MON",),
                                    ScheduledOutletDayList(outletList: _controller.outletsWithTuesdayScheduledVisit, daysOfTheWeek: "TUE",),
                                    ScheduledOutletDayList(outletList: _controller.outletsWithWednesdayScheduledVisit, daysOfTheWeek: "WED",),
                                    ScheduledOutletDayList(outletList: _controller.outletsWithThursdayScheduledVisit, daysOfTheWeek: "THU",),
                                    ScheduledOutletDayList(outletList: _controller.outletsWithFridayScheduledVisit, daysOfTheWeek: "FRI",),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      );
    });
  }
}
