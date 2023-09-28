import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nettapp/config/router/routes.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/utils/form_mixin.dart';
import 'package:nettapp/data/local_storage_services/local_storage.dart';
import 'package:nettapp/features/auth/controller/auth_controller.dart';
import 'package:nettapp/features/auth/widgets/blue_button_widget.dart';
import 'package:nettapp/features/auth/widgets/footer_widget.dart';
import 'package:nettapp/features/auth/widgets/form_header.dart';
import 'package:nettapp/features/auth/widgets/input_field_widget.dart';
import 'package:nettapp/features/auth/widgets/remember_me_forgot_password_row.dart';
import 'package:nettapp/features/home/widgets/bottom_nav_bar.dart';
import 'package:nettapp/features/trade_visit/widgets/loader.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with FormMixin{
  final formKey = GlobalKey <FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
        builder: (controller){
      return Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FormHeader(
                      title: "Welcome Back!",
                      subTitle: "Login to your account",
                    ),
                    Image.asset("assets/images/okay.png", height: 30, width: 30,),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: InputFieldWidget(
                    controller: emailController,
                    labelColor: Colors.black,
                    hintSize: 13,
                    label: "Email Address",
                    hintText: "Enter your Email Address",
                    validator: isValidEmailAddress,
                  ),
                ),
                InputFieldWidget(
                  labelColor: Colors.black,
                  hintSize: 13, controller: passwordController,
                  label: "Password",
                  hintText: "Enter Password", validator: isRequired,
                  obscureText: obscureText,
                  suffixIcon: GestureDetector(
                      onTap: (){
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      child: obscureText == true ?  const Icon(Icons.visibility) : const Icon(Icons.visibility_off)),
                ),
                const RememberMeForgotPasswordRow(),
                BlueButtonWidget(
                    onTap: () async {
                      final isFirstTimeUser = await LocalCachedData.instance.fetchFirstTimeUserStatus();
                      if (isFirstTimeUser == false && isFirstTimeUser != null){
                          if(formKey.currentState!.validate()){
                            controller.performLocalAuthCheck(email: emailController.text, password: passwordController.text);
                          }
                      }else{
                        var connectivityResult = await Connectivity().checkConnectivity();
                        if (!(connectivityResult == ConnectivityResult.none)) {
                          if(formKey.currentState!.validate()){
                            controller.internetLogin(password: passwordController.text, email: emailController.text);
                          }
                        }else {
                          Get.snackbar("Internet Error", "Kindly enable your Internet", colorText: AppColors.white, backgroundColor: Colors.red);
                        }
                      }
                    }, label: "Login"),
              ],
            ),
            const FooterWidget()
          ],
        ),
      );
    });
  }
}
