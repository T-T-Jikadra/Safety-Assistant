// ignore_for_file: camel_case_types, file_names
import 'package:flutter/material.dart';

import '../../Utils/constants.dart';

class NGO_Donation_History extends StatefulWidget {
  const NGO_Donation_History({super.key});

  @override
  State<NGO_Donation_History> createState() => _NGO_Donation_HistoryState();
}

class _NGO_Donation_HistoryState extends State<NGO_Donation_History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 50,
        backgroundColor: color_AppBar,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25))),
        title: const Text("NGO Donation history"),
      ),
      body: const Center(
        child: Text("It's NGO Donation history"),
      ),
    );
  }
}
