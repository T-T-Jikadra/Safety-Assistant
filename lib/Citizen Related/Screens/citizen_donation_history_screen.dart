import 'package:flutter/material.dart';

// ignore: camel_case_types
class Donation_History_Screen extends StatefulWidget {
  const Donation_History_Screen({super.key});

  @override
  State<Donation_History_Screen> createState() => _Donation_History_ScreenState();
}

// ignore: camel_case_types
class _Donation_History_ScreenState extends State<Donation_History_Screen> {
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
        title: const Text("Donation History"),
      ),
      body: const Center(
        child: Text("It's Donation History Page"),
      ),
    );
  }
}
