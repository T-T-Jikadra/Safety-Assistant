// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../constants.dart';

class req_open extends StatefulWidget {
  final String? title;
  final String? add;
  final String? pin;

  const req_open(
      {super.key, required this.title, required this.add, required this.pin});

  @override
  State<req_open> createState() => _req_openState();
}

class _req_openState extends State<req_open> {
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
        title: const Text("$appbar_display_name - Request sent "),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 50),
              TextFormField(
                keyboardType: TextInputType.text,
                initialValue: widget.title,
                decoration: const InputDecoration(
                    labelText: "Request Type",
                    prefixIcon: Icon(Icons.ac_unit_outlined)),
              ),
              const SizedBox(height: 70),
              TextFormField(
                keyboardType: TextInputType.text,
                initialValue: widget.add,
                decoration: const InputDecoration(
                    labelText: "Address",
                    prefixIcon: Icon(Icons.account_balance_wallet)),
              ),
              const SizedBox(height: 70),
              TextFormField(
                keyboardType: TextInputType.text,
                initialValue: widget.pin,
                decoration: const InputDecoration(
                    labelText: "Pin",
                    prefixIcon: Icon(Icons.account_balance_wallet)),
              ),
              const SizedBox(height: 70),
              const Center(
                child: Text("It's request sent Page "),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
