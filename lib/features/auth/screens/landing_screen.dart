import 'package:flutter/material.dart';
import 'package:nettapp/features/auth/widgets/call_to_action_widget.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/home.png"),
          const CallToActionWidget()
        ],
      ),
    );
  }
}
