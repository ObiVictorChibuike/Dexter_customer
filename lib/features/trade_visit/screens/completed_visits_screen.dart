import 'dart:developer';

import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/utils/custom_date.dart';
import 'package:nettapp/core/widgets/text_widget.dart';
import 'package:nettapp/data/local_storage_data_model/trade_visit/local_storage_tradevisit_model.dart';
import 'package:nettapp/data/local_storage_services/local_storage.dart';
import 'package:nettapp/features/auth/widgets/app_bar_row.dart';
import 'package:nettapp/features/scheduled%20visits/controller/controller.dart';


class CompletedVisitsScreen extends StatefulWidget {
  const CompletedVisitsScreen({super.key});

  @override
  State<CompletedVisitsScreen> createState() => _CompletedVisitsScreenState();
}

class _CompletedVisitsScreenState extends State<CompletedVisitsScreen> {


  @override
  Widget build(BuildContext context) {
    return GetBuilder<VisitController>(
      init: VisitController(),
        builder: (controller){
      return Scaffold(
        body: ListView(
          children:   [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: AppBarRow(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30),
              child: Column(
                children: [
                  const TextWidget(
                      text:
                      "Visits that have been completed for the week will appear here"),
                  const SizedBox(
                    height: 20,
                  ),
                  Accordion(
                    headerBackgroundColorOpened: Colors.black54,
                    scaleWhenAnimating: true,
                    openAndCloseAnimation: true,
                    sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
                    sectionClosingHapticFeedback: SectionHapticFeedback.light,
                    children: [
                      AccordionSection(
                        isOpen: false,
                        headerPadding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                        headerBackgroundColor: AppColors.blue,

                        headerBackgroundColorOpened: AppColors.blue,
                        header: const TextWidget(
                          text: 'Monday',
                          color: Colors.white,
                          fontSize: 23,
                        ),
                        content:
                        controller.tradeVisitListMonday!.isEmpty?
                        Center(
                          child: Column(
                            children: [
                              const SizedBox(height: 30,),
                              Image.asset("assets/images/empty_folder.png", width: 120, height: 120,),
                              const SizedBox(height: 15,),
                              Text("No completed visit record", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),),
                            ],
                          ),
                        ) : Column(
                          children: [
                            ...List.generate(controller.tradeVisitListMonday!.length, (index){
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: SizedBox(
                                  width: 300,
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            text: controller.tradeVisitListMonday?[index].outletName ?? "",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                          TextWidget(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            text: controller.tradeVisitListMonday?[index].brand ?? "",
                                          )
                                        ],
                                      ),
                                      TextWidget(
                                        text: CustomDate.slash(controller.tradeVisitListMonday?[index].lastvisit.toString() ?? DateTime.now().toString()),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })
                          ],
                        ),
                        contentBackgroundColor: const Color(0xFFEEEEEE),
                        contentBorderColor: AppColors.blue,
                        contentHorizontalPadding: 0.0,
                        contentBorderWidth: 1,

                        // onOpenSection: () => print('onOpenSection ...'),
                        // onCloseSection: () => print('onCloseSection ...'),
                      ),
                      AccordionSection(
                        isOpen: false,
                        headerPadding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                        headerBackgroundColor: AppColors.blue,

                        headerBackgroundColorOpened: AppColors.blue,
                        header: const TextWidget(
                          text: 'Tuesday',
                          color: Colors.white,
                          fontSize: 23,
                        ),
                        content: controller.tradeVisitListTuesday!.isEmpty?
                        Center(
                          child: Column(
                            children: [
                              const SizedBox(height: 30,),
                              Image.asset("assets/images/empty_folder.png", width: 120, height: 120,),
                              const SizedBox(height: 15,),
                              Text("No completed visit record", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),),
                            ],
                          ),
                        ) : Column(
                          children: [
                            ...List.generate(controller.tradeVisitListTuesday!.length, (index){
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: SizedBox(
                                  width: 300,
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            text: controller.tradeVisitListTuesday?[index].outletName ?? "",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                          TextWidget(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            text: controller.tradeVisitListTuesday?[index].brand ?? "",
                                          )
                                        ],
                                      ),
                                      TextWidget(
                                        text: CustomDate.slash(controller.tradeVisitListTuesday?[index].lastvisit.toString() ?? DateTime.now().toString()),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })
                          ],
                        ),
                        contentBackgroundColor: const Color(0xFFEEEEEE),
                        contentBorderColor: AppColors.blue,
                        contentHorizontalPadding: 0.0,
                        contentBorderWidth: 1,

                        // onOpenSection: () => print('onOpenSection ...'),
                        // onCloseSection: () => print('onCloseSection ...'),
                      ),
                      AccordionSection(
                        isOpen: false,
                        headerPadding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                        headerBackgroundColor: AppColors.blue,

                        headerBackgroundColorOpened: AppColors.blue,
                        header: const TextWidget(
                          text: 'Wednesday',
                          color: Colors.white,
                          fontSize: 23,
                        ),
                        content: controller.tradeVisitListWednesday!.isEmpty?
                        Center(
                          child: Column(
                            children: [
                              const SizedBox(height: 30,),
                              Image.asset("assets/images/empty_folder.png", width: 120, height: 120,),
                              const SizedBox(height: 15,),
                              Text("No completed visit record", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),),
                            ],
                          ),
                        ) : Column(
                          children: [
                            ...List.generate(controller.tradeVisitListWednesday!.length, (index){
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: SizedBox(
                                  width: 300,
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            text: controller.tradeVisitListWednesday?[index].outletName ?? "",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                          TextWidget(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            text: controller.tradeVisitListWednesday?[index].brand ?? "",
                                          )
                                        ],
                                      ),
                                      TextWidget(
                                        text: CustomDate.slash(controller.tradeVisitListWednesday?[index].lastvisit.toString() ?? DateTime.now().toString()),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })
                          ],
                        ),
                        contentBackgroundColor: const Color(0xFFEEEEEE),
                        contentBorderColor: AppColors.blue,
                        contentHorizontalPadding: 0.0,
                        contentBorderWidth: 1,

                        // onOpenSection: () => print('onOpenSection ...'),
                        // onCloseSection: () => print('onCloseSection ...'),
                      ),
                      AccordionSection(
                        isOpen: false,
                        headerPadding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                        headerBackgroundColor: AppColors.blue,

                        headerBackgroundColorOpened: AppColors.blue,
                        header: const TextWidget(
                          text: 'Thursday',
                          color: Colors.white,
                          fontSize: 23,
                        ),
                        content: controller.tradeVisitListThursday!.isEmpty?
                        Center(
                          child: Column(
                            children: [
                              const SizedBox(height: 30,),
                              Image.asset("assets/images/empty_folder.png", width: 120, height: 120,),
                              const SizedBox(height: 15,),
                              Text("No completed visit record", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),),
                            ],
                          ),
                        ) : Column(
                          children: [
                            ...List.generate(controller.tradeVisitListThursday!.length, (index){
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: SizedBox(
                                  width: 300,
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            text: controller.tradeVisitListThursday?[index].outletName ?? "",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                          TextWidget(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            text: controller.tradeVisitListThursday?[index].brand ?? "",
                                          )
                                        ],
                                      ),
                                      TextWidget(
                                        text: CustomDate.slash(controller.tradeVisitListThursday?[index].lastvisit.toString() ?? DateTime.now().toString()),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })
                          ],
                        ),
                        contentBackgroundColor: const Color(0xFFEEEEEE),
                        contentBorderColor: AppColors.blue,
                        contentHorizontalPadding: 0.0,
                        contentBorderWidth: 1,

                        // onOpenSection: () => print('onOpenSection ...'),
                        // onCloseSection: () => print('onCloseSection ...'),
                      ),
                      AccordionSection(
                        isOpen: false,
                        headerPadding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                        headerBackgroundColor: AppColors.blue,

                        headerBackgroundColorOpened: AppColors.blue,
                        header: const TextWidget(
                          text: 'Friday',
                          color: Colors.white,
                          fontSize: 23,
                        ),
                        content: controller.tradeVisitListFriday!.isEmpty?
                        Center(
                          child: Column(
                            children: [
                              const SizedBox(height: 30,),
                              Image.asset("assets/images/empty_folder.png", width: 120, height: 120,),
                              const SizedBox(height: 15,),
                              Text("No completed visit record", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),),
                            ],
                          ),
                        ) : Column(
                          children: [
                            ...List.generate(controller.tradeVisitListFriday!.length, (index){
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: SizedBox(
                                  width: 300,
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            text: controller.tradeVisitListFriday?[index].outletName ?? "",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                          TextWidget(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            text: controller.tradeVisitListFriday?[index].brand ?? "",
                                          )
                                        ],
                                      ),
                                      TextWidget(
                                        text: CustomDate.slash(controller.tradeVisitListFriday?[index].lastvisit.toString() ?? DateTime.now().toString()),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })
                          ],
                        ),
                        contentBackgroundColor: const Color(0xFFEEEEEE),
                        contentBorderColor: AppColors.blue,
                        contentHorizontalPadding: 0.0,
                        contentBorderWidth: 1,

                        // onOpenSection: () => print('onOpenSection ...'),
                        // onCloseSection: () => print('onCloseSection ...'),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
