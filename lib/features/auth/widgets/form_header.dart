import 'package:flutter/material.dart';
import 'package:nettapp/core/widgets/text_widget.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextWidget(
            text: title,
            fontSize: 34,
            fontWeight: FontWeight.w500,
          ),
          TextWidget(
            text: subTitle,
            fontSize: 16,
          )
        ],
      ),
    );
  }
}
