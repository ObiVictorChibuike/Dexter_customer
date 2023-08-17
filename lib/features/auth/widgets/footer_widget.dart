import 'package:flutter/material.dart';
import 'package:nettapp/core/widgets/text_widget.dart';
import 'package:nettapp/features/auth/widgets/line_widget.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 190,
        ),
        LineWidget(),
        Row(
          children: [TextWidget(text: "© Copyright  2023.")],
        ),
      ],
    );
  }
}
