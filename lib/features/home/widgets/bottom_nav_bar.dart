import 'package:clean_dialog/clean_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/features/home/controller/home_controller.dart';
import 'package:nettapp/features/home/widgets/home_page.dart';
import 'package:nettapp/features/scheduled%20visits/controller/controller.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({super.key});

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int _selectedIndex = 0;
  final _controller = Get.put(HomeController());
  final visitController = Get.put(VisitController());
  @override
  void initState() {
    visitController.getOutletScheduleList();
    _controller.getAllOutletList();
    visitController.getCompletedTradeVisitList();
    visitController.getPendingVisits();
    super.initState();
  }
  // ignore: unused_field
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  showAlertDialog(){
    showDialog(
      context: context,
      builder: (context) => CleanDialog(
        title: 'Sync Data',
        content: "Do you want to sync your data?",
        backgroundColor: AppColors.blue,
        titleTextStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        contentTextStyle: const TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w400),
        actions: [
          CleanDialogActionButtons(
              actionTitle: 'Yes',
              textColor: AppColors.blue,
              onPressed: (){
                Navigator.pop(context);
                _controller.syncTradeVisit();
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if(_selectedIndex == 1){
      showAlertDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sync),
            label: 'Sync',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 174, 130, 71),
        onTap: (index) {
          _onItemTapped(index);
        },
      ),
    );
  }
}
