import 'package:fff/utills/constants.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class NGO_GA_ListScreen extends StatefulWidget {
  const NGO_GA_ListScreen({super.key});

  @override
  State<NGO_GA_ListScreen> createState() => _NGO_GA_ListScreenState();
}

// ignore: camel_case_types
class _NGO_GA_ListScreenState extends State<NGO_GA_ListScreen> {
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
        child: Text("It's NGO / GA List Page"),
      ),
    );
  }
}
