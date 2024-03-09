// ignore_for_file: camel_case_types, use_build_context_synchronously, non_constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Models/Request_Notification_Model.dart';
import '../Utils.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

class req_open extends StatefulWidget {
  final String title;
  final String add;
  final String pin;
  final String userName;
  final String city;
  final String? rid;
  final String contactNo;

  const req_open(
      {super.key,
      required this.title,
      required this.add,
      required this.pin,
      required this.userName,
      required this.contactNo,
      required this.city,
      this.rid});

  @override
  State<req_open> createState() => _req_openState();
}

class _req_openState extends State<req_open> {

  //userType
  String? finalUserType = "";

  //for Request
  String fetchedRid = "";
  String? fetchedService = "";
  String fetchedUsername = "";
  String fetchedCitizenContactNo = "";
  String fetchedCitizenState = "";
  String fetchedCitizenCity = "";
  String fetchedReqAddress = "";
  String fetchedIsTnxComplete = "";
  int? selectedRadioAddress = 1;
  bool isTrue = false;

  //NGO
  String fetchedAuthorityName = "";
  String? fetchedAuthorityPhone = "";
  String fetchedAuthorityState = "";
  String fetchedAuthorityCity = "";
  // String fetchedPinCode = "";
  String fetchedAuthorityAddress = "";

  //Govt
  // String fetchedGovtFname = "";
  // String? fetchedGovtPhone = "";
  // String fetchedGovtState = "";
  // String fetchedGovtCity = "";
  // // String fetchedPinCode = "";
  // String fetchedGovtAddress = "";

  @override
  void initState() {
    super.initState();
    //check if its NGO or Govt
    getUserType();
    fetchCitizenReqData();
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
                    const SizedBox(height: 40),
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
                    const SizedBox(height: 25),
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
                  child: fetchedIsTnxComplete == "false"
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // Align buttons to the sides
                          children: [
                            //Decline
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      bottom: 15, top: 10),
                                  width: double.infinity,
                                  child: ClipRRect(
                                      child: ElevatedButton(
                                          onPressed: () async {},
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
                                  padding: const EdgeInsets.only(
                                      bottom: 15, top: 10),
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
                                                  color: Colors.white),
                                            );
                                          },
                                        );
                                        await Future.delayed(
                                            const Duration(milliseconds: 1400));
                                        Navigator.pop(context);








                                        FirebaseFirestore.instance
                                            .collection('Citizen Request')
                                            .where('RequestId', isEqualTo: 'Req_${widget.rid}')
                                            .get()
                                            .then((querySnapshot) {
                                          addResponseToDatabase();
                                          for (var doc in querySnapshot.docs) {

                                            String deviceToken = doc.data()['senderToken'];
                                            sendNotificationToDevice(
                                                deviceToken, "${widget.rid}");
                                          }
                                        });
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              const MaterialStatePropertyAll(
                                                  Colors.green),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18)))),
                                      child: const Text("Accept"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      //Tnx Completed
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 7.5),
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      bottom: 15, top: 10),
                                  width: double.infinity,
                                  child: ClipRRect(
                                      child: ElevatedButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              barrierDismissible: false,
                                              builder: (BuildContext context) {
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                          color: Colors.white),
                                                );
                                              },
                                            );
                                            Future.delayed(const Duration(
                                                milliseconds: 1400));
                                            Navigator.pop(context);
                                            final snackBar = TsnakeBar(
                                                context,
                                                "Request has been responded by other authority ..",
                                                "hide");
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          },
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  const MaterialStatePropertyAll(
                                                      Colors.grey),
                                              shape: MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18)))),
                                          child: const Text(
                                              "Request Completed !"))),
                                ),
                              ),
                            ),
                          ],
                        )),
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
        fetchNGOData();
      } else if (finalUserType == "Govt") {
        fetchGovtData();
      }
    });
  }

  //to fetch requested citizen details
  Future<void> fetchCitizenReqData() async {
    try {
      // Fetch data from Firestore
      DocumentSnapshot citizenReqSnapshot = await FirebaseFirestore.instance
          .collection('Citizen Request')
          .doc("Req_${widget.rid}")
          .get();

      // Check if the document exists
      if (citizenReqSnapshot.exists) {
        // Access the fields from the document
        setState(() {
          fetchedRid = citizenReqSnapshot.get('RequestId');
          fetchedService = citizenReqSnapshot.get('neededService');
          fetchedUsername = citizenReqSnapshot.get('userName');
          fetchedCitizenContactNo = citizenReqSnapshot.get('contactNumber');
          fetchedCitizenState = citizenReqSnapshot.get('state');
          fetchedCitizenCity = citizenReqSnapshot.get('city');
          fetchedReqAddress = citizenReqSnapshot.get('fullAddress');
          fetchedIsTnxComplete =
              citizenReqSnapshot.get('isTransactionCompleted');
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
          .collection('NGO')
          .doc(user?.email)
          .get();

      // Check if the document exists
      if (NGOSnapshot.exists) {
        // Access the fields from the document
        setState(() {
          fetchedAuthorityName = NGOSnapshot.get('nameOfNGO');
          fetchedAuthorityPhone = user!.phoneNumber;
          fetchedAuthorityState = NGOSnapshot.get('state');
          fetchedAuthorityCity = NGOSnapshot.get('city');
          // fetchedPinCode = NGOSnapshot.get('pinCode');
          fetchedAuthorityAddress = NGOSnapshot.get('fullAddress');
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
          .collection('Govt')
          .doc(user?.email)
          .get();

      // Check if the document exists
      if (GovtSnapshot.exists) {
        // Access the fields from the document
        setState(() {
          fetchedAuthorityName = GovtSnapshot.get('GovtAgencyName');
          fetchedAuthorityPhone = user!.phoneNumber;
          fetchedAuthorityState = GovtSnapshot.get('state');
          fetchedAuthorityCity = GovtSnapshot.get('city');
          // fetchedPinCode = GovtSnapshot.get('pinCode');
          fetchedAuthorityAddress = GovtSnapshot.get('fullAddress');
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
  void sendNotificationToDevice(String deviceToken, String totalDocCount) async {
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
        'title': "Got response for -$fetchedService",
        'address': fetchedAuthorityAddress,
        'pincode': "",
        'username': fetchedAuthorityName,
        'city': fetchedCitizenCity,
        'phoneNumber': fetchedAuthorityPhone,
        'ReqId': totalDocCount.toString(),
        //'type': 'alert'
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
    //Storing data to database
    Response_Registration ResponseData = Response_Registration(
        respondId: "Response_${widget.rid}",
        responderName: fetchedAuthorityName,
        responderRegNo: '',
        responderAddress: fetchedAuthorityAddress,
        responderContactNo: fetchedAuthorityPhone,
        responderEmail: '',
        responderWebsite: '',
        deviceToken: '',
    );

    Map<String, dynamic> respondJson = ResponseData.toRespondJson();

    try {
      await FirebaseFirestore.instance
          .collection("Authority Respond")
          .doc("Response_${widget.rid}")
          .set(respondJson);

      Timer(const Duration(milliseconds: 800), () {
        showMsgDialog(context,
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
