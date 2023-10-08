import 'dart:developer';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/widgets/text_widget.dart';
import 'package:nettapp/data/local_storage_data_model/outlets/local_storage_outlet_model.dart';
import 'package:nettapp/features/home/controller/home_controller.dart';
import 'package:nettapp/features/outlets/widgets/drop_down_widget.dart';
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
DateTime today = DateTime.now();
formatDateTime({required DateTime date}){
  return DateFormat('yyyy-MM-dd').parse(DateFormat('yyyy-MM-dd').format(date));
}

late DateTime _selectedDate = DateTime.now();
final dateController = TextEditingController();
final nameController = TextEditingController();
String? dateTimeString;
getDate(String date) {
  var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
  var inputDate = inputFormat.parse(date);
  dateTimeString = inputFormat.parse(date).toString();
  var outputFormat = DateFormat('dd/MM/yyyy');
  return outputFormat.format(inputDate);
}
String? daysOfWeek;
showAddVisitAlert({required BuildContext context, required OutletRequestModelResponse outList}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, update){
        dateController.text = getDate(outList.lastvisit.toString());
        nameController.text = outList.name ?? "";
        update((){});
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
        formatDateTime({required DateTime date}){
          return DateFormat('yyyy-MM-dd').parse(DateFormat('yyyy-MM-dd').format(date));
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
                if(widget.daysOfTheWeek == "MON"){
                  final index = _controller.outletsWithMondayScheduledVisit.indexWhere((element) => element.outletcode == outList.outletcode);
                  final value = _controller.outletsWithMondayScheduledVisit[index];
                  _controller.outletsWithMondayScheduledVisit.removeAt(index);
                  _controller.saveAllMondaySchedule(mondaySchedule: _controller.outletsWithMondayScheduledVisit);
                  _visitController.getOutletScheduleList();
                  setState(() {});
                  value.lastvisit = _selectedDate;
                  if(daysOfWeek == "MON"){
                    _controller.outletsWithMondayScheduledVisit.add(value);
                    _controller.saveAllMondaySchedule(mondaySchedule: _controller.outletsWithMondayScheduledVisit);
                    _visitController.getOutletScheduleList();
                    dateController.clear();
                    update(() {});
                    Navigator.of(context).pop();
                    Get.snackbar("Success", "Re-Schedule successful", colorText: AppColors.white, backgroundColor: Colors.green);
                  }else if(daysOfWeek == "TUE"){
                    _controller.outletsWithTuesdayScheduledVisit.add(value);
                    _controller.saveAllTuesdaySchedule(tuesdaySchedule: _controller.outletsWithTuesdayScheduledVisit);
                    _visitController.getOutletScheduleList();
                    dateController.clear();
                    update(() {});
                    Navigator.of(context).pop();
                    Get.snackbar("Success", "Re-Schedule successful", colorText: AppColors.white, backgroundColor: Colors.green);
                  }else if(daysOfWeek == "WED"){
                    _controller.outletsWithWednesdayScheduledVisit.add(value);
                    _controller.saveAllWednesdaySchedule(wednesdaySchedule: _controller.outletsWithWednesdayScheduledVisit);
                    _visitController.getOutletScheduleList();
                    dateController.clear();
                    update(() {});
                    Navigator.of(context).pop();
                    Get.snackbar("Success", "Re-Schedule successful", colorText: AppColors.white, backgroundColor: Colors.green);
                  }else if(daysOfWeek == "THU"){
                    _controller.outletsWithThursdayScheduledVisit.add(value);
                    _controller.saveAllThursdaySchedule(thursdaySchedule: _controller.outletsWithThursdayScheduledVisit);
                    _visitController.getOutletScheduleList();
                    dateController.clear();
                    update(() {});
                    Navigator.of(context).pop();
                    Get.snackbar("Success", "Re-Schedule successful", colorText: AppColors.white, backgroundColor: Colors.green);
                  }else if(daysOfWeek == "FRI"){
                    _controller.outletsWithFridayScheduledVisit.add(value);
                    _controller.saveAllFridaySchedule(fridaySchedule: _controller.outletsWithFridayScheduledVisit);
                    _visitController.getOutletScheduleList();
                    dateController.clear();
                    update(() {});
                    Navigator.of(context).pop();
                    Get.snackbar("Success", "Re-Schedule successful", colorText: AppColors.white, backgroundColor: Colors.green);
                  }else if (daysOfWeek == "SAT"){
                    dateController.clear();
                    Navigator.of(context).pop();
                    Get.snackbar("Error", "Schedule cannot be on a saturday", colorText: AppColors.white, backgroundColor: Colors.red);
                  }else if(daysOfWeek == "SUN"){
                    dateController.clear();
                    Navigator.of(context).pop();
                    Get.snackbar("Error", "Schedule cannot be on a sunday", colorText: AppColors.white, backgroundColor: Colors.red);
                  }






                }else if(widget.daysOfTheWeek == "TUE"){
                  final index = _controller.outletsWithTuesdayScheduledVisit.indexWhere((element) => element.outletcode == outList.outletcode);
                  final value = _controller.outletsWithTuesdayScheduledVisit[index];
                  _controller.outletsWithTuesdayScheduledVisit.removeAt(index);
                  _controller.saveAllTuesdaySchedule(tuesdaySchedule: _controller.outletsWithTuesdayScheduledVisit);
                  _visitController.getOutletScheduleList();
                  setState(() {});
                  value.lastvisit = _selectedDate;
                  if(daysOfWeek == "MON"){
                    _controller.outletsWithMondayScheduledVisit.add(value);
                    _controller.saveAllMondaySchedule(mondaySchedule: _controller.outletsWithMondayScheduledVisit);
                    _visitController.getOutletScheduleList();
                    dateController.clear();
                    update(() {});
                    Navigator.of(context).pop();
                    Get.snackbar("Success", "Re-Schedule successful", colorText: AppColors.white, backgroundColor: Colors.green);
                  }else if(daysOfWeek == "TUE"){
                    _controller.outletsWithTuesdayScheduledVisit.add(value);
                    _controller.saveAllTuesdaySchedule(tuesdaySchedule: _controller.outletsWithTuesdayScheduledVisit);
                    _visitController.getOutletScheduleList();
                    dateController.clear();
                    update(() {});
                    Navigator.of(context).pop();
                    Get.snackbar("Success", "Re-Schedule successful", colorText: AppColors.white, backgroundColor: Colors.green);
                  }else if(daysOfWeek == "WED"){
                    _controller.outletsWithWednesdayScheduledVisit.add(value);
                    _controller.saveAllWednesdaySchedule(wednesdaySchedule: _controller.outletsWithWednesdayScheduledVisit);
                    _visitController.getOutletScheduleList();
                    dateController.clear();
                    update(() {});
                    Navigator.of(context).pop();
                    Get.snackbar("Success", "Re-Schedule successful", colorText: AppColors.white, backgroundColor: Colors.green);
                  }else if(daysOfWeek == "THU"){
                    _controller.outletsWithThursdayScheduledVisit.add(value);
                    _controller.saveAllThursdaySchedule(thursdaySchedule: _controller.outletsWithThursdayScheduledVisit);
                    _visitController.getOutletScheduleList();
                    dateController.clear();
                    update(() {});
                    Navigator.of(context).pop();
                    Get.snackbar("Success", "Re-Schedule successful", colorText: AppColors.white, backgroundColor: Colors.green);
                  }else if(daysOfWeek == "FRI"){
                    _controller.outletsWithFridayScheduledVisit.add(value);
                    _controller.saveAllFridaySchedule(fridaySchedule: _controller.outletsWithFridayScheduledVisit);
                    _visitController.getOutletScheduleList();
                    dateController.clear();
                    update(() {});
                    Navigator.of(context).pop();
                    Get.snackbar("Success", "Re-Schedule successful", colorText: AppColors.white, backgroundColor: Colors.green);
                  }else if (daysOfWeek == "SAT"){
                    dateController.clear();
                    Navigator.of(context).pop();
                    Get.snackbar("Error", "Schedule cannot be on a saturday", colorText: AppColors.white, backgroundColor: Colors.red);
                  }else if(daysOfWeek == "SUN"){
                    dateController.clear();
                    Navigator.of(context).pop();
                    Get.snackbar("Error", "Schedule cannot be on a sunday", colorText: AppColors.white, backgroundColor: Colors.red);
                  }





                }else if(widget.daysOfTheWeek == "WED"){
                  final index = _controller.outletsWithWednesdayScheduledVisit.indexWhere((element) => element.outletcode == outList.outletcode);
                  final value = _controller.outletsWithWednesdayScheduledVisit[index];
                  _controller.outletsWithWednesdayScheduledVisit.removeAt(index);
                  _controller.saveAllWednesdaySchedule(wednesdaySchedule: _controller.outletsWithWednesdayScheduledVisit);
                  _visitController.getOutletScheduleList();
                  setState(() {});
                  value.lastvisit = _selectedDate;
                  if(daysOfWeek == "MON"){
                    _controller.outletsWithMondayScheduledVisit.add(value);
                    _controller.saveAllMondaySchedule(mondaySchedule: _controller.outletsWithMondayScheduledVisit);
                    _visitController.getOutletScheduleList();
                    dateController.clear();
                    update(() {});
                    Navigator.of(context).pop();
                    Get.snackbar("Success", "Re-Schedule successful", colorText: AppColors.white, backgroundColor: Colors.green);
                  }else if(daysOfWeek == "TUE"){
                    _controller.outletsWithTuesdayScheduledVisit.add(value);
                    _controller.saveAllTuesdaySchedule(tuesdaySchedule: _controller.outletsWithTuesdayScheduledVisit);
                    _visitController.getOutletScheduleList();
                    dateController.clear();
                    update(() {});
                    Navigator.of(context).pop();
                    Get.snackbar("Success", "Re-Schedule successful", colorText: AppColors.white, backgroundColor: Colors.green);
                  }else if(daysOfWeek == "WED"){
                    _controller.outletsWithWednesdayScheduledVisit.add(value);
                    _controller.saveAllWednesdaySchedule(wednesdaySchedule: _controller.outletsWithWednesdayScheduledVisit);
                    _visitController.getOutletScheduleList();
                    dateController.clear();
                    update(() {});
                    Navigator.of(context).pop();
                    Get.snackbar("Success", "Re-Schedule successful", colorText: AppColors.white, backgroundColor: Colors.green);
                  }else if(daysOfWeek == "THU"){
                    _controller.outletsWithThursdayScheduledVisit.add(value);
                    _controller.saveAllThursdaySchedule(thursdaySchedule: _controller.outletsWithThursdayScheduledVisit);
                    _visitController.getOutletScheduleList();
                    dateController.clear();
                    update(() {});
                    Navigator.of(context).pop();
                    Get.snackbar("Success", "Re-Schedule successful", colorText: AppColors.white, backgroundColor: Colors.green);
                  }else if(daysOfWeek == "FRI"){
                    _controller.outletsWithFridayScheduledVisit.add(value);
                    _controller.saveAllFridaySchedule(fridaySchedule: _controller.outletsWithFridayScheduledVisit);
                    _visitController.getOutletScheduleList();
                    dateController.clear();
                    update(() {});
                    Navigator.of(context).pop();
                    Get.snackbar("Success", "Re-Schedule successful", colorText: AppColors.white, backgroundColor: Colors.green);
                  }else if (daysOfWeek == "SAT"){
                    dateController.clear();
                    Navigator.of(context).pop();
                    Get.snackbar("Error", "Schedule cannot be on a saturday", colorText: AppColors.white, backgroundColor: Colors.red);
                  }else if(daysOfWeek == "SUN"){
                    dateController.clear();
                    Navigator.of(context).pop();
                    Get.snackbar("Error", "Schedule cannot be on a sunday", colorText: AppColors.white, backgroundColor: Colors.red);
                  }




                }else if(widget.daysOfTheWeek == "THU"){
                  final index = _controller.outletsWithThursdayScheduledVisit.indexWhere((element) => element.outletcode == outList.outletcode);
                  final value = _controller.outletsWithThursdayScheduledVisit[index];
                  _controller.outletsWithThursdayScheduledVisit.removeAt(index);
                  _controller.saveAllThursdaySchedule(thursdaySchedule: _controller.outletsWithThursdayScheduledVisit);
                  _visitController.getOutletScheduleList();
                  setState(() {});
                  value.lastvisit = _selectedDate;
                  if(daysOfWeek == "MON"){
                    _controller.outletsWithMondayScheduledVisit.add(value);
                    _controller.saveAllMondaySchedule(mondaySchedule: _controller.outletsWithMondayScheduledVisit);
                    _visitController.getOutletScheduleList();
                    dateController.clear();
                    update(() {});
                    Navigator.of(context).pop();
                    Get.snackbar("Success", "Re-Schedule successful", colorText: AppColors.white, backgroundColor: Colors.green);
                  }else if(daysOfWeek == "TUE"){
                    _controller.outletsWithTuesdayScheduledVisit.add(value);
                    _controller.saveAllTuesdaySchedule(tuesdaySchedule: _controller.outletsWithTuesdayScheduledVisit);
                    _visitController.getOutletScheduleList();
                    dateController.clear();
                    update(() {});
                    Navigator.of(context).pop();
                    Get.snackbar("Success", "Re-Schedule successful", colorText: AppColors.white, backgroundColor: Colors.green);
                  }else if(daysOfWeek == "WED"){
                    _controller.outletsWithWednesdayScheduledVisit.add(value);
                    _controller.saveAllWednesdaySchedule(wednesdaySchedule: _controller.outletsWithWednesdayScheduledVisit);
                    _visitController.getOutletScheduleList();
                    dateController.clear();
                    update(() {});
                    Navigator.of(context).pop();
                    Get.snackbar("Success", "Re-Schedule successful", colorText: AppColors.white, backgroundColor: Colors.green);
                  }else if(daysOfWeek == "THU"){
                    _controller.outletsWithThursdayScheduledVisit.add(value);
                    _controller.saveAllThursdaySchedule(thursdaySchedule: _controller.outletsWithThursdayScheduledVisit);
                    _visitController.getOutletScheduleList();
                    dateController.clear();
                    update(() {});
                    Navigator.of(context).pop();
                    Get.snackbar("Success", "Re-Schedule successful", colorText: AppColors.white, backgroundColor: Colors.green);
                  }else if(daysOfWeek == "FRI"){
                    _controller.outletsWithFridayScheduledVisit.add(value);
                    _controller.saveAllFridaySchedule(fridaySchedule: _controller.outletsWithFridayScheduledVisit);
                    _visitController.getOutletScheduleList();
                    dateController.clear();
                    update(() {});
                    Navigator.of(context).pop();
                    Get.snackbar("Success", "Re-Schedule successful", colorText: AppColors.white, backgroundColor: Colors.green);
                  }else if (daysOfWeek == "SAT"){
                    dateController.clear();
                    Navigator.of(context).pop();
                    Get.snackbar("Error", "Schedule cannot be on a saturday", colorText: AppColors.white, backgroundColor: Colors.red);
                  }else if(daysOfWeek == "SUN"){
                    dateController.clear();
                    Navigator.of(context).pop();
                    Get.snackbar("Error", "Schedule cannot be on a sunday", colorText: AppColors.white, backgroundColor: Colors.red);
                  }





                }else if(widget.daysOfTheWeek == "FRI"){
                  final index = _controller.outletsWithFridayScheduledVisit.indexWhere((element) => element.outletcode == outList.outletcode);
                  final value = _controller.outletsWithFridayScheduledVisit[index];
                  _controller.outletsWithFridayScheduledVisit.removeAt(index);
                  _controller.saveAllFridaySchedule(fridaySchedule: _controller.outletsWithFridayScheduledVisit);
                  _visitController.getOutletScheduleList();
                  setState(() {});
                  value.lastvisit = _selectedDate;
                  if(daysOfWeek == "MON"){
                    _controller.outletsWithMondayScheduledVisit.add(value);
                    _controller.saveAllMondaySchedule(mondaySchedule: _controller.outletsWithMondayScheduledVisit);
                    _visitController.getOutletScheduleList();
                    dateController.clear();
                    update(() {});
                    Navigator.of(context).pop();
                    Get.snackbar("Success", "Re-Schedule successful", colorText: AppColors.white, backgroundColor: Colors.green);
                  }else if(daysOfWeek == "TUE"){
                    _controller.outletsWithTuesdayScheduledVisit.add(value);
                    _controller.saveAllTuesdaySchedule(tuesdaySchedule: _controller.outletsWithTuesdayScheduledVisit);
                    _visitController.getOutletScheduleList();
                    dateController.clear();
                    update(() {});
                    Navigator.of(context).pop();
                    Get.snackbar("Success", "Re-Schedule successful", colorText: AppColors.white, backgroundColor: Colors.green);
                  }else if(daysOfWeek == "WED"){
                    _controller.outletsWithWednesdayScheduledVisit.add(value);
                    _controller.saveAllWednesdaySchedule(wednesdaySchedule: _controller.outletsWithWednesdayScheduledVisit);
                    _visitController.getOutletScheduleList();
                    dateController.clear();
                    update(() {});
                    Navigator.of(context).pop();
                    Get.snackbar("Success", "Re-Schedule successful", colorText: AppColors.white, backgroundColor: Colors.green);
                  }else if(daysOfWeek == "THU"){
                    _controller.outletsWithThursdayScheduledVisit.add(value);
                    _controller.saveAllThursdaySchedule(thursdaySchedule: _controller.outletsWithThursdayScheduledVisit);
                    _visitController.getOutletScheduleList();
                    dateController.clear();
                    update(() {});
                    Navigator.of(context).pop();
                    Get.snackbar("Success", "Re-Schedule successful", colorText: AppColors.white, backgroundColor: Colors.green);
                  }else if(daysOfWeek == "FRI"){
                    _controller.outletsWithFridayScheduledVisit.add(value);
                    _controller.saveAllFridaySchedule(fridaySchedule: _controller.outletsWithFridayScheduledVisit);
                    _visitController.getOutletScheduleList();
                    dateController.clear();
                    update(() {});
                    Navigator.of(context).pop();
                    Get.snackbar("Success", "Re-Schedule successful", colorText: AppColors.white, backgroundColor: Colors.green);
                  }else if (daysOfWeek == "SAT"){
                    dateController.clear();
                    Navigator.of(context).pop();
                    Get.snackbar("Error", "Schedule cannot be on a saturday", colorText: AppColors.white, backgroundColor: Colors.red);
                  }else if(daysOfWeek == "SUN"){
                    dateController.clear();
                    Navigator.of(context).pop();
                    Get.snackbar("Error", "Schedule cannot be on a sunday", colorText: AppColors.white, backgroundColor: Colors.red);
                  }





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
                        outList.name = val.value.toString();
                      },
                      label: "Select outlet",
                      options: [outList.name].map((e) => DropDownValueModel(name: nameController.text, value: e.toString())).toList(),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
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
                    ),

                    //Text(controller.buttonLabel[index], style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w300, color: index != 2 ? Colors.black : Colors.red),),
                    PopupMenuButton(
                      onSelected: (value) {
                        if(value.toString() == "1"){
                          showAddVisitAlert(context: context, outList: widget.outletList[index]);
                        }else if(value.toString() == "2"){
                          if(formatDateTime(date: widget.outletList[index].lastvisit!).isAtSameMomentAs(formatDateTime(date: today))){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> TradeVisitFormScreen(outletRequestModelResponse: widget.outletList[index], outletList: widget.outletList, dayOfTheWeek: widget.daysOfTheWeek,)));
                          }else if(formatDateTime(date: widget.outletList[index].lastvisit!).isBefore(formatDateTime(date: today))){
                            Get.snackbar("Error", "This visit schedule is already past", colorText: Colors.white, backgroundColor: Colors.red);
                          } else{
                            Get.snackbar("Error", "This visit is not scheduled for today", colorText: Colors.white, backgroundColor: Colors.red);
                          }
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
              ),
            );
          }),
          const SizedBox(height: 100,)
        ],
      );
    });
  }
}
