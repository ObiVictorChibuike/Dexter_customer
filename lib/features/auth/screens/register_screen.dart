import 'package:flutter/material.dart';
import 'package:nettapp/features/auth/widgets/app_bar_row.dart';
import 'package:nettapp/features/auth/widgets/line_widget.dart';
import 'package:nettapp/features/auth/widgets/registration_form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Image.asset("assets/images/hurray!.png"),
              ListView(
                physics: const BouncingScrollPhysics(),
                children: const [
                  AppBarRow(), LineWidget(), RegistrationForm()
                ],
              ),
            ],
          ),
        )
    );
  }
}
