import 'package:flutter/material.dart';
import 'package:nettapp/features/outlets/widgets/custom_alert_dialog.dart';

showAlert(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomAlertDialog(
        title: 'Alert Title',
        message: 'This is a customizable alert message.',
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}
