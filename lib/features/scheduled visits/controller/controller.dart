import 'dart:developer';
import 'package:clean_dialog/clean_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/data/local_storage_data_model/category/get_all_categories_response_model.dart';
import 'package:nettapp/data/local_storage_data_model/outlets/local_storage_outlet_model.dart';
import 'package:nettapp/data/local_storage_data_model/trade_visit/local_storage_tradevisit_model.dart';
import 'package:nettapp/data/local_storage_services/local_storage.dart';
import 'package:nettapp/features/home/controller/home_controller.dart';
import 'package:nettapp/features/home/widgets/bottom_nav_bar.dart';

class VisitController extends GetxController{
  final buttonLabel = [

  ];

  void createTradeVisit({
    required String price,
    required String category,
    required String availability,
    required String brand,
    required String duration,
    required String listing,
    required String outletCode,
    required String priceChange,
    required String sku,
    required String userCode,
    required String visitCode,
    required String outletName,
  }) async{
    ListTradeVisitResponseModel tradeVisit = ListTradeVisitResponseModel();
    tradeVisit.price = price;
    tradeVisit.category = category;
    tradeVisit.availability = availability;
    tradeVisit.brand = brand;
    tradeVisit.duration = duration;
    tradeVisit.lastvisit = DateTime.now();
    tradeVisit.listing = listing;
    tradeVisit.outletCode = outletCode;
    tradeVisit.priceChange = priceChange;
    tradeVisit.sku = sku;
    tradeVisit.userCode = userCode;
    tradeVisit.visitCode = visitCode;
    tradeVisit.outletName = outletName;
    List<ListTradeVisitResponseModel> tradeVisitList = <ListTradeVisitResponseModel>[];
    tradeVisitList.add(tradeVisit);
    await LocalCachedData.instance.cacheAllTradeVisitsList(tradeVisitList);
    getPendingVisits();
    Get.offAll(()=> const BottomNavBarWidget());
    Get.snackbar("Success", "Trade visit created", colorText: Colors.white, backgroundColor: Colors.green);
  }

  List<GetAllCategoriesResponseModel> brandList = <GetAllCategoriesResponseModel>[];
  List<String> categoryList = <String>[];
  getAllCategoryList() async {
    final list = await LocalCachedData.instance.getAllCategoryList();
    brandList = list;
    categoryList = list.map((e) => e.category.toString()).toSet().toList();
    update();
  }


  List<OutletRequestModelResponse> createdOutletList = <OutletRequestModelResponse>[];
  void getAllOutletList() async {
    final list = await LocalCachedData.instance.getAllCreatedOutletList();
    createdOutletList = list;
    update();
  }

final homeController = Get.put(HomeController());
  final totalOutletScheduleList = 0.obs;
  Future<void> getOutletScheduleList() async {
    homeController.outletsWithMondayScheduledVisit = await LocalCachedData.instance.getMondayScheduledVisit();
    homeController.outletsWithTuesdayScheduledVisit = await LocalCachedData.instance.getTuesdayScheduledVisit();
    homeController.outletsWithWednesdayScheduledVisit = await LocalCachedData.instance.getWednesdayScheduledVisit();
    homeController.outletsWithThursdayScheduledVisit = await LocalCachedData.instance.getThursdayScheduledVisit();
    homeController.outletsWithFridayScheduledVisit = await LocalCachedData.instance.getFridayScheduledVisit();
    totalOutletScheduleList.value = homeController.outletsWithMondayScheduledVisit.length + homeController.outletsWithTuesdayScheduledVisit.length +
    homeController.outletsWithWednesdayScheduledVisit.length + homeController.outletsWithThursdayScheduledVisit.length +
    homeController.outletsWithFridayScheduledVisit.length;
    update();
  }


  final completedVisit = 0.obs;
  final pendingVisit = 0.obs;
  List<ListTradeVisitResponseModel>? tradeVisitListMonday = <ListTradeVisitResponseModel>[];
  List<ListTradeVisitResponseModel>? tradeVisitListTuesday = <ListTradeVisitResponseModel>[];
  List<ListTradeVisitResponseModel>? tradeVisitListWednesday = <ListTradeVisitResponseModel>[];
  List<ListTradeVisitResponseModel>? tradeVisitListThursday = <ListTradeVisitResponseModel>[];
  List<ListTradeVisitResponseModel>? tradeVisitListFriday = <ListTradeVisitResponseModel>[];

