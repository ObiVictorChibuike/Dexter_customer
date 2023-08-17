import 'package:flutter/material.dart';

import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/widgets/text_widget.dart';

class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget(
      {super.key,
      required this.label,
      this.initialValue,
      required this.hintText,
      this.hintSize = 14,
      required this.onChanged,
      this.validator,
      required this.textFieldkey,
      this.obscureText = false,
      this.suffixIcon,
      this.prefixicon,
      required this.labelColor});
  final String label;
  final String hintText;
  final double hintSize;
  final void Function(String?) onChanged;
  final String? Function(String?)? validator;
  final GlobalKey<FormFieldState> textFieldkey;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixicon;
  final String? initialValue;
  final Color labelColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextWidget(
              text: label,
              color: labelColor,
              fontSize: 15,
            ),
          ),
          TextFormField(
            key: textFieldkey,
            initialValue: initialValue,
            onChanged: onChanged,
            validator: validator,
            obscureText: obscureText,
            decoration: InputDecoration(
              prefixIcon: prefixicon,
              filled: true,
              suffixIcon: suffixIcon,
              fillColor: const Color(0xFFEEEEEE),
              hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.30000001192092896),
                  fontSize: hintSize),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 255, 0, 0),
                  width: 2.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 255, 0, 0),
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.inputGrey,
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.inputGrey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: hintText,
            ),
          ),
        ]),
      ),
    );
  }
}
