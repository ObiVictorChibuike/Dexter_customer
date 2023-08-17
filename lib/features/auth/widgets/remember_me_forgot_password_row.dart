import 'package:flutter/material.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/widgets/text_widget.dart';

class RememberMeForgotPasswordRow extends StatefulWidget {
  const RememberMeForgotPasswordRow({super.key});

  @override
  State<RememberMeForgotPasswordRow> createState() =>
      _RememberMeForgotPasswordRowState();
}

class _RememberMeForgotPasswordRowState
    extends State<RememberMeForgotPasswordRow> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                  side: const BorderSide(width: 1, color: Color(0xFFAAAAAA)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  value: isChecked,
                  onChanged: (val) {
                    setState(() {
                      isChecked = val;
                    });
                  }),
              const TextWidget(
                text: "Remember me",
                fontSize: 13,
              )
            ],
          ),
          const TextWidget(
            decoration: TextDecoration.underline,
            text: "Forgot Password?",
            color: AppColors.linkblue,
            fontSize: 13,
          )
        ],
      ),
    );
  }
}
