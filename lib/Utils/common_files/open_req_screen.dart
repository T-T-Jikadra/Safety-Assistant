// ignore_for_file: camel_case_types, use_build_context_synchronously, non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Models/notification_response_model.dart';
import '../Utils.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

class Open_Req_Screen extends StatefulWidget {
  final String title;
  final String add;
  final String pin;
  final String userName;
  final String city;
  final String? rid;
  final String contactNo;

  const Open_Req_Screen(
      {super.key,
      required this.title,
      required this.add,
      required this.pin,
      required this.userName,
      required this.contactNo,
      required this.city,
      this.rid});

  @override
  State<Open_Req_Screen> createState() => _Open_Req_ScreenState();
}

class _Open_Req_ScreenState extends State<Open_Req_Screen> {
  //to get userType
  String? finalUserType = "";
  String iAmNGO = '';
  String iAmGovt = '';

  //for Request
  String fetchedRid = "";
  String fetchedHasNGOResponded = "";
  String fetchedHasGovtResponded = "";
  String? fetchedService = "";
  String fetchedUsername = "";
  String fetchedCitizenContactNo = "";
  String fetchedCitizenState = "";
  String fetchedCitizenCity = "";
  String fetchedReqAddress = "";
  String fetchedIsTnxComplete = "";
  int? selectedRadioAddress = 1;

  //NGO
  String fetchedNid = "";
  String fetchedNGOName = "";
  String fetchedNGORegNo = "";
  String? fetchedNGOPhone = "";
  String fetchedNGOState = "";
  String fetchedNGOCity = "";
  String fetchedNGOAddress = "";
  String fetchedNGOEmail = "";
  String fetchedNGOWebsite = "";

  //Govt
  String fetchedGid = "";
  String fetchedGovtName = "";
  String fetchedGovtRegNo = "";
  String? fetchedGovtPhone = "";
  String fetchedGovtState = "";
  String fetchedGovtCity = "";
  String fetchedGovtAddress = "";
  String fetchedGovtEmail = "";
  String fetchedGovtWebsite = "";

  bool notificationSent = false;

