import 'package:flutter/material.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/widgets/text_widget.dart';

class ScheduledOutletItem extends StatelessWidget {
  const ScheduledOutletItem(
      {super.key,
      required this.outletName,
      required this.outletAddress,
      required this.onTap});
  final String outletName;
  final String outletAddress;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: outletName,
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextWidget(
                      text: outletAddress,
                      color: Colors.white,
                      fontSize: 14,
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: onTap,
                      child: const Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
