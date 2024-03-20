// ignore_for_file: depend_on_referenced_packages, camel_case_types, library_private_types_in_public_api

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../Citizen Related/Screens/citizen_request_screen/request_details_screen.dart';
import '../../Utils/Utils.dart';
import '../../Utils/constants.dart';

class Govt_Response_History_Screen extends StatefulWidget {
  const Govt_Response_History_Screen({super.key});

  @override
  State<Govt_Response_History_Screen> createState() =>
      _Govt_Response_History_ScreenState();
}

class _Govt_Response_History_ScreenState
    extends State<Govt_Response_History_Screen> {
  List<String> documentIds = [];

  @override
  void initState() {
    super.initState();
    _fetchDocumentIds(); // Call the asynchronous method from initState
  }

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
        title: const Text("$appbar_display_name - Response History Page"),
      ),
      body: const Column(
        children: [response_history_list_widget()],
      ),
    );
  }

  Future<void> _fetchDocumentIds() async {
    try {
      DocumentReference querySnapshot = FirebaseFirestore.instance.collection("clc_response").doc("Response_1");
      //List<String> ids = querySnapshot.docs.map((doc) => doc.id).toList();
      if (kDebugMode) {
        print(querySnapshot);
      }
      setState(() {
        //documentIds = ids;
      });
    } catch (error) {
      if (kDebugMode) {
        print("Error fetching document IDs: $error");
      }
    }

  }
}

class response_history_list_widget extends StatefulWidget {
  const response_history_list_widget({Key? key}) : super(key: key);

  @override
  _response_history_list_widgetState createState() =>
      _response_history_list_widgetState();
}

class _response_history_list_widgetState
    extends State<response_history_list_widget> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    String? email = user!.email;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: RefreshIndicator(
          onRefresh: _refreshData,
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("clc_response")
                  .doc(email).collection("govt")
                  .where("ResponderNGOEmail", isEqualTo: email)
              // .orderBy('RespondNGOTime', descending: true)
              // .limit(25)
                  .snapshots(),
              builder: (context, snapshot) {
                //.where("city", isEqualTo: widget.selectedCity)
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding:
                      const EdgeInsets.only(left: 7, right: 7, top: 10),
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
                            snapshot.data!.docs[index]['RespondNGOTime'];
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                        secondaryAnimation) =>
                                        Request_Details_Screen(
                                          documentSnapshot:
                                          snapshot.data!.docs[index],
                                        ),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      var begin = const Offset(1.0, 0.0);
                                      var end = Offset.zero;
                                      var curve = Curves.ease;

                                      var tween = Tween(
                                          begin: begin, end: end)
                                          .chain(CurveTween(curve: curve));
                                      var offsetAnimation =
                                      animation.drive(tween);

                                      return SlideTransition(
                                        position: offsetAnimation,
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Card(
                                color: Colors.white,
                                margin: const EdgeInsets.only(
                                    bottom: 13, left: 7, right: 7),
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 7),
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
                                            //textColor: Colors.white,
                                            title: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                    "Requested service : ",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13)),
                                                const SizedBox(height: 3),
                                                Text(
                                                    snapshot.data!
                                                        .docs[index]
                                                    ['ResponderNGOName'],
                                                    style: const TextStyle(
                                                      color: Colors.black,
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
                                            padding: const EdgeInsets.only(
                                                left: 15, top: 5),
                                            child: Row(
                                              children: [
                                                const Text(
                                                  "City : ",
                                                ),
                                                Text(
                                                    snapshot.data!
                                                        .docs[index]
                                                    ['ResponderNGOAddress'],
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold)),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10, bottom: 3),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.end,
                                              children: [
                                                //const Text("City : ",style: TextStyle(fontWeight: FontWeight.bold)),
                                                Text(
                                                    DateFormat(
                                                        'dd-MM-yyyy , HH:mm')
                                                        .format(DateTime
                                                        .parse(snapshot
                                                        .data!
                                                        .docs[index]
                                                    [
                                                    'RespondNGOTime'])),
                                                    style: const TextStyle(
                                                        color:
                                                        Colors.black38,
                                                        fontSize: 12)),
                                              ],
                                            ),
                                          ),
                                          // Padding(
                                          //   padding:
                                          //       const EdgeInsets.symmetric(
                                          //           horizontal: 0),
                                          //   child: Row(
                                          //     children: [
                                          //       Text(
                                          //           snapshot.data!.docs[index]
                                          //               ['fullAddress'],
                                          //           style: const TextStyle(
                                          //               color: Colors.black)),
                                          //       TextButton(
                                          //         onPressed: () {
                                          //           launch(
                                          //             'tel:',
                                          //           );
                                          //         },
                                          //         child: Icon(Icons.call,
                                          //             size: 14,
                                          //             color: Colors
                                          //                 .green.shade800),
                                          //       ),
                                          //     ],
                                          //   ),
                                          // ),
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
                  return const Center(child: CircularProgressIndicator());
                }
                return const Center(child: CircularProgressIndicator());
              }),
        ),
      ),
    );
  }

  Future<void> _refreshData() async {
    // final ngoDetailsList = await fetchNgoDetails();
    // print(ngoDetailsList.length);
    // for(final ngoD in ngoDetailsList.length){
    //   print(ngoD.name);
    //   print(ngoD.description);
    // }

    //fetchResponseIds();

    var responseData = fetch();

    // Simulate a delay for refreshing data
    await Future.delayed(const Duration(milliseconds: 1200));
    setState(() {
      responseData = responseData;

      // Update your data here
    });
  }

  Future<List<String>> fetchResponseIds() async {
    List a =['',""];
    final clcCollection = FirebaseFirestore.instance.collection('clc_request');
    final responseIdList = <String>[];

    final querySnapshot = await clcCollection
        .where('RespondId', arrayContainsAny: a) // Filter for non-null response_id
        .get();

    for (final queryDocSnapshot in querySnapshot.docs) {
      final responseId = queryDocSnapshot.get('cid');
      if (responseId != null) {
        responseIdList.add(responseId as String);
      }
    }

    return responseIdList;
  }

  Future<List<Map<String, dynamic>>> fetchResponseData(List<String> responseIdList) async {
    final responseCollection = FirebaseFirestore.instance.collection('clc_response');
    final responseDataList = <Map<String, dynamic>>[];

    for (final responseId in responseIdList) {
      if (responseId.isNotEmpty) { // Check if responseId is not empty
        final querySnapshot = await responseCollection.doc(responseId).get();
        if (querySnapshot.exists) {
          final responseData = querySnapshot.data();
          if (responseData != null) {
            responseDataList.add(responseData);
          }
        }
      }
    }

    return responseDataList;
  }


  Future<List<Map<String ,dynamic>>> fetch() async{
    final resId = await fetchResponseIds();
    final resDataId = await fetchResponseData(resId);
    return resDataId;
  }
}
