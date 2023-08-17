import 'package:flutter/material.dart';
import 'package:nettapp/config/router/routes.dart';
import 'package:nettapp/features/auth/widgets/blue_button_widget.dart';

class CallToActionWidget extends StatelessWidget {
  const CallToActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Image.asset(
            "assets/images/netapp_logo.png",
            width: 290,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        BlueButtonWidget(
          onTap: () {
            Navigator.pushNamed(context, Routes.login);
          },
          label: "Get Started",
        )
      ]),
    );
  }
}
