// ignore_for_file: camel_case_types, library_private_types_in_public_api, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Utils/Utils.dart';
import '../../Utils/constants.dart';

class Request_History_Screen extends StatefulWidget {
  const Request_History_Screen({super.key});

  @override
  State<Request_History_Screen> createState() => _Request_History_ScreenState();
}

class _Request_History_ScreenState extends State<Request_History_Screen> {
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
        title: const Text("$appbar_display_name - Req History Page"),
      ),
      body: const Column(
        children: [req_history_list_widget()],
      ),
    );
  }
}

class req_history_list_widget extends StatefulWidget {
  const req_history_list_widget({Key? key}) : super(key: key);

  @override
  _req_history_list_widgetState createState() =>
      _req_history_list_widgetState();
}

class _req_history_list_widgetState extends State<req_history_list_widget> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    String? mobileNo = user!.phoneNumber;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: RefreshIndicator(
          onRefresh: _refreshData,
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Citizen Request")
                  .where("contactNumber", isEqualTo: mobileNo)
                  //.where("city", isEqualTo: widget.selectedCity)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: snapshot.data!.docs.isEmpty
                          ? const Center(
                              child: Text(
                                'No records found for your requests !',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            )
                          : ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  color: Colors.white,
                                  margin: const EdgeInsets.only(
                                      bottom: 13, left: 10, right: 10),
                                  // Set margin to zero to remove white spaces
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ListTile(
                                              leading: CircleAvatar(
                                                maxRadius: 14,
                                                backgroundColor: Colors.grey,
                                                child: Text("${index + 1}"),
                                              ),
                                              textColor: Colors.white,
                                              title: Text(
                                                snapshot.data!.docs[index]
                                                    ['userName'],
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black
                                                      .withOpacity(0.6),
                                                ),
                                              ),
                                            ),
                                            //const SizedBox(height: 4),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 0),
                                              child: Text(
                                                  snapshot.data!.docs[index]
                                                      ['neededService'],
                                                  style: const TextStyle(
                                                      color: Colors.black)),
                                            ),
                                            const SizedBox(height: 4),
                                            Padding(
                                              padding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 0),
                                              child: Text(
                                                  snapshot.data!.docs[index]
                                                  ['city'],
                                                  style: const TextStyle(
                                                      color: Colors.black)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                      snapshot.data!.docs[index]
                                                          ['fullAddress'],
                                                      style: const TextStyle(
                                                          color: Colors.black)),
                                                  TextButton(
                                                    onPressed: () {
                                                      launch(
                                                        'tel:',
                                                      );
                                                    },
                                                    child: Icon(Icons.call,
                                                        size: 14,
                                                        color: Colors
                                                            .green.shade800),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                    );
                  }
                } else if (snapshot.hasError) {
                  showToastMsg(snapshot.hasError.toString());
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
                return const Center(child: CircularProgressIndicator());
              }),
        ),
      ),
    );
  }

  Future<void> _refreshData() async {
    // Simulate a delay for refreshing data
    await Future.delayed(const Duration(milliseconds: 1200));
    setState(() {
      // Update your data here
    });
  }
}
