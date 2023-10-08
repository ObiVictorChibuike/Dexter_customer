import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/data/dio/dio_core/dio_client.dart';
import 'package:nettapp/data/dio/dio_core/dio_error.dart';
import 'package:nettapp/data/local_storage_data_model/category/get_all_categories_response_model.dart';
import 'package:nettapp/data/local_storage_data_model/channel/get_all_channel_response_model.dart';
import 'package:nettapp/data/local_storage_data_model/location/get_all_location_response_model.dart';
import 'package:nettapp/data/local_storage_data_model/outlets/local_storage_outlet_model.dart';
import 'package:nettapp/data/local_storage_data_model/trade_visit/local_storage_tradevisit_model.dart';
import 'package:nettapp/data/local_storage_services/local_storage.dart';
import 'package:nettapp/data/remote_server_model_data/get_scheduled_visit_from_remote_server.dart';
import 'package:nettapp/data/remote_server_model_data/schedule_visit_response.dart';
import 'package:nettapp/data/remote_server_model_data/success_response_model.dart';
import 'package:nettapp/features/home/widgets/bottom_nav_bar.dart';
import 'package:nettapp/features/outlets/widgets/show_alert.dart';
import 'package:nettapp/features/trade_visit/screens/trade_visit_screen.dart';
import 'package:nettapp/features/trade_visit/widgets/loader.dart';
import 'package:uuid/uuid.dart';

class HomeController extends GetxController{
  String region = "";
  Future<void> getAllCategory()async{
    try{
      final response = await NetworkProvider().call(path: "/getAllCategories", method: RequestMethod.get);
      List<GetAllCategoriesResponseModel> allCategories = List<GetAllCategoriesResponseModel>.from(json.decode(response?.data).map((x)
      => GetAllCategoriesResponseModel.fromJson(x)));
      LocalCachedData.instance.cacheAllCategoryList(allCategories);
      update();
    }on DioException catch (err) {
      final errorMessage = Future.error(ApiError.fromDio(err));
      throw errorMessage;
    } catch (err) {
      throw err.toString();
    }
  }

  Future<void> getAllLocation()async{
    try{
      final response = await NetworkProvider().call(path: "/getAllLocation", method: RequestMethod.get);
      List<GetAllLocationResponseModel> allLocationList = List<GetAllLocationResponseModel>.from(json.decode(response?.data).map((x)
      => GetAllLocationResponseModel.fromJson(x)));
      LocalCachedData.instance.cacheAllLocationList(allLocationList);
      update();
    }on DioException catch (err) {
      final errorMessage = Future.error(ApiError.fromDio(err));
      throw errorMessage;
    } catch (err) {
      throw err.toString();
    }
  }

  Future<void> getAllChannel()async{
    try{
      final response = await NetworkProvider().call(path: "/getAllChannel", method: RequestMethod.get);
      List<GetAllChannelResponseModel> allChannelList = List<GetAllChannelResponseModel>.from(json.decode(response?.data).map((x)
      => GetAllChannelResponseModel.fromJson(x)));
      LocalCachedData.instance.cacheAllChannelList(allChannelList);
      update();
    }on DioException catch (err) {
      final errorMessage = Future.error(ApiError.fromDio(err));
      throw errorMessage;
    } catch (err) {
      throw err.toString();
    }
  }
  List<ListTradeVisitResponseModel> tradeList = <ListTradeVisitResponseModel>[];
  Future<void> syncTradeVisit()async{
    Loader.progressIndicator(Get.context);
    await LocalCachedData.instance.getAllTradeVisitList().then((value){
      tradeList = value;
    });
    try{
      final body = json.encode([
        ...tradeList,
      ]);
      final response = await NetworkProvider().call(path: "/tradeVisit", method: RequestMethod.post, body: body);
      final data = SuccessResponseModel.fromJson(json.decode(response?.data));
      log(data.status.toString());
      if(data.status == 201 || data.status == 200){
        await syncOutlets();
      }else{
        Get.back();
        Get.snackbar("Error", data.message ?? "Sync failed", colorText: AppColors.white, backgroundColor: Colors.red);
      }
      update();
    }on DioException catch (err) {
      final errorMessage = Future.error(ApiError.fromDio(err));
      Get.back();
      Get.snackbar("Error", err.response?.data?["message"] ?? errorMessage.toString(), colorText: AppColors.white, backgroundColor: Colors.red);
      throw errorMessage;
    } catch (err) {
      Get.back();
      Get.snackbar("Error", err.toString(), colorText: AppColors.white, backgroundColor: Colors.red);
      throw err.toString();
    }
  }

