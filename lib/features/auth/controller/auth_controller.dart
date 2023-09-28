import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/data/dio/dio_core/dio_client.dart';
import 'package:nettapp/data/dio/dio_core/dio_error.dart';
import 'package:nettapp/data/local_storage_data_model/auth/login/login_local_storage_model.dart';
import 'package:nettapp/data/local_storage_data_model/auth/login/login_response_model.dart';
import 'package:nettapp/data/local_storage_services/local_storage.dart';
import 'package:nettapp/features/home/controller/home_controller.dart';
import 'package:nettapp/features/home/widgets/bottom_nav_bar.dart';
import 'package:nettapp/features/trade_visit/widgets/loader.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController{

  final homeController = Get.put(HomeController());
  Future<void> internetLogin({required String email, required String password}) async {
    Loader.progressIndicator(Get.context!);
    try{
      var body = {
        "identity": email,
        "password": password,
      };
      var response = await NetworkProvider().call(path: "/login", method: RequestMethod.post, body: body,);
      final data = LoginResponseModel.fromJson(response?.data);
      if(data.status.toString() == "200" || data.status.toString() == "201"){
        LoginLocalStorageModel loginDataModel = LoginLocalStorageModel();
        loginDataModel.password = password;
        loginDataModel.emailAddress = email;
        await LocalCachedData.instance.cacheUserCode(userCode: data.userCode.toString());
        await LocalCachedData.instance.cacheLoginModel(loginDataModel: loginDataModel);
        await LocalCachedData.instance.cacheFirstTimeUserStatus(firstTimeUser: false).then((value){
          homeController.getAllCategory();
          homeController.getAllChannel();
          homeController.getAllLocation();
          homeController.getAllOutletsFromRemoteServer();
          homeController.getAllTradeVisitFromRemoteServer();
          Get.back();
          Navigator.push(Get.context!, MaterialPageRoute(builder: (context)=> const BottomNavBarWidget()));
        });
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

  void performLocalAuthCheck({required String email, required String password}) async {
    log("local auth");
    Loader.progressIndicator(Get.context);
    final loginData = await LocalCachedData.instance.fetchLoginModel();
    Future.delayed(const Duration(seconds: 5), () async {
      if(loginData.emailAddress?.trim() == email.trim() && loginData.password?.trim() == password.trim()){
        homeController.getAllOutletsFromRemoteServer();
        homeController.getAllTradeVisitFromRemoteServer();
        Get.back();
        await LocalCachedData.instance.cacheFirstTimeUserStatus(firstTimeUser: false);
        Navigator.push(Get.context!, MaterialPageRoute(builder: (context)=> const BottomNavBarWidget()));
      }else{
        Get.back();
        Get.snackbar("Error", "Invalid credentials", colorText: Colors.white, backgroundColor: Colors.red);
      }
    }
    );
  }
}