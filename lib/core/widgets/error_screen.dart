import 'package:flutter/material.dart';
import 'package:nettapp/core/widgets/text_widget.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TextWidget(text: "Route Does Not Exist"),
      ),
    );
  }
}