  List<OutletRequestModelResponse> pendingOutlets = <OutletRequestModelResponse>[];
  Future<void> syncOutlets()async{
    await LocalCachedData.instance.getAllPendingOutletList().then((value){
      pendingOutlets = value;
    });
    try{
      final body = json.encode([
        ...pendingOutlets,
      ]);
      final response = await NetworkProvider().call(path: "/createOutlet", method: RequestMethod.post, body: body);
      final data = SuccessResponseModel.fromJson(json.decode(response?.data));
      if(data.status == 201 || data.status == 200){
        await syncScheduledVisit();
      }else{
        Get.back();
        Get.snackbar("Error", data.message ?? "Sync failed", colorText: AppColors.white, backgroundColor: Colors.red);
      }
      update();
    }on DioException catch (err) {
      final errorMessage = Future.error(ApiError.fromDio(err));
      Get.back();
      Get.snackbar("Error", err.response?.data?["message"] ?? errorMessage.toString(), colorText: AppColors.white, backgroundColor: Colors.red);
      throw errorMessage;
    } catch (err) {
      Get.back();
      Get.snackbar("Error", err.toString(), colorText: AppColors.white, backgroundColor: Colors.red);
      throw err.toString();
    }
  }

  List<ScheduleVisitResponseModel> mondayList = <ScheduleVisitResponseModel>[];
  List<ScheduleVisitResponseModel> tuesdayList = <ScheduleVisitResponseModel>[];
  List<ScheduleVisitResponseModel> wednesdayList = <ScheduleVisitResponseModel>[];
  List<ScheduleVisitResponseModel> thursdayList = <ScheduleVisitResponseModel>[];
  List<ScheduleVisitResponseModel> fridayList = <ScheduleVisitResponseModel>[];
  Future<void> syncScheduledVisit()async{
    final mondayVisitList = await LocalCachedData.instance.getMondayScheduledVisit();
    if(mondayVisitList.isNotEmpty){
      for (var element in mondayVisitList) {
        mondayList.add(ScheduleVisitResponseModel(
            outletCode: element.outletcode,
            date: element.lastvisit,
            day: "MON",
            userCode: element.usercode
        ));
      }
    }
    final tuesdayVisit = await LocalCachedData.instance.getMondayScheduledVisit();
    if(tuesdayVisit.isNotEmpty){
      for (var element in tuesdayVisit) {
        tuesdayList.add(ScheduleVisitResponseModel(
            outletCode: element.outletcode,
            date: element.lastvisit,
            day: "TUE",
            userCode: element.usercode
        ));
      }
    }
    final wednesdayVisit = await LocalCachedData.instance.getMondayScheduledVisit();
    if(wednesdayVisit.isNotEmpty){
      for (var element in wednesdayVisit) {
        wednesdayList.add(ScheduleVisitResponseModel(
            outletCode: element.outletcode,
            date: element.lastvisit,
            day: "WED",
            userCode: element.usercode
        ));
      }
    }
    final thursdayVisit = await LocalCachedData.instance.getThursdayScheduledVisit();
    if(thursdayVisit.isNotEmpty){
      for (var element in thursdayVisit) {
        thursdayList.add(ScheduleVisitResponseModel(
            outletCode: element.outletcode,
            date: element.lastvisit,
            day: "THU",
            userCode: element.usercode
        ));
      }
    }
    final fridayVisit = await LocalCachedData.instance.getFridayScheduledVisit();
    if(fridayVisit.isNotEmpty){
      for (var element in fridayVisit) {
        fridayList.add(ScheduleVisitResponseModel(
            outletCode: element.outletcode,
            date: element.lastvisit,
            day: "FRI",
            userCode: element.usercode
        ));
      }
    }
    try{
      final body = json.encode([
        ...mondayList,
        ...tuesdayList,
        ...wednesdayList,
        ...thursdayList,
        ...fridayList,
      ]);
      final response = await NetworkProvider().call(path: "/schedulevisit", method: RequestMethod.post, body: body);
      final data = SuccessResponseModel.fromJson(json.decode(response?.data));
      if(data.status == 201 || data.status == 200){
        Get.back();
        Get.snackbar("Success", data.message ?? "All records saved successfully", colorText: AppColors.white, backgroundColor: Colors.green);
      }else{
        Get.back();
        Get.snackbar("Error", data.message ?? "Sync failed", colorText: AppColors.white, backgroundColor: Colors.red);
      }
      update();
    }on DioException catch (err) {
      final errorMessage = Future.error(ApiError.fromDio(err));
      Get.back();
      Get.snackbar("Error", err.response?.data?["message"] ?? errorMessage.toString(), colorText: AppColors.white, backgroundColor: Colors.red);
      throw errorMessage;
    } catch (err) {
      Get.back();
      Get.snackbar("Error", err.toString(), colorText: AppColors.white, backgroundColor: Colors.red);
      throw err.toString();
    }
  }