  void getCompletedTradeVisitList()async{
    DateTime today = DateTime.now();
    // final data = await LocalCachedData.instance.getAllTradeVisitList();
    // if(data.isNotEmpty){
    //   tradeVisitListMonday = data.where((element) => element.lastvisit!.isBefore(DateTime(today.year, today.month, today.day)) && element.lastvisit!.weekday == 1).toList();
    //   tradeVisitListTuesday = data.where((element) => element.lastvisit!.isBefore(DateTime(today.year, today.month, today.day)) && element.lastvisit!.weekday == 2).toList();
    //    tradeVisitListWednesday = data.where((element) => element.lastvisit!.isBefore(DateTime(today.year, today.month, today.day)) && element.lastvisit!.weekday == 3).toList();
    //    tradeVisitListThursday = data.where((element) => element.lastvisit!.isBefore(DateTime(today.year, today.month, today.day)) && element.lastvisit!.weekday == 4).toList();
    //    tradeVisitListFriday = data.where((element) => element.lastvisit!.isBefore(DateTime(today.year, today.month, today.day)) && element.lastvisit!.weekday == 5).toList();
    // }

    homeController.outletsWithMondayScheduledVisit = await LocalCachedData.instance.getMondayScheduledVisit();
    homeController.outletsWithTuesdayScheduledVisit = await LocalCachedData.instance.getTuesdayScheduledVisit();
    homeController.outletsWithWednesdayScheduledVisit = await LocalCachedData.instance.getWednesdayScheduledVisit();
    homeController.outletsWithThursdayScheduledVisit = await LocalCachedData.instance.getThursdayScheduledVisit();
    homeController.outletsWithFridayScheduledVisit = await LocalCachedData.instance.getFridayScheduledVisit();
    final monday = homeController.outletsWithMondayScheduledVisit.where((element) => formatDateTime(date: element.lastvisit!)!.isBefore(formatDateTime(date: today)) && element.lastvisit!.weekday == 1).toList();
    final tuesday = homeController.outletsWithTuesdayScheduledVisit.where((element) => formatDateTime(date: element.lastvisit!)!.isBefore(formatDateTime(date: today)) && element.lastvisit!.weekday == 2).toList();
    final wed = homeController.outletsWithWednesdayScheduledVisit .where((element) => formatDateTime(date: element.lastvisit!)!.isBefore(formatDateTime(date: today)) && element.lastvisit!.weekday == 3).toList();
    final thursday = homeController.outletsWithThursdayScheduledVisit.where((element) => formatDateTime(date: element.lastvisit!)!.isBefore(formatDateTime(date: today)) && element.lastvisit!.weekday == 4).toList();
    final friday = homeController.outletsWithFridayScheduledVisit.where((element) => formatDateTime(date: element.lastvisit!)!.isBefore(formatDateTime(date: today)) && element.lastvisit!.weekday == 5).toList();
    //completedVisit.value = monday.length + tuesday.length + wed.length + thursday.length + friday.length;
    await LocalCachedData.instance.getAllTradeVisitList().then((value){
      completedVisit.value = value.length;
    });
    update();
  }

  void getPendingVisits()async{
    // final data = await LocalCachedData.instance.getAllTradeVisitList();
    DateTime today = DateTime.now();
    await LocalCachedData.instance.getMondayScheduledVisit().then((value){
      homeController.outletsWithMondayScheduledVisit = value;
    });
    await LocalCachedData.instance.getTuesdayScheduledVisit().then((value){
      homeController.outletsWithTuesdayScheduledVisit = value;
    });
    await LocalCachedData.instance.getWednesdayScheduledVisit().then((value){
      homeController.outletsWithWednesdayScheduledVisit = value;
    });
    await LocalCachedData.instance.getThursdayScheduledVisit().then((value){
      homeController.outletsWithThursdayScheduledVisit = value;
    });
    await LocalCachedData.instance.getFridayScheduledVisit().then((value){
      homeController.outletsWithFridayScheduledVisit = value;
    });
    final tradeVisitListMonday = homeController.outletsWithMondayScheduledVisit .where((element) => formatDateTime(date: element.lastvisit!).isAtSameMomentAs(formatDateTime(date: today)) || formatDateTime(date: element.lastvisit!)!.isAfter(formatDateTime(date: today)) && element.lastvisit!.weekday == 1).toList();
    final tradeVisitListTuesday = homeController.outletsWithTuesdayScheduledVisit.where((element) => formatDateTime(date: element.lastvisit!).isAtSameMomentAs(formatDateTime(date: today)) || formatDateTime(date: element.lastvisit!)!.isAfter(formatDateTime(date: today)) && element.lastvisit!.weekday == 2).toList();
    final tradeVisitListWednesday =  homeController.outletsWithWednesdayScheduledVisit.where((element) => formatDateTime(date: element.lastvisit!).isAtSameMomentAs(formatDateTime(date: today)) ||formatDateTime(date: element.lastvisit!)!.isAfter(formatDateTime(date: today)) && element.lastvisit!.weekday == 3).toList();
    final tradeVisitListThursday = homeController.outletsWithThursdayScheduledVisit .where((element) => formatDateTime(date: element.lastvisit!)!.isAtSameMomentAs(formatDateTime(date: today)) || formatDateTime(date: element.lastvisit!)!.isAfter(formatDateTime(date: today)) && element.lastvisit!.weekday == 4).toList();
    final tradeVisitListFriday = homeController.outletsWithFridayScheduledVisit.where((element) => formatDateTime(date: element.lastvisit!)!.isAtSameMomentAs(formatDateTime(date: today)) || formatDateTime(date: element.lastvisit!)!.isAfter(formatDateTime(date: today)) && element.lastvisit!.weekday == 5).toList();
    pendingVisit.value = tradeVisitListMonday.length + tradeVisitListTuesday.length + tradeVisitListWednesday.length + tradeVisitListThursday.length + tradeVisitListFriday.length;
      update();
  }

  formatDateTime({required DateTime date}){
    return DateFormat('yyyy-MM-dd').parse(DateFormat('yyyy-MM-dd').format(date));
  }
}