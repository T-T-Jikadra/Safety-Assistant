import 'package:fff/Utils/constants.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Digital_Guide_Screen extends StatefulWidget {
  const Digital_Guide_Screen({super.key});

  @override
  State<Digital_Guide_Screen> createState() => _Digital_Guide_ScreenState();
}

// ignore: camel_case_types
class _Digital_Guide_ScreenState extends State<Digital_Guide_Screen> {
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
        title: const Text("$appbar_display_name - Digital Survival Guide"),
      ),
      body: const Center(
        child: Text("It's Digital Survival Guide"),
      ),
    );
  }
}
