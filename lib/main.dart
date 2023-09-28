import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nettapp/config/bindings/app_bindings.dart';
import 'package:nettapp/config/router/app_router.dart';
import 'package:nettapp/core/utils/local_session_manager.dart';
import 'package:nettapp/data/local_storage_services/local_storage.dart';
import 'package:nettapp/features/home/controller/home_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<LocalCachedData>(await LocalCachedData.create());
  final homeController = Get.put(HomeController());
  await LocalSessionManager().init();
  final isFirstTimeUser = await LocalCachedData.instance.fetchFirstTimeUserStatus();
  if(isFirstTimeUser != null && isFirstTimeUser != false){
    var connectivityResult = await Connectivity().checkConnectivity();
    if (!(connectivityResult == ConnectivityResult.none)) {
      homeController.getAllCategory();
      homeController.getAllChannel();
      homeController.getAllLocation();
      homeController.getAllOutletsFromRemoteServer();
      homeController.getAllTradeVisitFromRemoteServer();
      homeController.syncSchedulesFromRemoteServer();
    }
  }else{
    null;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: GetMaterialApp(
        initialBinding: InitialBindings(),
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
