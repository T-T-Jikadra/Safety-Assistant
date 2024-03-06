import 'package:flutter/material.dart';

import '../../../Utils/constants.dart';

// ignore: camel_case_types
class alert_Screen extends StatefulWidget {
  const alert_Screen({super.key});

  @override
  State<alert_Screen> createState() => _alert_ScreenState();
}

// ignore: camel_case_types
class _alert_ScreenState extends State<alert_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 50,
        backgroundColor: Colors.white24,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25))),
        title: const Text("$appbar_display_name - alert Page"),
      ),
      body: const Center(
        child: Text("It's alert Page"),
      ),
    );
  }
}
