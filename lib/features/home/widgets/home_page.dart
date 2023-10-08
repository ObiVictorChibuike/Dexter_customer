import 'dart:async';
import 'package:clean_dialog/clean_dialog.dart';
import 'package:flutter/material.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/utils/local_session_manager.dart';
import 'package:nettapp/core/widgets/text_widget.dart';
import 'package:nettapp/data/local_storage_services/local_storage.dart';
import 'package:nettapp/features/auth/screens/login_screen.dart';
import 'package:nettapp/features/home/controller/home_controller.dart';
import 'package:nettapp/features/home/widgets/app_actions.dart';
import 'package:nettapp/features/auth/widgets/app_bar_row.dart';
import 'package:nettapp/features/home/widgets/summary_row.dart';
import 'package:get/get.dart';
import 'package:nettapp/features/scheduled%20visits/controller/controller.dart';
import 'package:nettapp/features/trade_visit/widgets/loader.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Get.put(HomeController());
  final visitController = Get.put(VisitController());
  showNoticeDialog(){
    showDialog(
      context: context,
      builder: (context) => CleanDialog(
        title: 'Sync Data Notice!',
        content: "This application storage use your local storage. To avoid data loss, ensure you sync your data before you uninstalling this application.",
        backgroundColor: AppColors.blue,
        titleTextStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        contentTextStyle: const TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w400),
        actions: [
          CleanDialogActionButtons(
              actionTitle: 'Ok',
              textColor: AppColors.blue,
              onPressed: (){
                Navigator.pop(context);
              }
          ),
        ],
      ),
    );
  }

  notice()async{
    final isFirstTimeUser = await LocalCachedData.instance.fetchFirstTimeUserStatus();
    if(isFirstTimeUser == true){
      Timer(const Duration(seconds: 2), () {
        showNoticeDialog();
      });
    }else{
      null;
    }
  }
  @override
  void initState() {
    visitController.getOutletScheduleList();
    _controller.getAllOutletList();
    visitController.getCompletedTradeVisitList();
    visitController.getPendingVisits();
    notice();
    super.initState();
  }

  showAlertDialog(){
    showDialog(
      context: context,
      builder: (context) => CleanDialog(
        title: 'Log Out',
        content: "Are you sure you want to log out of NETAPP?",
        backgroundColor: AppColors.blue,
        titleTextStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        contentTextStyle: const TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w400),
        actions: [
          CleanDialogActionButtons(
              actionTitle: 'Yes',
              textColor: AppColors.blue,
              onPressed: (){
                Navigator.pop(context);
                Loader.progressIndicator(context);
                LocalSessionManager localSessionManager = LocalSessionManager();
                Future.delayed(const Duration(seconds: 5), () async {
                  Get.back();
                  localSessionManager.authStatusVal = false;
                  await LocalCachedData.instance.clearLoginModel();
                  await LocalCachedData.instance.cacheFirstTimeUserStatus(firstTimeUser: true);
                  Get.offUntil( MaterialPageRoute(builder: (BuildContext context)=> const LoginScreen()), (route) => false);
                });
              }
          ),
          CleanDialogActionButtons(
              actionTitle: 'No',
              textColor: Colors.red,
              onPressed: (){
                Navigator.pop(context);
              }
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    visitController.getOutletScheduleList();
    _controller.getAllOutletList();
    visitController.getCompletedTradeVisitList();
    visitController.getPendingVisits();
    return GetBuilder<HomeController>(
      init: HomeController(),
        builder: (controller){
      return RefreshIndicator(
          onRefresh: ()async{
            visitController.getOutletScheduleList();
            _controller.getAllOutletList();
            visitController.getCompletedTradeVisitList();
            visitController.getPendingVisits();
          },
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: GestureDetector(
                      onTap: (){
                        showAlertDialog();
                      },
                      child: AppBarRow(
                        secondWidget: Image.asset(
                          "assets/images/logout.png",
                          width: 25,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(0),
                      children: [
                        GetBuilder<HomeController>(
                            init: HomeController(),
                            builder: (controller){
                              return Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: AppColors.blue, borderRadius: BorderRadius.circular(8)),
                                  height: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const TextWidget(
                                        text: "Overview",
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SummaryRow(
                                        label: "Registered Outlets",
                                        value: _controller.totalNumberOfRegisteredOutlets.value,
                                      ),
                                      SummaryRow(
                                        label: "Scheduled Outlets",
                                        value: _controller.outletsWithMondayScheduledVisit.length + _controller.outletsWithTuesdayScheduledVisit.length +
                                            _controller.outletsWithWednesdayScheduledVisit.length + _controller.outletsWithThursdayScheduledVisit.length + _controller.outletsWithFridayScheduledVisit.length,
                                      ),
                                       SummaryRow(
                                        label: "Completed Visits",
                                        value: visitController.completedVisit.value,
                                      ),
                                       SummaryRow(
                                        label: "Pending Visits",
                                        value: visitController.pendingVisit.value,
                                      )
                                    ],
                                  ));
                            }),
                        // SummaryView(outletResponse: _controller.createdOutletList),
                        const AppActions()
                      ],
                    ),
                  )
                ],
              ),
            ),
          ));
    });
  }
}
