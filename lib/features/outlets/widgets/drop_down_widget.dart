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
      this.enableSearch = false});
  final String? initialValue;
  final void Function(dynamic)? onChanged;
  final String label;
  final List<DropDownValueModel> options;
  final bool enableSearch;

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
          TextWidget(
            text: widget.label,
            color: const Color.fromARGB(255, 110, 111, 117),
            fontSize: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: DropDownTextField(
              enableSearch: widget.enableSearch,
              initialValue: widget.initialValue,
              controller: _cnt,
              clearOption: true,
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
                if (value == null) {
                  return "Required field";
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

List<DropDownValueModel> customers = [
  const DropDownValueModel(name: 'John Stores', value: "John Stores"),
  const DropDownValueModel(
    name: 'Exquisite Rumours',
    value: "Exquisite Rumours",
  ),
  const DropDownValueModel(name: 'Fobbs lounge', value: "Fobbs Lounge"),
  const DropDownValueModel(
    name: 'Addide',
    value: "Addide",
  )
];

List<DropDownValueModel> brands = [
  const DropDownValueModel(name: 'Moet & Chandon', value: "Moet & Chandon"),
];

List<DropDownValueModel> brandCategories = [
  const DropDownValueModel(name: 'Sprit', value: "Sprit"),
  const DropDownValueModel(
    name: 'Wines',
    value: "Wines",
  ),
];

List<DropDownValueModel> categories = [
  const DropDownValueModel(name: 'Drink Vendor', value: "Drink Vendor"),
];

List<DropDownValueModel> products = [
  const DropDownValueModel(
      name: 'Moet nectar imperial rose 75cl',
      value: "Moet nectar imperial rose 75cl"),
  const DropDownValueModel(
      name: 'Moet nectar imperial rose ', value: "Moet nectar imperial rose "),
  const DropDownValueModel(
    name: 'Hennessy VS 70cl',
    value: "Hennessy VS 70cl",
  ),
  const DropDownValueModel(name: 'Hennessy VS 35cl', value: "Hennessy VS 35cl"),
];

List<DropDownValueModel> types = [
  const DropDownValueModel(name: 'Opening Stock', value: "Opening Stock"),
  const DropDownValueModel(
    name: 'Sales',
    value: "Sales",
  ),
  const DropDownValueModel(name: 'Purchase', value: "Purchase"),
  const DropDownValueModel(
    name: 'Closing Stock',
    value: "Closing Stock",
  )
];
