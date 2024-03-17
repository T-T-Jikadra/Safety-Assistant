// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fff/Models/alert_opened_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Open_Alert_Screen extends StatefulWidget {
  final String? alertId;
  final String title;
  final String desc;
  final String level;
  final String dos;
  final String donts;

  const Open_Alert_Screen({
    super.key,
    required this.alertId,
    required this.title,
    required this.desc,
    required this.level,
    required this.dos,
    required this.donts,
  });

  @override
  State<Open_Alert_Screen> createState() => _Open_Alert_ScreenState();
}

class _Open_Alert_ScreenState extends State<Open_Alert_Screen> {
  String? finalUserType = "";
  String user_id = "";

  @override
  void initState() {
    super.initState();
    //check if its NGO or Govt
    getUserType();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text("Alert_${widget.alertId}\n"
                  " ${widget.title}\n"
                  " ${widget.desc}\n"
                  " ${widget.level}\n"
                  " ${widget.dos}\n"
                  " ${widget.donts}"),
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
      if (finalUserType == "Citizen") {
        fetchCitizenData().then((value) => addAlertOpenedToDatabase());
      } else if (finalUserType == "NGO") {
        //iAmNGO = 'true';
        fetchNGOData().then((value) => addAlertOpenedToDatabase());
      } else if (finalUserType == "Govt") {
        //iAmGovt = 'true';
        fetchGovtData().then((value) => addAlertOpenedToDatabase());
      }
    });
  }

  //gets data if current user is Citizen
  Future<void> fetchCitizenData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      // Fetch data from Firestore
      DocumentSnapshot citizenSnapshot = await FirebaseFirestore.instance
          .collection('clc_citizen')
          .doc(user?.phoneNumber)
          .get();

      // Check if the document exists
      if (citizenSnapshot.exists) {
        // Access the fields from the document
        setState(() {
          user_id = citizenSnapshot.get('cid');
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
          user_id = NGOSnapshot.get('nid');
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
          user_id = GovtSnapshot.get('gid');
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

//Storing alert open data to database
  void addAlertOpenedToDatabase() async {
    //for unique doc numbering
    CollectionReference alertOpenCollection =
        FirebaseFirestore.instance.collection("clc_opened_alerts");

    QuerySnapshot snapshot = await alertOpenCollection.get();
    int totalDocCount = snapshot.size;
    totalDocCount++;

    var AlertOpenDocRef = FirebaseFirestore.instance
        .collection("clc_opened_alerts")
        .doc("Alert_Open_$totalDocCount");

    Alert_Opened_Registration AlertOpenData = Alert_Opened_Registration(
      alert_open_Id: "Alert_Open_$totalDocCount",
      alert_id: "Alert_${widget.alertId}",
      user_id: user_id,
    );

    Map<String, dynamic> AlertOpenJson = AlertOpenData.toJsonOpenAlert();

    try {
      await AlertOpenDocRef.set(AlertOpenJson);
    } catch (e) {
      // An error occurred
      if (kDebugMode) {
        print('Error adding alert open document : $e');
      }
    }
  }
}
