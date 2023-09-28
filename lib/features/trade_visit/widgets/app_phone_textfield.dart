import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';

class AppPhoneTextField extends StatelessWidget {
  const AppPhoneTextField({
    Key? key,
    this.initialValue,
    this.hintText,
    this.inputFormatters,
    this.controller,
    this.suffixIcon,
    this.textInputAction,
    this.validator,
    this.prefixText,
    // this.suffix,
    this.obscureText,
    this.errorText,
    this.label,
    this.prefixIcon,
    this.fillColor,
    this.spaceBetweenSelectorAndTextField,
    this.onInputChanged,
  }) : super(key: key);

  final void Function(PhoneNumber)? onInputChanged;
  final TextEditingController? controller;
  final String? errorText;
  final String? hintText;
  final PhoneNumber? initialValue;
  final String? label;
  final Color? fillColor;
  final String? prefixText;
  final List<TextInputFormatter>? inputFormatters;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final double? spaceBetweenSelectorAndTextField;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Text(
          label!,
          style: TextStyle(
            color: fillColor != null ? Colors.black : Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        )
            : const SizedBox(),
        label != null ? const SizedBox(height: 8,) : const SizedBox(),
        InternationalPhoneNumberInput(
          countries: const ['GH', 'TG', 'NG'],
          onInputChanged: onInputChanged,
          validator: validator,
          spaceBetweenSelectorAndTextField: spaceBetweenSelectorAndTextField ?? 12,
          initialValue: initialValue,
          textFieldController: controller,
          textStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16,),
          searchBoxDecoration: InputDecoration(
            prefixIcon: suffixIcon,
            filled: true,
            suffixIcon: suffixIcon,
            fillColor: fillColor,
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
          inputDecoration: InputDecoration(
            prefixIcon: suffixIcon,
            filled: true,
            suffixIcon: suffixIcon,
            fillColor: fillColor,
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
      ],
    );
  }
}
