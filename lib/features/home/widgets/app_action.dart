import 'package:flutter/material.dart';
import 'package:nettapp/core/widgets/text_widget.dart';

class AppAction extends StatelessWidget {
  const AppAction(
      {super.key, required this.image, required this.label, this.onTap});
  final String image;
  final String label;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          decoration: BoxDecoration(border: Border.all(width: .5)),
          child: Row(
            children: [
              Image.asset(
                "assets/images/$image.png",
                width: 30,
              ),
              const SizedBox(
                width: 20,
              ),
              TextWidget(
                text: label,
                fontSize: 13,
              )
            ],
          ),
        ),
      ),
    );
  }
}
