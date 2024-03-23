// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fff/Utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class Alert_Details_Screen extends StatefulWidget {
  final DocumentSnapshot<Object?> documentSnapshot;

  const Alert_Details_Screen({
    super.key,
    required this.documentSnapshot,
  });

  @override
  State<Alert_Details_Screen> createState() => _Alert_Details_ScreenState();
}

// ignore: camel_case_types
class _Alert_Details_ScreenState extends State<Alert_Details_Screen> {
  bool isLoading = true;

  String fetchedDos1 = '';
  String fetchedDonts1 = '';
  String fetchedDos2 = '';
  String fetchedDonts2 = '';
  String fetchedDos3 = '';
  String fetchedDonts3 = '';

  @override
  void initState() {
    super.initState();
    fetchDos();
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
        title: const Text("$appbar_display_name - Alert details"),
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
                      const Text("Alert Details : ",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              color: Colors.blueGrey)),
                      const SizedBox(height: 20),
                      //show alert details
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blueGrey.withOpacity(0.1)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Iconsax.hierarchy_square),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("type of Disaster :",
                                          style: TextStyle(fontSize: 13)),
                                      const SizedBox(height: 4),
                                      Text(
                                          widget.documentSnapshot[
                                              'typeofDisaster'],
                                          style: const TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const Divider(height: 2),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Iconsax.call),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Description :",
                                          style: TextStyle(fontSize: 13)),
                                      const SizedBox(height: 4),
                                      SizedBox(
                                        width: MediaQuery.of(context)
                                            .size
                                            .width *
                                            0.65,
                                        child: Flexible(
                                          child: Text(
                                              widget.documentSnapshot[
                                                  'description'],
                                              maxLines: 5,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize: 16)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const Divider(height: 2),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Iconsax.buildings),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        child: const Text("Alert Level :",
                                            style: TextStyle(fontSize: 13)),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(widget.documentSnapshot['level'],
                                          style: const TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const Divider(height: 2),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Iconsax.building_3),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("City :",
                                          style: TextStyle(fontSize: 13)),
                                      const SizedBox(height: 4),
                                      Text(widget.documentSnapshot['city'],
                                          style: const TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Alert time :",
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey)),
                                      const SizedBox(width: 4),
                                      Text(
                                          DateFormat('dd-MM-yyyy , HH:mm')
                                              .format(DateTime.parse(
                                                  widget.documentSnapshot[
                                                      'sentTime'])),
                                          style: const TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey)),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),

                      //dos
                      const Text("Dos & Dont's  : ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17)),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.green.withOpacity(0.3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Iconsax.tick_circle4),
                                        const SizedBox(width: 5),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width *
                                              0.7, // Adjust the width as needed
                                          child: Text(
                                            fetchedDos1,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Iconsax.tick_circle4),
                                        const SizedBox(width: 5),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width *
                                              0.7, // Adjust the width as needed
                                          child: Text(
                                            fetchedDos2,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Iconsax.tick_circle4),
                                        const SizedBox(width: 5),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width *
                                              0.7, // Adjust the width as needed
                                          child: Text(
                                            fetchedDos3,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      //donts
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.red.withOpacity(0.3)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Iconsax.shield_cross),
                                        const SizedBox(width: 5),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width *
                                              0.7, // Adjust the width as needed
                                          child: Text(
                                            fetchedDonts1,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Iconsax.shield_cross),
                                        const SizedBox(width: 5),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width *
                                              0.7, // Adjust the width as needed
                                          child: Text(
                                            fetchedDonts2,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Iconsax.shield_cross),
                                        const SizedBox(width: 5),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width *
                                              0.7, // Adjust the width as needed
                                          child: Text(
                                            fetchedDonts3,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15)
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  void fetchDos() async {
    try {
      DocumentSnapshot dosSnap = await FirebaseFirestore.instance
          .collection('clc_dos_donts')
          .doc(widget.documentSnapshot['did'])
          .get();
      try {
        if (dosSnap.exists) {
          fetchedDos1 = dosSnap.get("dos_1");
          fetchedDonts1 = dosSnap.get("donts_1");
          fetchedDos2 = dosSnap.get("dos_2");
          fetchedDonts2 = dosSnap.get("donts_2");
          fetchedDos3 = dosSnap.get("dos_3");
          fetchedDonts3 = dosSnap.get("donts_3");
        } else {
          if (kDebugMode) {
            print('Dos document does not exist');
          }
        }
      } catch (e) {
        if (kDebugMode) {
          print('Error fetching dos/donts: $e');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching did : $e');
      }
    }
    return null;
  }
}
