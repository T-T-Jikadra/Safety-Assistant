// ignore_for_file: camel_case_types, file_names
import 'package:flutter/material.dart';
import '../../Utils/constants.dart';

class Govt_Profile extends StatefulWidget {
  const Govt_Profile({super.key});

  @override
  State<Govt_Profile> createState() => _Govt_ProfileState();
}

class _Govt_ProfileState extends State<Govt_Profile> {
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
        title: const Text("$appbar_display_name - Govt profile"),
      ),
      body: const Center(
        child: Text("It's Govt profile"),
      ),
    );
  }
}
