import 'package:flutter/material.dart';

import '../../Utils/constants.dart';

// ignore: camel_case_types
class notice_Screen extends StatefulWidget {
  const notice_Screen({super.key});

  @override
  State<notice_Screen> createState() => _notice_ScreenState();
}

// ignore: camel_case_types
class _notice_ScreenState extends State<notice_Screen> {
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
        title: const Text("$appbar_display_name - Notice Page"),
      ),
      body: const Center(
        child: Text("It's Notice Page"),
      ),
    );
  }
}
