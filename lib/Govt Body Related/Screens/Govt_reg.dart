import 'package:flutter/material.dart';

import '../../Utils/constants.dart';

// ignore: camel_case_types
class Govt_Register extends StatefulWidget {
  const Govt_Register({super.key});

  @override
  State<Govt_Register> createState() => _Govt_RegisterState();
}

class _Govt_RegisterState extends State<Govt_Register> {
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
        title: const Text("$appbar_display_name - Govt Reg"),
      ),
      body: const Center(
        child: Text("It's Govt Reg"),
      ),
    );
  }
}
