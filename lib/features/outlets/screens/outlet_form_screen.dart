import 'package:flutter/material.dart';
import 'package:nettapp/features/auth/widgets/app_bar_row.dart';
import 'package:nettapp/features/outlets/widgets/outlet_form.dart';

class OutletFormScreen extends StatelessWidget {
  const OutletFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: const [AppBarRow(), OutletForm()],
      ),
    );
  }
}
