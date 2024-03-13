// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fff/Utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

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
  bool isLoading = true;

  //ngo
  bool hasNGOResponded = false;
  String fetchedNid = '';
  String fetchedNGOName = '';
  String fetchedNGORegNo = '';
  String fetchedNGOAddress = '';
  String fetchedNGOContact = '';
  String fetchedNGOEmail = '';
  String fetchedNGOWebsite = '';
  String fetchedNGORespondTime = '';

  //govt
  bool hasGovtResponded = false;
  String fetchedGid = '';
  String fetchedGovtName = '';
  String fetchedGovtRegNo = '';
  String fetchedGovtAddress = '';
  String fetchedGovtContact = '';
  String fetchedGovtEmail = '';
  String fetchedGovtWebsite = '';
  String fetchedGovtRespondTime = '';

  @override
  void initState() {
    super.initState();
    fetchNGOResponseDetails();
    // Start loading
    Future.delayed(const Duration(milliseconds: 1100), () {
      setState(() {
        isLoading = false;
      });
    });
  }

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
          title: const Text("$appbar_display_name - Request details"),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  //show Req details
                  const Text("Your Request Details : ",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 19,
                          color: Colors.blueGrey)),
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
                          const Text("City :",
                              style: TextStyle(fontSize: 13)),
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
                                  DateTime.parse(widget
                                      .documentSnapshot['reqTime'])),
                              style: const TextStyle(fontSize: 16))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  //NGO
                  const Text("NGO Details : ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17)),
                  const SizedBox(height: 20),
                  //NGO respond
                  if (hasNGOResponded) Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          const Text("NGO Id  :",
                              style: TextStyle(fontSize: 13)),
                          const SizedBox(height: 4),
                          Text(fetchedNid,
                              style: const TextStyle(fontSize: 16)),
                          const SizedBox(height: 8),
                          const Divider(height: 2),
                          const SizedBox(height: 8),
                          const Text("NGO Name :",
                              style: TextStyle(fontSize: 13)),
                          const SizedBox(height: 4),
                          Text(fetchedNGOName,
                              style: const TextStyle(fontSize: 16)),
                          const SizedBox(height: 8),
                          const Divider(height: 2),
                          const SizedBox(height: 8),
                          const Text("NGO register no :",
                              style: TextStyle(fontSize: 13)),
                          const SizedBox(height: 4),
                          Text(fetchedNGORegNo,
                              style: const TextStyle(fontSize: 16)),
                          const SizedBox(height: 8),
                          const Divider(height: 2),
                          const SizedBox(height: 8),
                          const Text("Address :",
                              style: TextStyle(fontSize: 13)),
                          const SizedBox(height: 4),
                          Text(fetchedNGOAddress,
                              style: const TextStyle(fontSize: 16)),
                          const SizedBox(height: 8),
                          const Divider(height: 2),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  const Text("Contact no :",
                                      style:
                                      TextStyle(fontSize: 13)),
                                  const SizedBox(height: 4),
                                  Text(fetchedNGOContact,
                                      style: const TextStyle(
                                          fontSize: 16)),
                                ],
                              ),
                              IconButton(
                                  icon: const Icon(Iconsax.call,color: Colors.deepPurple),
                                  onPressed: () {
                                    launch(
                                      'tel:$fetchedNGOContact',
                                    );
                                  })
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Divider(height: 2),
                          const SizedBox(height: 8),
                          const Text("City :",
                              style: TextStyle(fontSize: 13)),
                          const SizedBox(height: 4),
                          Text(fetchedNGOEmail,
                              style: const TextStyle(fontSize: 16)),
                          const SizedBox(height: 8),
                          const Divider(height: 2),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  const Text("Website :",
                                      style:
                                      TextStyle(fontSize: 13)),
                                  const SizedBox(height: 4),
                                  Text(fetchedNGOWebsite,
                                      style: const TextStyle(
                                          fontSize: 16)),
                                ],
                              ),
                              IconButton(
                                icon: const Icon(Iconsax.global,color: Colors.deepPurple), onPressed:(){
                                _launchWebURL("https://$fetchedNGOWebsite");

                              },)
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Divider(height: 2),
                          const SizedBox(height: 8),
                          const Text("Response time :",
                              style: TextStyle(fontSize: 13)),
                          const SizedBox(height: 4),
                          Text(
                              DateFormat('dd-MM-yyyy , HH:mm')
                                  .format(DateTime.parse(
                                  fetchedNGORespondTime)),
                              style: const TextStyle(fontSize: 16))
                        ],
                      ),
                    ),
                  ) else Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.withOpacity(0.1)),
                    child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 25, vertical: 15),
                        child: Text(
                            "No NGOs has responded to your request yet !!")),
                  ),

                  //Govt
                  const SizedBox(height: 25),
                  const Text("Govt Details : ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17)),
                  const SizedBox(height: 20),
                  //NGO respond
                  hasGovtResponded
                      ? Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          const Text("Govt agency Id  :",
                              style: TextStyle(fontSize: 13)),
                          const SizedBox(height: 4),
                          Text(fetchedGid,
                              style: const TextStyle(fontSize: 16)),
                          const SizedBox(height: 8),
                          const Divider(height: 2),
                          const SizedBox(height: 8),
                          const Text("Govt agency Name :",
                              style: TextStyle(fontSize: 13)),
                          const SizedBox(height: 4),
                          Text(fetchedGovtName,
                              style: const TextStyle(fontSize: 16)),
                          const SizedBox(height: 8),
                          const Divider(height: 2),
                          const SizedBox(height: 8),
                          const Text("Govt agency register no :",
                              style: TextStyle(fontSize: 13)),
                          const SizedBox(height: 4),
                          Text(fetchedGovtRegNo,
                              style: const TextStyle(fontSize: 16)),
                          const SizedBox(height: 8),
                          const Divider(height: 2),
                          const SizedBox(height: 8),
                          const Text("Address :",
                              style: TextStyle(fontSize: 13)),
                          const SizedBox(height: 4),
                          Text(fetchedGovtAddress,
                              style: const TextStyle(fontSize: 16)),
                          const SizedBox(height: 8),
                          const Divider(height: 2),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  const Text("Contact no :",
                                      style:
                                      TextStyle(fontSize: 13)),
                                  const SizedBox(height: 4),
                                  Text(fetchedGovtContact,
                                      style: const TextStyle(
                                          fontSize: 16)),
                                ],
                              ),
                              const Icon(Iconsax.global)
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Divider(height: 2),
                          const SizedBox(height: 8),
                          const Text("City :",
                              style: TextStyle(fontSize: 13)),
                          const SizedBox(height: 4),
                          Text(fetchedGovtEmail,
                              style: const TextStyle(fontSize: 16)),
                          const SizedBox(height: 8),
                          const Divider(height: 2),
                          const SizedBox(height: 8),
                          const Text("Website :",
                              style: TextStyle(fontSize: 13)),
                          const SizedBox(height: 4),
                          Text(fetchedGovtWebsite,
                              style: const TextStyle(fontSize: 16)),
                          const SizedBox(height: 8),
                          const Divider(height: 2),
                          const SizedBox(height: 8),
                          const Text("Response time :",
                              style: TextStyle(fontSize: 13)),
                          const SizedBox(height: 4),
                          Text(
                              DateFormat('dd-MM-yyyy , HH:mm')
                                  .format(DateTime.parse(
                                  fetchedGovtRespondTime)),
                              style: const TextStyle(fontSize: 16))
                        ],
                      ),
                    ),
                  )
                      : Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.withOpacity(0.1)),
                    child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 25, vertical: 15),
                        child: Text(
                            "No Govt agency has responded to your request yet!!")),
                  ),
                  const SizedBox(height: 20)
                ],
              ),
            ),
          ),
        ));
  }

  List<Widget> _buildTextContainers(String label1, String text1, String label2,
      String text2) {
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

  Future<void> fetchNGOResponseDetails() async {
    try {
      // Fetch data from Firestore
      DocumentSnapshot NGOResponseSnapshot = await FirebaseFirestore.instance
          .collection('clc_response')
          .doc(widget.documentSnapshot['RespondId'])
          .collection("ngo")
          .doc("ngo_details")
          .get();
      //print(user!.email);
      //print(GovtSnapshot.get('GovtAgencyRegNo'));

      // Check if the document exists
      if (NGOResponseSnapshot.exists) {
        // Access the fields from the document
        setState(() {
          hasNGOResponded = true;
          fetchedNid = NGOResponseSnapshot.get('nid');
          fetchedNGOName = NGOResponseSnapshot.get('ResponderNGOName');
          fetchedNGORegNo = NGOResponseSnapshot.get('ResponderNGORegNo');
          fetchedNGOAddress = NGOResponseSnapshot.get('ResponderNGOAddress');
          fetchedNGOContact =
              NGOResponseSnapshot.get('ResponderNGOContactNumber');
          fetchedNGOEmail = NGOResponseSnapshot.get('ResponderNGOEmail');
          fetchedNGOWebsite = NGOResponseSnapshot.get('ResponderNGOWebsite');
          fetchedNGORespondTime = NGOResponseSnapshot.get('RespondNGOTime');
        });
      } else {
        if (kDebugMode) {
          print('NGO response Document does not exist');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching NGO response data: $e');
      }
    }
  }

  Future<void> fetchGovtResponseDetails() async {
    try {
      // Fetch data from Firestore
      DocumentSnapshot NGOResponseSnapshot = await FirebaseFirestore.instance
          .collection('clc_response')
          .doc(widget.documentSnapshot['RespondId'])
          .collection("govt")
          .doc("govt_details")
          .get();
      //print(user!.email);
      //print(GovtSnapshot.get('GovtAgencyRegNo'));

      // Check if the document exists
      if (NGOResponseSnapshot.exists) {
        // Access the fields from the document
        setState(() {
          hasGovtResponded = true;
          fetchedGid = NGOResponseSnapshot.get('gid');
          fetchedGovtName = NGOResponseSnapshot.get('ResponderGovtName');
          fetchedGovtRegNo = NGOResponseSnapshot.get('ResponderGovtRegNo');
          fetchedGovtAddress = NGOResponseSnapshot.get('ResponderGovtAddress');
          fetchedGovtContact =
              NGOResponseSnapshot.get('ResponderGovtContactNumber');
          fetchedGovtEmail = NGOResponseSnapshot.get('ResponderGovtEmail');
          fetchedGovtWebsite = NGOResponseSnapshot.get('ResponderGovtWebsite');
          fetchedGovtRespondTime = NGOResponseSnapshot.get('RespondGovtTime');
        });
      } else {
        if (kDebugMode) {
          print('NGO response Document does not exist');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching NGO response data: $e');
      }
    }
  }

  void _launchWebURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }}