  String? state;
  String? city;
  String? channel;
  String? subChannel;
  String? name;
  String? address;
  String? managerName;
  String? managerPhoneNumber;
  String? supplierName;
  var uuid = const Uuid();

   Future<void> createOutlet({required String region}) async {
    Future.delayed(const Duration(seconds: 6), () async {
      OutletRequestModelResponse outletRequestModelResponse = OutletRequestModelResponse();
      outletRequestModelResponse.name = name;
      outletRequestModelResponse.outletcode = uuid.v4();
      outletRequestModelResponse.address = address;
      outletRequestModelResponse.state = state;
      outletRequestModelResponse.region = region;
      outletRequestModelResponse.city = city;
      outletRequestModelResponse.channel = channel;
      outletRequestModelResponse.subChannel = subChannel;
      outletRequestModelResponse.managerName = managerName;
      outletRequestModelResponse.managerPhoneNumber = managerPhoneNumber;
      outletRequestModelResponse.supplierName = supplierName;
      outletRequestModelResponse.usercode = uuid.v4();
      outletRequestModelResponse.lastvisit = DateTime.now();
      final createdPendingOutletList = await LocalCachedData.instance.getAllPendingOutletList();
      createdPendingOutletList.add(outletRequestModelResponse);
      await LocalCachedData.instance.cacheAllPendingOutletList(createdPendingOutletList).then((value){
        Get.back();
        showAlert(Get.context, (){
          state = null; city = null; channel = null; subChannel = null;name = null;
          address = null; managerName = null; managerPhoneNumber = null; supplierName = null;
          getAllOutletList();
          Navigator.pushReplacement(Get.context!, MaterialPageRoute(builder: (context)=> const BottomNavBarWidget()));
          update();
        }, () async {
          final outletList = await LocalCachedData.instance.getAllPendingOutletList();
          final index = outletList.indexWhere((element) => element.outletcode == outletRequestModelResponse.outletcode);
          final data = outletList[index];
          Navigator.of(Get.context!).pop();
          Navigator.push(Get.context!, MaterialPageRoute(builder: (context)=> TradeVisitFormScreen(outletRequestModelResponse: data,)));
        });
      });
    });
   }

   final totalNumberOfRegisteredOutlets = 0.obs;
  List<OutletRequestModelResponse> createdOutletList = <OutletRequestModelResponse>[];
  List<OutletRequestModelResponse> pendingOutletList = <OutletRequestModelResponse>[];
  void getAllOutletList() async {
    await LocalCachedData.instance.getAllCreatedOutletList().then((value){
      createdOutletList = value;
      update();
    });
    await LocalCachedData.instance.getAllPendingOutletList().then((value){
      pendingOutletList = value;
      update();
    });
    totalNumberOfRegisteredOutlets.value = createdOutletList.length + pendingOutletList.length;
    update();
  }



  List<String> daysOfTheWeek = ["MON", "TUE", "WED", "THU", "FRI"];
  List<OutletRequestModelResponse> outletsWithMondayScheduledVisit = <OutletRequestModelResponse>[];
  List<OutletRequestModelResponse> outletsWithTuesdayScheduledVisit = <OutletRequestModelResponse>[];
  List<OutletRequestModelResponse> outletsWithWednesdayScheduledVisit = <OutletRequestModelResponse>[];
  List<OutletRequestModelResponse> outletsWithThursdayScheduledVisit = <OutletRequestModelResponse>[];
  List<OutletRequestModelResponse> outletsWithFridayScheduledVisit = <OutletRequestModelResponse>[];

  void saveAllMondaySchedule({required List<OutletRequestModelResponse> mondaySchedule}) async {
    await LocalCachedData.instance.cacheMondayScheduledVisit(mondaySchedule);
    update();
  }

  void saveAllTuesdaySchedule({required List<OutletRequestModelResponse> tuesdaySchedule}) async {
    await LocalCachedData.instance.cacheTuesdayScheduledVisit(tuesdaySchedule);
    update();
  }

  void saveAllWednesdaySchedule({required List<OutletRequestModelResponse> wednesdaySchedule}) async {
    await LocalCachedData.instance.cacheWednesdayScheduledVisit(wednesdaySchedule);
    update();
  }

  void saveAllThursdaySchedule({required List<OutletRequestModelResponse> thursdaySchedule}) async {
    await LocalCachedData.instance.cacheThursdayScheduledVisit(thursdaySchedule);
    update();
  }

