import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:nettapp/config/router/routes.dart';
import 'package:nettapp/features/auth/controller/auth_controller.dart';
import 'package:nettapp/features/auth/screens/login_screen.dart';
import 'package:nettapp/features/auth/widgets/blue_button_widget.dart';
import 'package:nettapp/features/auth/widgets/footer_widget.dart';
import 'package:nettapp/features/auth/widgets/form_header.dart';
import 'package:nettapp/features/auth/widgets/input_field_widget.dart';
import 'package:nettapp/features/trade_visit/widgets/app_phone_textfield.dart';
import 'package:nettapp/features/trade_visit/widgets/loader.dart';


class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final GlobalKey<FormFieldState> key_1 = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> key_2 = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> key_3 = GlobalKey<FormFieldState>();
  bool? isValid = false;
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: Get.find<AuthController>(),
        builder: (controller){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FormHeader(
                      title: "Welcome Back",
                      subTitle: "Login to your account",
                    ),
                    Image.asset("assets/images/okay.png", height: 30, width: 30,),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: InputFieldWidget(
                    labelColor: Colors.black,
                    hintSize: 13,
                    label: "Email Address",
                    hintText: "Enter your Email Address",
                    textFieldkey: key_1,
                    onChanged: (val) {
                      isValid = key_1.currentState?.validate();
                    },
                  ),
                ),
                const SizedBox(height: 20,),
                AppPhoneTextField(
                  key: key_2,
                  validator: (value){

                  },
                  label: "Phone Number",
                  textInputAction: TextInputAction.next, spaceBetweenSelectorAndTextField: 4,
                  onInputChanged: (PhoneNumber value){
                    isValid = key_2.currentState?.validate();
                  },
                ),
                InputFieldWidget(
                    labelColor: Colors.black,
                    hintSize: 13,
                    label: "Password",
                    hintText: "",
                    textFieldkey: key_3,
                    obscureText: obscureText,
                    suffixIcon: GestureDetector(
                        onTap: (){
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        child: obscureText == true ?  const Icon(Icons.visibility) : const Icon(Icons.visibility_off)),
                    onChanged: (val) {
                      isValid = key_3.currentState?.validate();
                    }
                ),
                const SizedBox(height: 42,),
                BlueButtonWidget(
                    onTap: () {

                      // Navigator.pushNamed(context, Routes.home);
                    },
                    label: "Sign Up"),
              ],
            ),
            const FooterWidget()
          ],
        ),
      );
    });
  }
}
