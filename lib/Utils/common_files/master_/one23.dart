// ignore_for_file: library_private_types_in_public_api, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '../../../Admin Related/admin_request_history_screen/admin_request_details_screen.dart';
import '../../Utils.dart';

class RequestsPage extends StatefulWidget {
  const RequestsPage({super.key});

  @override
  _RequestsPageState createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  late SharedPreferences prefs;
  List<String> readRequestIds = [];

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    readRequestIds = prefs.getStringList('readRequests') ?? [];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Requests'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: RefreshIndicator(
                  onRefresh: _refreshData,
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("clc_request")
                          // .where("contactNumber", isEqualTo: mobileNo)
                          .orderBy('reqTime', descending: true)
                          // .limit(25)
                          .snapshots(),
                      builder: (context, snapshot) {
                        //.where("city", isEqualTo: widget.selectedCity)
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          if (snapshot.hasData) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 7, right: 7, top: 10),
                              child: snapshot.data!.docs.isEmpty
                                  ? const Center(
                                      child: Text(
                                        'No records found for your requests !',
                                        style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    )
                                  : ListView.builder(
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder: (context, index) {
                                        final requestId = snapshot
                                            .data!.docs[index]['reqTime'];
                                        final isRead =
                                            readRequestIds.contains(requestId);

                                        return GestureDetector(
                                          onTap: () async {
                                            Navigator.of(context).push(
                                              PageRouteBuilder(
                                                pageBuilder: (context,
                                                        animation,
                                                        secondaryAnimation) =>
                                                    Admin_Request_Details_Screen(
                                                  documentSnapshot: snapshot
                                                      .data!.docs[index],
                                                ),
                                                transitionsBuilder: (context,
                                                    animation,
                                                    secondaryAnimation,
                                                    child) {
                                                  var begin =
                                                      const Offset(1.0, 0.0);
                                                  var end = Offset.zero;
                                                  var curve = Curves.ease;

                                                  var tween = Tween(
                                                          begin: begin,
                                                          end: end)
                                                      .chain(CurveTween(
                                                          curve: curve));
                                                  var offsetAnimation =
                                                      animation.drive(tween);

                                                  return SlideTransition(
                                                    position: offsetAnimation,
                                                    child: child,
                                                  );
                                                },
                                              ),
                                            );
                                            if (!isRead) {
                                              await _markRequestAsRead(
                                                  requestId);
                                            }
                                          },
                                          child: Card(
                                            color: isRead ? null : Colors.yellow[100],
                                            margin: const EdgeInsets.only(
                                                bottom: 13, left: 7, right: 7),
                                            // Set margin to zero to remove white spaces
                                            elevation: 3,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 5,
                                                      horizontal: 7),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ListTile(
                                                        //tileColor: isRead ? null : Colors.yellow[100],
                                                        leading: CircleAvatar(
                                                          maxRadius: 14,
                                                          backgroundColor:
                                                              Colors.grey,
                                                          child: Text(
                                                              "${index + 1}"),
                                                        ),
                                                        //textColor: Colors.white,

                                                        title: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Text(
                                                                "Requested service : ",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        13)),
                                                            const SizedBox(
                                                                height: 3),
                                                            Text(
                                                                snapshot.data!
                                                                            .docs[
                                                                        index][
                                                                    'neededService'],
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 15,
                                                                )),
                                                            // Text(
                                                            //   snapshot.data!.docs[index]
                                                            //       ['userName'],
                                                            //   style: TextStyle(
                                                            //
                                                            //     fontWeight: FontWeight.w700,
                                                            //     color: Colors.black
                                                            //         .withOpacity(0.6),
                                                            //   ),
                                                            // ),
                                                          ],
                                                        ),
                                                      ),
                                                      //const SizedBox(height: 4),
                                                      // Padding(
                                                      //   padding:
                                                      //       const EdgeInsets.symmetric(
                                                      //           horizontal: 3),
                                                      //   child: Row(
                                                      //     children: [
                                                      //       const Text("Request type : ",
                                                      //           style: TextStyle(
                                                      //               fontWeight:
                                                      //                   FontWeight.bold)),
                                                      //       Text(
                                                      //           snapshot.data!.docs[index]
                                                      //               ['neededService'],
                                                      //           style: const TextStyle(
                                                      //               color: Colors.black)),
                                                      //     ],
                                                      //   ),
                                                      // ),
                                                      const SizedBox(height: 2),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 15,
                                                                top: 5),
                                                        child: Row(
                                                          children: [
                                                            const Text(
                                                              "City : ",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Text(
                                                                snapshot.data!
                                                                            .docs[
                                                                        index]
                                                                    ['city'],
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(height: 2),
                                                       Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 10,
                                                                bottom: 3),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            const Icon(
                                                                Icons
                                                                    .watch_later_outlined,
                                                                size: 16,
                                                                color: Colors
                                                                    .black54),
                                                            const SizedBox(width: 3),
                                                            Text(
                                                                DateFormat(
                                                                    'dd-MM-yyyy , HH:mm')
                                                                    .format(DateTime
                                                                    .parse(snapshot
                                                                    .data!
                                                                    .docs[index]
                                                                [
                                                                'reqTime'])),
                                                                style: const TextStyle(
                                                                    color:
                                                                    Colors.black38,
                                                                    fontSize: 12)),
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
                            );
                          }
                        } else if (snapshot.hasError) {
                          showToastMsg(snapshot.hasError.toString());
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return const Center(child: CircularProgressIndicator());
                      }),
                ),
              ),
            ),
          ],
        ));
  }

  Future<void> _markRequestAsRead(String requestId) async {
    // Update readRequestIds list and save it to SharedPreferences
    readRequestIds.add(requestId);
    await prefs.setStringList('readRequests', readRequestIds);
    setState(() {}); // Update the UI
  }

  Future<void> _removeFromSharedPreferences(String requestId) async {
    // Get the list of read requests from SharedPreferences
    List<String> readRequestIds = prefs.getStringList('readRequests') ?? [];

    // Remove the current requestId from the list
    readRequestIds.remove(requestId);

    // Save the updated list back to SharedPreferences
    await prefs.setStringList('readRequests', readRequestIds);
  }

  Future<void> _refreshData() async {
    await Future.delayed(const Duration(milliseconds: 1200));
    setState(() {});
  }
}
