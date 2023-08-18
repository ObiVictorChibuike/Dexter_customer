import 'package:flutter/material.dart';
import 'package:nettapp/features/outlets/widgets/filter_form.dart';

void showFilter(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.53,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: Column(
              children: [
                Flexible(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                FilterForm()
              ],
            ),
          ));
    },
  );
}
