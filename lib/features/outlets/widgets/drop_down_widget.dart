import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/widgets/text_widget.dart';

class DropDownInput extends StatefulWidget {
  const DropDownInput(
      {super.key,
      this.initialValue,
      required this.onChanged,
      required this.label,
      required this.options,
      this.enableSearch = false,
      required this.isMandatory});
  final String? initialValue;
  final void Function(dynamic)? onChanged;
  final String label;
  final List<DropDownValueModel> options;
  final bool enableSearch;
  final bool isMandatory;
  @override
  State<DropDownInput> createState() => _DropDownInputState();
}

class _DropDownInputState extends State<DropDownInput> {
  late SingleValueDropDownController _cnt;

  @override
  void initState() {
    _cnt = SingleValueDropDownController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
        left: 20,
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TextWidget(
                text: widget.label,
                color: const Color.fromARGB(255, 110, 111, 117),
                fontSize: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TextWidget(
                  text: widget.isMandatory ? "*" : "",
                  color: Colors.red,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: DropDownTextField(
              enableSearch: widget.enableSearch,
              initialValue: widget.initialValue,
              controller: _cnt,
              clearOption: true,
              // enableSearch: true,
              // dropdownColor: Colors.green,
              textFieldDecoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: AppColors.inputBorder)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: AppColors.inputBorder)),
              ),
              validator: (value) {
                if (value == null || value == "") {
                  return "This field is required";
                } else {
                  return null;
                }
              },
              dropDownItemCount: 6,
              dropDownList: widget.options,
              onChanged: widget.onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
