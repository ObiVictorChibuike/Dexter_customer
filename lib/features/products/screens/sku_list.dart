import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/widgets/outlined_container.dart';
import 'package:nettapp/core/widgets/text_widget.dart';
import 'package:nettapp/data/local_storage_data_model/trade_visit/local_storage_tradevisit_model.dart';
import 'package:nettapp/data/local_storage_services/local_storage.dart';
import 'package:nettapp/features/auth/widgets/app_bar_row.dart';
import 'package:nettapp/features/auth/widgets/blue_button_widget.dart';
import 'package:nettapp/features/auth/widgets/input_field_widget.dart';
import 'package:nettapp/features/outlets/widgets/drop_down_widget.dart';
import 'package:nettapp/features/products/widgets/product_item.dart';

class SkuListScreen extends StatefulWidget {
  const SkuListScreen({super.key});

  @override
  State<SkuListScreen> createState() => _SkuListScreenState();
}

class _SkuListScreenState extends State<SkuListScreen> {
  TextEditingController query = TextEditingController();
  String? category;
  String? brand;
  String? outlet;
  void showFilter({required BuildContext context, required void Function() onTap}) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.6,
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: Column(
                children: [
                  const Flexible(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  OutlinedContainer(
                    content: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DropDownInput(
                            isMandatory: false,
                            onChanged: (val) {
                              category = val.name;
                            },
                            label: "Filter by Category:",
                            enableSearch: true,
                            options: productsList.map((e) => DropDownValueModel(name: e.category?.toString() ?? "", value: e.category.toString()))?.toList() ?? [],
                          ),
                          DropDownInput(
                              isMandatory: false,
                              onChanged: (val) {
                                brand = val.name;
                              },
                              label: "Filter by Brand:",
                              options: productsList.map((e) => DropDownValueModel(name: e.brand?.toString() ?? "", value: e.brand.toString()))?.toList() ?? []) ,
                          DropDownInput(
                            isMandatory: false,
                            onChanged: (val) {
                              outlet = val.name;
                            },
                            label: "Filter by Outlet:",
                            enableSearch: true,
                            options: productsList.map((e) => DropDownValueModel(name: e.outletName?.toString() ?? "", value: e.outletName.toString()))?.toList() ?? [],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: BlueButtonWidget(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                label: "Filter"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:  [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: AppBarRow(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: InputFieldWidget(
                controller: query,
                label: "",
                hintText: "Search for outlet",
                onChanged: (val) async {
                  if(query.text.isEmpty){
                    productsList = await LocalCachedData.instance.getAllTradeVisitList();
                    setState(() {});
                  }else{
                    final outlet = productsList.where((outlet){
                      if (outlet.outletName!.toLowerCase().contains(query.text.toLowerCase())){
                        return true;
                      } else if (outlet.sku!.toLowerCase().contains(query.text.toLowerCase())) {
                        return true;
                      } else if(outlet.brand!.toLowerCase().contains(query.text.toLowerCase())){
                        return true;
                      }else{
                        return false;
                      }
                    }).toList();
                    setState(() {
                      productsList = outlet;
                    });
                  }
                },
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            margin: const EdgeInsets.only(top: 50, bottom: 20),
            decoration: const BoxDecoration(color: AppColors.blue),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextWidget(
                  text: "Category",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                Transform.translate(
                  offset: const Offset(-10, 0),
                  child: const TextWidget(
                    text: "Outlet",
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextWidget(
                  text: "Brand",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          productsList.isEmpty ?
          Center(
            child: Column(
              children: [
                const SizedBox(height: 30,),
                Image.asset("assets/images/empty_folder.png", width: 120, height: 120,),
                const SizedBox(height: 15,),
                Text("No Product Record", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),),
              ],
            ),
          ) :
          Column(
            children: [
              ...List.generate(productsList.length, (index){
                final data = productsList[index];
                return ProductItem(
                  onTap: () {

                  }, productName: data.sku ?? "", outletName: data.outletName ?? "", productBrand: data.brand ?? "",
                );
              })
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blue,
        child: const Icon(
          Icons.filter_list,
          size: 30,
        ),
        onPressed: () {
          showFilter(context: context, onTap: (){
            
          });
          // showProductFilter(context);
        },
      ),
    );
  }

  List<ListTradeVisitResponseModel> productsList = <ListTradeVisitResponseModel>[];
  getProducts()async{
    final data = await LocalCachedData.instance.getAllTradeVisitList();
    productsList = data;
    setState(() {});
  }

  @override
  void initState() {
    getProducts();
    super.initState();
  }
}
