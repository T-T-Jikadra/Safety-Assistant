// ignore_for_file: non_constant_identifier_names

import 'package:fff/Utils/constants.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class User_Feedback_Screen extends StatefulWidget {
  final String authority_name;
  final String authority_id;
  final String respond_id;

  const User_Feedback_Screen(
      {super.key,
      required this.authority_name,
      required this.authority_id,
      required this.respond_id});

  @override
  State<User_Feedback_Screen> createState() => _User_Feedback_ScreenState();
}

// ignore: camel_case_types
class _User_Feedback_ScreenState extends State<User_Feedback_Screen> {
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
        title: const Text("$appbar_display_name - Submit Feedback"),
      ),
      body: Center(
        child: Text(
            "It's Submit feedback\n ${widget.authority_id} \n${widget.authority_name}\n ${widget.respond_id}"),
      ),
    );
  }
}
