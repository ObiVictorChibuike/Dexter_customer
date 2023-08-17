import 'package:flutter/material.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/widgets/text_widget.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextWidget(
              text: title,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.blue,
            ),
          ),
          Row(
            children: [
              Flexible(
                child: Container(
                  height: 3,
                  width: double.infinity,
                  color: Colors.grey,
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  height: 3,
                  width: double.infinity,
                  color: AppColors.blue,
                ),
              ),
              Flexible(
                child: Container(
                  height: 3,
                  width: double.infinity,
                  color: Colors.grey,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
