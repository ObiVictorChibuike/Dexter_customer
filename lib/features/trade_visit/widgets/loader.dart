import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';

class Loader {
  static void progressIndicator(BuildContext? context) {
    showDialog(
        barrierDismissible: false,
        context: context!,
        builder: (context) => Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(top: 1),
            child:  Center(
              child: LoadingAnimationWidget.discreteCircle(
                color: AppColors.blue,
                secondRingColor: Colors.white,
                thirdRingColor: Colors.white,
                size: 50,
              ),
            )));

  }
}