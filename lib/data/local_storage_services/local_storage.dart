import 'dart:convert';
import 'package:get/get.dart';
import 'package:nettapp/data/local_storage_data_model/auth/login/login_local_storage_model.dart';
import 'package:nettapp/data/local_storage_data_model/category/get_all_categories_response_model.dart';
import 'package:nettapp/data/local_storage_data_model/channel/get_all_channel_response_model.dart';
import 'package:nettapp/data/local_storage_data_model/location/get_all_location_response_model.dart';
import 'package:nettapp/data/local_storage_data_model/outlets/local_storage_outlet_model.dart';
import 'package:nettapp/data/local_storage_data_model/trade_visit/local_storage_tradevisit_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LocalCachedData{
  final SharedPreferences _prefs;
  LocalCachedData._(this._prefs);
  static Future<LocalCachedData> create() async => LocalCachedData._(await SharedPreferences.getInstance());
  static LocalCachedData get instance => Get.find<LocalCachedData>();

  Future<void> cachePassword({required String? password}) async {
    _prefs.setString("password", password!);
  }

  Future<String?> getPassword() async {
    String? password = _prefs.getString("password");
    return password;
  }

  Future<void> cacheUserCode({required String? userCode}) async {
    _prefs.setString("userCode", userCode!);
  }

  Future<String?> getUserCode() async {
    String? userCode = _prefs.getString("userCode");
    return userCode;
  }

  Future<bool?> fetchFirstTimeUserStatus() async {
    bool? firstTimeUser = _prefs.getBool("firstTimeUser");
    return firstTimeUser ?? true;
  }

  Future<void> cacheFirstTimeUserStatus({required bool firstTimeUser}) async {
    _prefs.setBool("firstTimeUser", firstTimeUser);
  }

  Future<void> clearLoginModel() async {
    _prefs.remove("login_model");
  }

  Future<void> cacheLoginModel({required LoginLocalStorageModel loginDataModel}) async {
    _prefs.setString("login_model", jsonEncode(loginDataModel.toJson()));
  }
  Future<LoginLocalStorageModel> fetchLoginModel() async {
    final loginDataModel = _prefs.getString("login_model");
    return LoginLocalStorageModel.fromJson(jsonDecode(loginDataModel ?? ""));
  }


  Future<void> cacheAllCategoryList(List<GetAllCategoriesResponseModel> list) async {
    final List<Map<String, dynamic>> jsonList = list.map((item) => item.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    await _prefs.setString('categoriesList', jsonString);
  }

  Future<List<GetAllCategoriesResponseModel>> getAllCategoryList() async {
    final jsonString = _prefs.getString('categoriesList');
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      final List<GetAllCategoriesResponseModel> categoryList = jsonList.map((item) => GetAllCategoriesResponseModel.fromJson(item)).toList();
      return categoryList;
    }
    return [];
  }

  Future<void> cacheAllLocationList(List<GetAllLocationResponseModel> list) async {
    final List<Map<String, dynamic>> jsonList = list.map((item) => item.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    await _prefs.setString('locationList', jsonString);
  }

  Future<List<GetAllLocationResponseModel>> getAllLocationList() async {
    final jsonString = _prefs.getString('locationList');
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      final List<GetAllLocationResponseModel> categoryList = jsonList.map((item) => GetAllLocationResponseModel.fromJson(item)).toList();
      return categoryList;
    }
    return [];
  }

  Future<void> cacheAllChannelList(List<GetAllChannelResponseModel> list) async {
    final List<Map<String, dynamic>> jsonList = list.map((item) => item.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    await _prefs.setString('channelList', jsonString);
  }

  Future<List<GetAllChannelResponseModel>> getAllChannelList() async {
    final jsonString = _prefs.getString('channelList');
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      final List<GetAllChannelResponseModel> categoryList = jsonList.map((item) => GetAllChannelResponseModel.fromJson(item)).toList();
      return categoryList;
    }
    return [];
  }

  Future<void> cacheAllTradeVisitsList(List<ListTradeVisitResponseModel> list) async {
    final List<Map<String, dynamic>> jsonList = list.map((item) => item.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    await _prefs.setString('tradeVisitList', jsonString);
  }

  Future<List<ListTradeVisitResponseModel>> getAllTradeVisitList() async {
    final jsonString = _prefs.getString('tradeVisitList');
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      final List<ListTradeVisitResponseModel> categoryList = jsonList.map((item) => ListTradeVisitResponseModel.fromJson(item)).toList();
      return categoryList;
    }
    return [];
  }


  Future<void> cacheAllCreatedOutletList(List<OutletRequestModelResponse> list) async {
    final List<Map<String, dynamic>> jsonList = list.map((item) => item.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    await _prefs.setString('outletList', jsonString);
  }

  Future<List<OutletRequestModelResponse>> getAllCreatedOutletList() async {
    final jsonString = _prefs.getString('outletList');
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      final List<OutletRequestModelResponse> categoryList = jsonList.map((item) => OutletRequestModelResponse.fromJson(item)).toList();
      return categoryList;
    }
    return [];
  }


  ///Monday Schedule
  Future<void> cacheMondayScheduledVisit(List<OutletRequestModelResponse> list) async {
    final List<Map<String, dynamic>> jsonList = list.map((item) => item.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    await _prefs.setString('monday_schedule', jsonString);
  }

  Future<List<OutletRequestModelResponse>> getMondayScheduledVisit() async {
    final jsonString = _prefs.getString('monday_schedule');
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      final List<OutletRequestModelResponse> categoryList = jsonList.map((item) => OutletRequestModelResponse.fromJson(item)).toList();
      return categoryList;
    }
    return [];
  }

  ///Tuesday Schedule
  Future<void> cacheTuesdayScheduledVisit(List<OutletRequestModelResponse> list) async {
    final List<Map<String, dynamic>> jsonList = list.map((item) => item.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    await _prefs.setString('tuesday_schedule', jsonString);
  }

  Future<List<OutletRequestModelResponse>> getTuesdayScheduledVisit() async {
    final jsonString = _prefs.getString('tuesday_schedule');
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      final List<OutletRequestModelResponse> categoryList = jsonList.map((item) => OutletRequestModelResponse.fromJson(item)).toList();
      return categoryList;
    }
    return [];
  }

  ///Wednesday Schedule
  Future<void> cacheWednesdayScheduledVisit(List<OutletRequestModelResponse> list) async {
    final List<Map<String, dynamic>> jsonList = list.map((item) => item.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    await _prefs.setString('wednesday_schedule', jsonString);
  }

  Future<List<OutletRequestModelResponse>> getWednesdayScheduledVisit() async {
    final jsonString = _prefs.getString('wednesday_schedule');
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      final List<OutletRequestModelResponse> categoryList = jsonList.map((item) => OutletRequestModelResponse.fromJson(item)).toList();
      return categoryList;
    }
    return [];
  }


  ///Thursday Schedule
  Future<void> cacheThursdayScheduledVisit(List<OutletRequestModelResponse> list) async {
    final List<Map<String, dynamic>> jsonList = list.map((item) => item.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    await _prefs.setString('thursday_schedule', jsonString);
  }

  Future<List<OutletRequestModelResponse>> getThursdayScheduledVisit() async {
    final jsonString = _prefs.getString('thursday_schedule');
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      final List<OutletRequestModelResponse> categoryList = jsonList.map((item) => OutletRequestModelResponse.fromJson(item)).toList();
      return categoryList;
    }
    return [];
  }

  ///Friday Schedule
  Future<void> cacheFridayScheduledVisit(List<OutletRequestModelResponse> list) async {
    final List<Map<String, dynamic>> jsonList = list.map((item) => item.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    await _prefs.setString('friday_schedule', jsonString);
  }

  Future<List<OutletRequestModelResponse>> getFridayScheduledVisit() async {
    final jsonString = _prefs.getString('friday_schedule');
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      final List<OutletRequestModelResponse> categoryList = jsonList.map((item) => OutletRequestModelResponse.fromJson(item)).toList();
      return categoryList;
    }
    return [];
  }

}