  @override
  void initState() {
    super.initState();
    //check if its NGO or Govt
    getUserType();
    //get request information from database
    fetchReqData();
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
        title: const Text("$appbar_display_name - Request sent "),
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //table
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.5,
                        ),
                      ),
                      child: DataTable(
                        columnSpacing: 10.0,
                        columns: const [
                          DataColumn(
                              label: Text('Field',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: colorPrimary))),
                          DataColumn(
                              label: Text('Data',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: colorPrimary))),
                        ],
                        rows: [
                          buildDataRow('Name : ', widget.userName),
                          buildDataRow('Request type : ', widget.title),
                          buildDataRow('Address :', fetchedReqAddress),
                          buildDataRow('Pin Code :', widget.pin),
                          buildDataRow('City :', fetchedCitizenCity),
                          buildDataRow('Contact No : ', widget.contactNo),
                        ],
                      ),
                    ),
                    //const SizedBox(height: 40),
                    // Decorated TextFormField widgets
                    // TextFormField(
                    //   keyboardType: TextInputType.text,
                    //   initialValue: widget.userName,
                    //   decoration: InputDecoration(
                    //     labelText: "User Name",
                    //     prefixIcon: const Icon(Icons.account_balance_wallet),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     filled: true,
                    //     //fillColor: Colors.grey[200],
                    //   ),
                    // ),
                    // const SizedBox(height: 25),
                    // TextFormField(
                    //   keyboardType: TextInputType.text,
                    //   initialValue: widget.title,
                    //   decoration: InputDecoration(
                    //     labelText: "Request Type",
                    //     prefixIcon: const Icon(Icons.ac_unit_outlined),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     filled: true,
                    //     //fillColor: Colors.grey[200],
                    //   ),
                    // ),
                    // const SizedBox(height: 25),
                    // TextFormField(
                    //   keyboardType: TextInputType.text,
                    //   initialValue: widget.add,
                    //   decoration: InputDecoration(
                    //     labelText: "Address",
                    //     prefixIcon: const Icon(Icons.location_on),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     filled: true,
                    //     //fillColor: Colors.grey[200],
                    //   ),
                    // ),
                    // const SizedBox(height: 25),
                    // TextFormField(
                    //   keyboardType: TextInputType.text,
                    //   initialValue: widget.pin,
                    //   decoration: InputDecoration(
                    //     labelText: "Pincode",
                    //     prefixIcon: const Icon(Icons.lock),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     filled: true,
                    //     //fillColor: Colors.grey[200],
                    //   ),
                    // ),
                    // const SizedBox(height: 25),
                    // TextFormField(
                    //   keyboardType: TextInputType.text,
                    //   initialValue: widget.city,
                    //   decoration: InputDecoration(
                    //     labelText: "City",
                    //     prefixIcon: const Icon(Icons.person),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     filled: true,
                    //     //fillColor: Colors.grey[200],
                    //   ),
                    // ),
                    // const SizedBox(height: 25),
                    // TextFormField(
                    //   keyboardType: TextInputType.text,
                    //   initialValue: widget.contactNo,
                    //   decoration: InputDecoration(
                    //     labelText: "Contact Number",
                    //     prefixIcon: const Icon(Icons.location_city),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     filled: true,
                    //     //fillColor: Colors.grey[200],
                    //   ),
                    // ),
                    //const SizedBox(height: 25),
                    // fetchedIsTnxComplete == "true"
                    //     ? const Text(
                    //         "Request Transaction completed",
                    //         style: TextStyle(fontSize: 20),
                    //       )
                    //     : const Text(
                    //         "Transaction not completed",
                    //         style: TextStyle(fontSize: 20),
                    //       ),
                    // const SizedBox(height: 25),
                    // ElevatedButton(onPressed: () {}, child: Text("a")),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15),
                  child:
                      // fetchedIsTnxComplete == "false"
                      //     ?
                      Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // Align buttons to the sides
                    children: [
                      //Decline
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 15, top: 10),
                            width: double.infinity,
                            child: ClipRRect(
                                child: ElevatedButton(
                                    onPressed: () async {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return const Center(
                                            child: CircularProgressIndicator(
                                                color: Colors.red),
                                          );
                                        },
                                      );
                                      await Future.delayed(
                                          const Duration(milliseconds: 1200));
                                      Navigator.pop(context);
                                      showToastMsg(
                                          "You've chosen not to respond the emergency ..");
                                      Navigator.pop(context);
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            const MaterialStatePropertyAll(
                                                Colors.deepOrangeAccent),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        18)))),
                                    child: const Text("Decline"))),
                          ),
                        ),
                      ),
                      //Accept
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 15, top: 10),
                            width: double.infinity,
                            child: ClipRRect(
                              child: ElevatedButton(
                                onPressed: () async {
                                  //progress
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return const Dialog(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 35,
                                              bottom: 25,
                                              left: 20,
                                              right: 20),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(height: 15),
                                              CircularProgressIndicator(
                                                  color: Colors.blue),
                                              SizedBox(height: 30),
                                              Text('Processing ...')
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                  await Future.delayed(
                                      const Duration(milliseconds: 1300));
                                  Navigator.pop(context);
                                  //if user is NGO and isResponded
                                  if (iAmNGO == 'true' &&
                                      fetchedHasNGOResponded == 'true') {
                                    showMsgDialog(context,
                                        'Other NGO has responded to this request ..');
                                  }
                                  //if user is Govt and isResponded
                                  else if (iAmGovt == 'true' &&
                                      fetchedHasGovtResponded == 'true') {
                                    showMsgDialog(context,
                                        'Other Govt department has responded to this request ..');
                                  }
                                  //else Responded to req
                                  else {
                                    if (!notificationSent) {
                                      //search and get token of request sender
                                      FirebaseFirestore.instance
                                          .collection('clc_request')
                                          .where('RequestId',
                                              isEqualTo: 'Req_${widget.rid}')
                                          .get()
                                          .then((querySnapshot) {
                                        //add response data into database
                                        addResponseToDatabase();
                                        setState(() {
                                          fetchReqData();
                                        });
                                        for (var doc in querySnapshot.docs) {
                                          String deviceToken =
                                              doc.data()['senderToken'];
                                          //send response to  req sender
                                          sendNotificationToDevice(
                                              deviceToken, "${widget.rid}");
                                        }
                                      });
                                      notificationSent = true;
                                    } else {
                                      showDialogAlert(
                                          context,
                                          'You have already responded to this request '
                                          '\n Kindly reach to desired location immediately..');
                                    }
                                  }
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            Colors.green),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18)))),
                                child: const Text("Accept"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                  //Tnx Completed
                  // : Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Expanded(
                  //         child: Padding(
                  //           padding: const EdgeInsets.only(right: 7.5),
                  //           child: Container(
                  //             padding:
                  //                 const EdgeInsets.only(bottom: 15, top: 10),
                  //             width: double.infinity,
                  //             child: ClipRRect(
                  //                 child: ElevatedButton(
                  //                     onPressed: () {
                  //                       //progress
                  //                       showDialog(
                  //                         context: context,
                  //                         barrierDismissible: false,
                  //                         builder: (BuildContext context) {
                  //                           return const Center(
                  //                             child:
                  //                                 CircularProgressIndicator(
                  //                                     color: Colors.white),
                  //                           );
                  //                         },
                  //                       );
                  //                       Future.delayed(const Duration(
                  //                           milliseconds: 1400));
                  //                       Navigator.pop(context);
                  //                       final snackBar = TsnakeBar(
                  //                           context,
                  //                           "Request has been responded by other authority ..",
                  //                           "hide");
                  //                       ScaffoldMessenger.of(context)
                  //                           .showSnackBar(snackBar);
                  //                     },
                  //                     style: ButtonStyle(
                  //                         backgroundColor:
                  //                             const MaterialStatePropertyAll(
                  //                                 Colors.grey),
                  //                         shape: MaterialStateProperty.all(
                  //                             RoundedRectangleBorder(
                  //                                 borderRadius:
                  //                                     BorderRadius.circular(
                  //                                         18)))),
                  //                     child:
                  //                         const Text("Request Completed !"))),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  ),
            ],
          ),
        ),
      ),
    );
  }

  //to check usertype
  Future<void> getUserType() async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var obtainedUserType = sharedPref.getString("userType");
    setState(() {
      finalUserType = obtainedUserType;
      if (finalUserType == "NGO") {
        iAmNGO = 'true';
        fetchNGOData();
      } else if (finalUserType == "Govt") {
        iAmGovt = 'true';
        fetchGovtData();
      }
    });
  }

  //to fetch requested citizen details
  Future<void> fetchReqData() async {
    try {
      // Fetch data from Firestore
      DocumentSnapshot ReqSnapshot = await FirebaseFirestore.instance
          .collection('clc_request')
          .doc("Req_${widget.rid}")
          .get();

      // Check if the document exists
      if (ReqSnapshot.exists) {
        // Access the fields from the document
        setState(() {
          fetchedRid = ReqSnapshot.get('RequestId');
          fetchedHasNGOResponded = ReqSnapshot.get('hasNGOResponded');
          fetchedHasGovtResponded = ReqSnapshot.get('hasGovtResponded');
          fetchedService = ReqSnapshot.get('neededService');
          fetchedUsername = ReqSnapshot.get('userName');
          fetchedCitizenContactNo = ReqSnapshot.get('contactNumber');
          fetchedCitizenState = ReqSnapshot.get('state');
          fetchedCitizenCity = ReqSnapshot.get('city');
          fetchedReqAddress = ReqSnapshot.get('fullAddress');
          fetchedIsTnxComplete = ReqSnapshot.get('isTransactionCompleted');
        });
      } else {
        if (kDebugMode) {
          print('Document does not exist');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching user data: $e');
      }
    }
  }

  //gets data if current user is NGO
  Future<void> fetchNGOData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      // Fetch data from Firestore
      DocumentSnapshot NGOSnapshot = await FirebaseFirestore.instance
          .collection('clc_ngo')
          .doc(user?.email)
          .get();

      // Check if the document exists
      if (NGOSnapshot.exists) {
        // Access the fields from the document
        setState(() {
          fetchedNid = NGOSnapshot.get('nid');
          fetchedNGOName = NGOSnapshot.get('nameOfNGO');
          fetchedNGORegNo = NGOSnapshot.get('NGORegNo');
          fetchedNGOPhone = NGOSnapshot.get('contactNumber');
          fetchedNGOState = NGOSnapshot.get('state');
          fetchedNGOCity = NGOSnapshot.get('city');
          fetchedNGOAddress = NGOSnapshot.get('fullAddress');
          fetchedNGOEmail = NGOSnapshot.get('email');
          fetchedNGOWebsite = NGOSnapshot.get('website');
        });
      } else {
        if (kDebugMode) {
          print('Document does not exist');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching NGO data: $e');
      }
    }
  }

  //gets data if current user is Govt
  Future<void> fetchGovtData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      // Fetch data from Firestore
      DocumentSnapshot GovtSnapshot = await FirebaseFirestore.instance
          .collection('clc_govt')
          .doc(user?.email)
          .get();
      //print(user!.email);
      //print(GovtSnapshot.get('GovtAgencyRegNo'));

      // Check if the document exists
      if (GovtSnapshot.exists) {
        // Access the fields from the document
        setState(() {
          fetchedGid = GovtSnapshot.get('gid');
          fetchedGovtName = GovtSnapshot.get('GovtAgencyName');
          fetchedGovtRegNo = GovtSnapshot.get('GovtAgencyRegNo');
          fetchedGovtPhone = GovtSnapshot.get('contactNumber');
          fetchedGovtState = GovtSnapshot.get('state');
          fetchedGovtCity = GovtSnapshot.get('city');
          fetchedGovtAddress = GovtSnapshot.get('fullAddress');
          fetchedGovtEmail = GovtSnapshot.get('email');
          fetchedGovtWebsite = GovtSnapshot.get('website');
        });
      } else {
        if (kDebugMode) {
          print('Document does not exist');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching NGO data: $e');
      }
    }
  }

  //to send response notification to user
  void sendNotificationToDevice(
      String deviceToken, String totalDocCount) async {
    var data = {
      'to': deviceToken,
      'priority': 'high',
      'notification': {
        'title': "Respond from your emergency !!!",
        'body': "An authority has responded to your request .."
      },
      'android': {
        'notification': {'notification_count': 23},
      },
      'data': {
        'type': 'response',
        'service': fetchedService,
        'authorityName': iAmNGO == 'true' ? fetchedNGOName : fetchedGovtName,
        'regNo': iAmNGO == 'true' ? fetchedNGORegNo : fetchedGovtRegNo,
        'address': iAmNGO == 'true' ? fetchedNGOAddress : fetchedGovtAddress,
        'phone': iAmNGO == 'true' ? fetchedNGOPhone : fetchedGovtPhone,
        'email': iAmNGO == 'true' ? fetchedNGOEmail : fetchedGovtEmail,
        'city': fetchedCitizenCity,
        'website': iAmNGO == 'true' ? fetchedNGOWebsite : fetchedGovtWebsite,
        'ResponseId': totalDocCount.toString(),
      }
    };

    // Send the notification to the device
    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'key=AAAAqhgqKGQ:APA91bEi_iwrEhn8BbQOG7pfFwUikl3Kp0K1sKAoOadF9Evb8Off1U5EqwljkoMprm5uO-aS_wctndIRoJum30YbvyJIBA5W4TF-EBmL8DRTrY1kHTTsDXaW8wWPLBSrbcgPobzzm8No'
      },
    );
  }

  // to add response data in DB
  void addResponseToDatabase() async {
    var responseDocRef = FirebaseFirestore.instance
        .collection("clc_response")
        .doc("Response_${widget.rid}");

    //Storing data to database
    NGO_Response_Registration ResponseNGOData = NGO_Response_Registration(
        respondId: "Response_${widget.rid}",
        nid: fetchedNid,
        responderNGOName: fetchedNGOName,
        responderNGORegNo: fetchedNGORegNo,
        responderNGOAddress: fetchedNGOAddress,
        responderNGOContactNo: fetchedNGOPhone,
        responderNGOEmail: fetchedNGOEmail,
        responderNGOWebsite: fetchedNGOWebsite);

    Govt_Response_Registration ResponseGovtData = Govt_Response_Registration(
        gid: fetchedGid,
        respondId: "Response_${widget.rid}",
        responderGovtName: fetchedGovtName,
        responderGovtRegNo: fetchedGovtRegNo,
        responderGovtAddress: fetchedGovtAddress,
        responderGovtContactNo: fetchedGovtPhone,
        responderGovtEmail: fetchedGovtEmail,
        responderGovtWebsite: fetchedGovtWebsite);

    Map<String, dynamic> respondNGOJson = ResponseNGOData.toNGORespondJson();
    Map<String, dynamic> respondGovtJson = ResponseGovtData.toGovtRespondJson();

    try {
      //add respond Id into request doc
      await FirebaseFirestore.instance
          .collection("clc_request")
          .doc("Req_${widget.rid}")
          .update({
        'RespondId': "Response_${widget.rid}",
      });

      if (iAmNGO == 'true') {
        //update responded state to true
        await FirebaseFirestore.instance
            .collection("clc_request")
            .doc("Req_${widget.rid}")
            .update({
          'isNGOResponded': 'true',
        });

        //sets NGO response data
        await responseDocRef
            .collection('ngo')
            .doc("ngo_details")
            .set(respondNGOJson);

        // await FirebaseFirestore.instance
        //     .collection("clc_response")
        //     .doc("Response_${widget.rid}")
        //     .set(respondNGOJson);
      }
      //update responded state to true
      else if (iAmGovt == 'true') {
        await FirebaseFirestore.instance
            .collection("clc_request")
            .doc("Req_${widget.rid}")
            .update({
          'isGovtResponded': 'true',
        });

        //sets Govt response data
        await responseDocRef
            .collection('govt')
            .doc("govt_details")
            .set(respondGovtJson);

        // await FirebaseFirestore.instance
        //     .collection("clc_response")
        //     .doc("Response_${widget.rid}")
        //     .set(respondGovtJson);
      }

      Timer(const Duration(milliseconds: 300), () {
        showDialogAlert(context,
            'You are requested to reach emergency place as soon as possible ..');
        showToastMsg("Responded successfully ..");
      });
    } catch (e) {
      // An error occurred
      if (kDebugMode) {
        print('Error adding citizen request  : $e');
      }
    }
  }
}
