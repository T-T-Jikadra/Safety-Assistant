// ignore_for_file: camel_case_types, file_names
import 'package:flutter/material.dart';

import '../../../Utils/constants.dart';

class NGO_Profile extends StatefulWidget {
  const NGO_Profile({super.key});

  @override
  State<NGO_Profile> createState() => _NGO_ProfileState();
}

class _NGO_ProfileState extends State<NGO_Profile> {
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
        title: const Text("$appbar_display_name - NGO Profile"),
      ),
      body: const Center(
        child: Text("It's NGO profile"),
      ),
    );
  }
}
