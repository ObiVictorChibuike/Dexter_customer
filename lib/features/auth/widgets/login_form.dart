import 'package:flutter/material.dart';
import 'package:nettapp/config/router/routes.dart';
import 'package:nettapp/features/auth/widgets/blue_button_widget.dart';
import 'package:nettapp/features/auth/widgets/footer_widget.dart';
import 'package:nettapp/features/auth/widgets/form_header.dart';
import 'package:nettapp/features/auth/widgets/input_field_widget.dart';
import 'package:nettapp/features/auth/widgets/remember_me_forgot_password_row.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormFieldState> key_1 = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> key_2 = GlobalKey<FormFieldState>();
  final bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            const FormHeader(
              title: "Welcome Back",
              subTitle: "Login to your account",
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: InputFieldWidget(
                labelColor: Colors.black,
                hintSize: 13,
                label: "Email Address",
                hintText: "Enter your Email Address",
                textFieldkey: key_1,
                onChanged: (val) {},
              ),
            ),
            InputFieldWidget(
              labelColor: Colors.black,
              hintSize: 13,
              label: "Password",
              hintText: "",
              textFieldkey: key_2,
              obscureText: obscureText,
              suffixIcon: const Icon(Icons.visibility_off),
              onChanged: (val) {},
            ),
            const RememberMeForgotPasswordRow(),
            BlueButtonWidget(
                onTap: () {
                  Navigator.pushNamed(context, Routes.home);
                },
                label: "Login"),
          ],
        ),
        const FooterWidget()
      ],
    );
  }
}
