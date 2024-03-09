import 'package:fff/Utils/constants.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Open_Response_Screen extends StatefulWidget {
  const Open_Response_Screen({super.key});

  @override
  State<Open_Response_Screen> createState() => _Open_Response_ScreenState();
}

// ignore: camel_case_types
class _Open_Response_ScreenState extends State<Open_Response_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 50,
        backgroundColor: Colors.black12,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25))),
        title: const Text("$appbar_display_name - Open Response"),
      ),
      body: const Center(
        child: Text("Open Response"),
      ),
    );
  }
}