  void saveAllFridaySchedule({required List<OutletRequestModelResponse> fridaySchedule}) async {
    await LocalCachedData.instance.cacheFridayScheduledVisit(fridaySchedule);
    update();
  }


  Future<void> getAllTradeVisitFromRemoteServer() async {
    final userCode = await LocalCachedData.instance.getUserCode();
    try{
      var body = {
        "userCode": userCode
      };
      var response = await NetworkProvider().call(path: "/getTradeVisit", method: RequestMethod.post, body: body,);
      if(response?.statusCode.toString() == "200" || response?.statusCode.toString() == "201"){
        List<ListTradeVisitResponseModel> allTradeVisitList = List<ListTradeVisitResponseModel>.from(json.decode(response?.data).map((x) => ListTradeVisitResponseModel.fromJson(x)));
        if(allTradeVisitList.isEmpty){
          null;
        }
       else{
         await LocalCachedData.instance.cacheAllTradeVisitsList(allTradeVisitList);
        }
      }else{
        Get.back();
        Get.snackbar("Error", response?.data["message"], colorText: AppColors.white, backgroundColor: Colors.red);
      }
    }on DioError catch (err) {
      final errorMessage = Future.error(ApiError.fromDio(err));
      Get.back();
      Get.snackbar("Error", err.response?.data["message"] ?? errorMessage.toString(), colorText: AppColors.white, backgroundColor: Colors.red);
      update();
      throw errorMessage;
    } catch (err) {
      Get.back();
      Get.snackbar("Error", err.toString(), colorText: AppColors.white, backgroundColor: Colors.red);
      update();
      throw err.toString();
    }
  }

  Future<void> getAllOutletsFromRemoteServer() async {
    final userCode = await LocalCachedData.instance.getUserCode();
    try{
      var body = {
        "userCode": userCode
      };
      var response = await NetworkProvider().call(path: "/getAllOutlet", method: RequestMethod.post, body: body,);
      if(response?.statusCode.toString() == "200" || response?.statusCode.toString() == "201"){
        List<OutletRequestModelResponse> allCreatedOutlet = List<OutletRequestModelResponse>.from(json.decode(response?.data).map((x) => OutletRequestModelResponse.fromJson(x)));
        if(allCreatedOutlet.isEmpty){
          log("This the outlets length ${allCreatedOutlet.length}" );
          null;
        }else{
          log("This the outlets length ${allCreatedOutlet.length}" );
         await LocalCachedData.instance.cacheAllCreatedOutletList(allCreatedOutlet);
        }
      }else{
        Get.back();
        Get.snackbar("Error", response?.data["message"], colorText: AppColors.white, backgroundColor: Colors.red);
      }
    }on DioError catch (err) {
      final errorMessage = Future.error(ApiError.fromDio(err));
      Get.back();
      Get.snackbar("Error", err.response?.data["message"] ?? errorMessage.toString(), colorText: AppColors.white, backgroundColor: Colors.red);
      update();
      throw errorMessage;
    } catch (err) {
      Get.back();
      Get.snackbar("Error", err.toString(), colorText: AppColors.white, backgroundColor: Colors.red);
      update();
      throw err.toString();
    }
  }

  Future<void> syncSchedulesFromRemoteServer() async {
    final userCode = await LocalCachedData.instance.getUserCode();
    try{
      var body = {
        "userCode": userCode
      };
      var response = await NetworkProvider().call(path: "/getSchedules", method: RequestMethod.post, body: body,);
      if(response?.statusCode.toString() == "200" || response?.statusCode.toString() == "201"){
        List<ScheduleVisitsFromRemoteServerResponse> allScheduledVisitList = List<ScheduleVisitsFromRemoteServerResponse>.from(json.decode(response?.data).map((x) => ScheduleVisitsFromRemoteServerResponse.fromJson(x)));
        if(allScheduledVisitList.isEmpty){
          null;
        }
        // else{
        //   final outlet = await LocalCachedData.instance.getAllCreatedOutletList();
        //   allScheduledVisitList;
        // }
      }else{
        Get.back();
        Get.snackbar("Error", response?.data["message"], colorText: AppColors.white, backgroundColor: Colors.red);
      }
    }on DioError catch (err) {
      final errorMessage = Future.error(ApiError.fromDio(err));
      Get.back();
      Get.snackbar("Error", err.response?.data["message"] ?? errorMessage.toString(), colorText: AppColors.white, backgroundColor: Colors.red);
      update();
      throw errorMessage;
    } catch (err) {
      Get.back();
      Get.snackbar("Error", err.toString(), colorText: AppColors.white, backgroundColor: Colors.red);
      update();
      throw err.toString();
    }
  }
}