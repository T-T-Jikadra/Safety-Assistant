import 'package:flutter/material.dart';

import '../../utills/constants.dart';

// ignore: camel_case_types
class Request_History_Screen extends StatefulWidget {
  const Request_History_Screen({super.key});

  @override
  State<Request_History_Screen> createState() => _Request_History_ScreenState();
}

// ignore: camel_case_types
class _Request_History_ScreenState extends State<Request_History_Screen> {
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
        title: const Text(appbar_display_name),
      ),
      body: const Center(
        child: Text("It's Request History Page"),
      ),
    );
  }
}
