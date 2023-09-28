import 'package:flutter/material.dart';
import 'package:nettapp/features/auth/widgets/app_bar_row.dart';
import 'package:nettapp/features/outlets/widgets/outlet_form.dart';

class OutletFormScreen extends StatefulWidget {
  const OutletFormScreen({super.key});

  @override
  State<OutletFormScreen> createState() => _OutletFormScreenState();
}

class _OutletFormScreenState extends State<OutletFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: const [AppBarRow(), OutletForm()],
      ),
    );
  }
}
