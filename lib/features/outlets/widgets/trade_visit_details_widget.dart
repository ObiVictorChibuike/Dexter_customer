import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:nettapp/data/local_storage_data_model/outlets/local_storage_outlet_model.dart';
import 'package:nettapp/data/local_storage_data_model/trade_visit/local_storage_tradevisit_model.dart';
import 'package:nettapp/data/local_storage_services/local_storage.dart';
import 'package:nettapp/features/outlets/widgets/product_details_alert.dart';
import 'package:nettapp/features/outlets/widgets/product_item.dart';

class TradeVisitDetailsWidget extends StatefulWidget {
  final OutletRequestModelResponse outletRequestModelResponse;
  const TradeVisitDetailsWidget({super.key, required this.outletRequestModelResponse});

  @override
  State<TradeVisitDetailsWidget> createState() => _TradeVisitDetailsWidgetState();
}

class _TradeVisitDetailsWidgetState extends State<TradeVisitDetailsWidget> {
  List<ListTradeVisitResponseModel>? tradeVisitList = <ListTradeVisitResponseModel>[];
  void getTradeVisitList()async{
    final data = await LocalCachedData.instance.getAllTradeVisitList();
    tradeVisitList  = data.where((element) => element.outletCode.toString() == widget.outletRequestModelResponse.outletcode.toString()).toList();
    log(tradeVisitList!.length.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return tradeVisitList!.isEmpty?
    Center(
      child: Column(
        children: [
          const SizedBox(height: 30,),
          Image.asset("assets/images/empty_folder.png", width: 120, height: 120,),
          const SizedBox(height: 15,),
          Text("No trade visit record", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),),
        ],
      ),
    ) :
      ListView(
      padding: const EdgeInsets.all(0),
      children: [
        ...List.generate(tradeVisitList!.length, (index){
          return  ProductItem(
            product: tradeVisitList?[index].sku ?? "",
            price: tradeVisitList?[index].price ?? "",
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ProductDetailsAlert(tradeList: tradeVisitList?[index],);
                },
              );
            },
          );
        }),
      ],
    );
  }

  @override
  void initState() {
    getTradeVisitList();
    super.initState();
  }
}
