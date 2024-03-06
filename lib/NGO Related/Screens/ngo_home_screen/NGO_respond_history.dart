import 'package:flutter/material.dart';

import '../../../Utils/constants.dart';

// ignore: camel_case_types
class NGO_Response_History_Screen extends StatefulWidget {
  const NGO_Response_History_Screen({super.key});

  @override
  State<NGO_Response_History_Screen> createState() => _NGO_Response_History_ScreenState();
}

// ignore: camel_case_types
class _NGO_Response_History_ScreenState extends State<NGO_Response_History_Screen> {
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
        title: const Text("$appbar_display_name - NGO response history Page"),
      ),
      body: const Center(
        child: Text("It's NGO response History Page"),
      ),
    );
  }
}
