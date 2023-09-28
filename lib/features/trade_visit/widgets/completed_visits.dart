import 'package:flutter/material.dart';
import 'package:nettapp/config/router/routes.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/widgets/text_widget.dart';
import 'package:nettapp/features/auth/widgets/input_field_widget.dart';
import 'package:get/get.dart';
import 'package:nettapp/features/home/controller/home_controller.dart';
import 'package:nettapp/features/outlets/widgets/outlet_item.dart';

class CompletedVisitsList extends StatefulWidget {
  const CompletedVisitsList({super.key});

  @override
  State<CompletedVisitsList> createState() => _OutletListState();
}

class _OutletListState extends State<CompletedVisitsList> {
  final GlobalKey<FormFieldState> key_1 = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: InputFieldWidget(
              label: "",
              hintText: "Search for outlet",
              onChanged: (val) {},
              textFieldkey: key_1,
              fillColor: Colors.transparent,
              suffixIcon: Transform.scale(
                scale: .4,
                child: Image.asset(
                  "assets/images/search_icon.png",
                  width: 10,
                ),
              ),
              labelColor: Colors.black),
        ),
        GetBuilder<HomeController>(
            init: HomeController(),
            builder: (controller){
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    margin: const EdgeInsets.only(top: 50, bottom: 20),
                    decoration: const BoxDecoration(color: AppColors.blue),
                    child:  const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: "Outlet Name",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        TextWidget(
                          text: "Last Visited",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  controller.createdOutletList.isEmpty ?
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/empty_folder.png",
                          width: 40,
                        ),
                        const SizedBox(height: 15,),
                        Text("No Outlet", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 18, fontWeight: FontWeight.w400),),
                      ],
                    ),
                  ) :
                  Column(
                    children: [
                      ...List.generate(controller.createdOutletList.length, (index){
                        return GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, Routes.tradeVisitDetails);
                          },
                          child: OutletItem(
                            outletRequestModelResponse: controller.createdOutletList[index],
                          ),
                        );
                      }),
                    ],
                  )
                ],
              );
            })
      ],
    );
  }
}
