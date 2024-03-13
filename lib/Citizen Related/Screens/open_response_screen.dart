// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fff/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class Open_Response_Screen extends StatefulWidget {
  final DocumentSnapshot<Object?> documentSnapshot;
  final String selectedService;
  final String authorityName;
  final String regNo;
  final String address;
  final String phone;
  final String email;
  final String city;
  final String website;

  const Open_Response_Screen({
    super.key,
    required this.selectedService,
    required this.authorityName,
    required this.regNo,
    required this.address,
    required this.phone,
    required this.email,
    required this.city,
    required this.website,
    required this.documentSnapshot,
  });

  @override
  State<Open_Response_Screen> createState() => _Open_Response_ScreenState();
}

// ignore: camel_case_types
class _Open_Response_ScreenState extends State<Open_Response_Screen> {
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
          title: const Text("$appbar_display_name - Open Response"),
        ),
        body: SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.green.withOpacity(0.1)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Request Id  :",
                              style: TextStyle(fontSize: 13)),
                          const SizedBox(height: 4),
                          Text(widget.documentSnapshot['RequestId'],
                              style: const TextStyle(fontSize: 16)),
                          const SizedBox(height: 8),
                          const Divider(height: 2),
                          const SizedBox(height: 8),
                          const Text("Needed Service :",
                              style: TextStyle(fontSize: 13)),
                          const SizedBox(height: 4),
                          Text(widget.documentSnapshot['neededService'],
                              style: const TextStyle(fontSize: 16)),
                          const SizedBox(height: 8),
                          const Divider(height: 2),
                          const SizedBox(height: 8),
                          const Text("Citizen id :",
                              style: TextStyle(fontSize: 13)),
                          const SizedBox(height: 4),
                          Text(widget.documentSnapshot['cid'],
                              style: const TextStyle(fontSize: 16)),
                          const SizedBox(height: 8),
                          const Divider(height: 2),
                          const SizedBox(height: 8),
                          const Text("City :", style: TextStyle(fontSize: 13)),
                          const SizedBox(height: 4),
                          Text(widget.documentSnapshot['city'],
                              style: const TextStyle(fontSize: 16)),
                          const SizedBox(height: 8),
                          const Divider(height: 2),
                          const SizedBox(height: 8),
                          const Text("Address :",
                              style: TextStyle(fontSize: 13)),
                          const SizedBox(height: 4),
                          Text(widget.documentSnapshot['fullAddress'],
                              style: const TextStyle(fontSize: 16)),
                          const SizedBox(height: 8),
                          const Divider(height: 2),
                          const SizedBox(height: 8),
                          const Text("Pin code :",
                              style: TextStyle(fontSize: 13)),
                          const SizedBox(height: 4),
                          Text(widget.documentSnapshot['pinCode'],
                              style: const TextStyle(fontSize: 16)),
                          const SizedBox(height: 8),
                          const Divider(height: 2),
                          const SizedBox(height: 8),
                          const Text("Phone no :",
                              style: TextStyle(fontSize: 13)),
                          const SizedBox(height: 4),
                          Text(widget.documentSnapshot['contactNumber'],
                              style: const TextStyle(fontSize: 16)),
                          const SizedBox(height: 8),
                          const Divider(height: 2),
                          const SizedBox(height: 8),
                          const Text("Request time :",
                              style: TextStyle(fontSize: 13)),
                          const SizedBox(height: 4),
                          Text(
                              DateFormat('dd-MM-yyyy , HH:mm').format(
                                  DateTime.parse(
                                      widget.documentSnapshot['reqTime'])),
                              style: const TextStyle(fontSize: 16))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text("Your selected Service :",
                      style: TextStyle(color: Colors.deepPurple, fontSize: 17),
                      textAlign: TextAlign.start),
                  Text(widget.selectedService,
                      style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 25),
                  const Text("Responded authority name  :",
                      style: TextStyle(color: Colors.deepPurple, fontSize: 17)),
                  Text(widget.authorityName,
                      style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 25),
                  const Text("Responded authority Register number :",
                      style: TextStyle(color: Colors.deepPurple, fontSize: 17)),
                  Text(widget.regNo, style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 25),
                  const Text("Responder authority address :",
                      style: TextStyle(color: Colors.deepPurple, fontSize: 17)),
                  Text(widget.address, style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("Responder contact number :",
                              style: TextStyle(
                                  color: Colors.deepPurple, fontSize: 17)),
                          Text(widget.phone,
                              style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                      const Icon(Iconsax.call)
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Text("Responder Email :",
                      style: TextStyle(color: Colors.deepPurple, fontSize: 17)),
                  Text(widget.email, style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("Website :",
                              style: TextStyle(
                                  color: Colors.deepPurple, fontSize: 17)),
                          Text(widget.website,
                              style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                      const Icon(Iconsax.global),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  List<Widget> _buildTextContainers(
      String label1, String text1, String label2, String text2) {
    return [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.blueGrey.shade300),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label1,
                  style:
                      const TextStyle(color: Colors.deepPurple, fontSize: 16)),
              Text(text1, style: const TextStyle(fontSize: 13)),
            ],
          ),
        ),
      ),
      const SizedBox(height: 20),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.blueGrey.shade100),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label2,
                  style: TextStyle(
                      color: Colors.deepPurple.shade300, fontSize: 16)),
              Text(text2, style: const TextStyle(fontSize: 13)),
            ],
          ),
        ),
      ),
      const SizedBox(height: 25),
    ];
  }
}
