// ignore_for_file: camel_case_types
import 'dart:async';
import 'package:flutter/material.dart';

class NGO_Donation_History_Screen extends StatefulWidget {
  const NGO_Donation_History_Screen({super.key});

  @override
  State<NGO_Donation_History_Screen> createState() =>
      _NGO_Donation_History_ScreenState();
}

class _NGO_Donation_History_ScreenState extends State<NGO_Donation_History_Screen> {
  List<Map<String, dynamic>> citizenList = [
    {
      "DonerName": "TT",
      "NGOName": "Care India",
      "Mode": "UPI",
      "Amount": "12,500 /-",
      "TxnId": "ACS765MM0056AO41",
      "DonationTime": "2024-03-30, 12:00:00",
    },
    // {
    //   "DonerName": "Krinal",
    //   "NGOName": "Environmental foundation of India",
    //   "Mode": "Paytm",
    //   "Amount": "2,000 /-",
    //   "TxnId": "PUN004TE9943BY88",
    //   "DonationTime": "2024-03-26, 11:47",
    // },
  ];

  Stream<List<Map<String, dynamic>>> citizenStream() async* {
    yield citizenList;
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
        title: const Text("Donation History"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: citizenList.length,
            itemBuilder: (context, index) {
              citizenList[index]['city'];
              return GestureDetector(
                onTap: () {},
                child: Card(
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 13, left: 7, right: 7),
                  // Set margin to zero to remove white spaces
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                maxRadius: 14,
                                backgroundColor: Colors.grey,
                                child: Text("${index + 1}"),
                              ),
                              //textColor: Colors.white,
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Doner Name : ",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 13)),
                                  const SizedBox(height: 3),
                                  Text(citizenList[index]['DonerName'],
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      )),
                                ],
                              ),
                            ),
                            const SizedBox(height: 2),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 5),
                              child: Row(
                                children: [
                                  const Text(
                                    "Amount : ",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(citizenList[index]['Amount'],
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            const SizedBox(height: 2),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 5),
                              child: Row(
                                children: [
                                  const Text(
                                    "Payment Mode : ",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(citizenList[index]['Mode'],
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            const SizedBox(height: 2),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 5),
                              child: Row(
                                children: [
                                  const Text(
                                    "Transaction Id : ",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(citizenList[index]['TxnId'],
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Padding(
                              padding:
                              const EdgeInsets.only(right: 10, bottom: 3),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Icon(Icons.watch_later_outlined,
                                      size: 16, color: Colors.black54),
                                  const SizedBox(width: 3),
                                  Text(citizenList[index]['DonationTime'],
                                      style: const TextStyle(
                                          color: Colors.black38, fontSize: 12)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
