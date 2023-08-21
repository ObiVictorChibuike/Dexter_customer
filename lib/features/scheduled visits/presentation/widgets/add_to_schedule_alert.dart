import 'package:flutter/material.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/constants/lists.dart';
import 'package:nettapp/core/widgets/text_widget.dart';
import 'package:nettapp/features/outlets/widgets/drop_down_widget.dart';

showAddVisitAlert(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const AddToScheduleAlert();
    },
  );
}

class AddToScheduleAlert extends StatelessWidget {
  const AddToScheduleAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      actions: <Widget>[
        TextButton(
          child: const TextWidget(
            text: "Cancel",
            fontSize: 20,
            color: AppColors.blue,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const TextWidget(
            text: "OK",
            fontSize: 20,
            color: AppColors.blue,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
      content: Container(
          height: 280,
          width: 600,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: TextWidget(
                  text: "Add New Visit",
                  fontSize: 18,
                  color: AppColors.blue,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              DropDownInput(
                  onChanged: (val) {},
                  label: "Select outlet",
                  options: const [],
                  isMandatory: true),
              DropDownInput(
                  onChanged: (val) {},
                  label: "Select day",
                  options: getDaysOfTheWeek(),
                  isMandatory: true),
            ],
          )),
    );
  }
}
