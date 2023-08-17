import 'package:flutter/material.dart';

class AppBarRow extends StatelessWidget {
  const AppBarRow({super.key, this.secondWidget});
  final Widget? secondWidget;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Image.asset(
              "assets/images/logo.png",
              width: 150,
            ),
          ),
          secondWidget ?? const Text("")
        ],
      ),
    );
  }
}
