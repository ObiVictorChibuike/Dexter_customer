import 'package:flutter/material.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/utils/custom_date.dart';
import 'package:nettapp/core/widgets/text_widget.dart';
import 'package:nettapp/data/local_storage_data_model/outlets/local_storage_outlet_model.dart';

class OutletItem extends StatelessWidget {
  const OutletItem({super.key, this.outletRequestModelResponse});
  final OutletRequestModelResponse? outletRequestModelResponse;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 2, color: AppColors.inputGrey))),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            text: outletRequestModelResponse!.name,
            fontSize: 14,
          ),
          TextWidget(
            text: CustomDate.slash(outletRequestModelResponse?.lastvisit.toString() ?? DateTime.now().toString()),
            fontSize: 14,
          ),
        ],
      ),
    );
  }
}
