import 'package:flutter/material.dart';
import 'package:nettapp/core/widgets/text_widget.dart';

class AppAction extends StatelessWidget {
  const AppAction({super.key, required this.image, required this.label});
  final String image;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
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
    );
  }
}
