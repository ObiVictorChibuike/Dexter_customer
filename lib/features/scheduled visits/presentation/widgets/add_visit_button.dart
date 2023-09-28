import 'package:flutter/material.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/widgets/text_widget.dart';

class AddVisitButton extends StatelessWidget {
  const AddVisitButton({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(10)),
              child: const Row(
                children: [
                  TextWidget(
                    text: "Add visit",
                    fontSize: 15,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.add,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
