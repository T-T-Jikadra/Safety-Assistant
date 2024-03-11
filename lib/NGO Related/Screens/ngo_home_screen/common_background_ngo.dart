// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../Citizen Related/Screens/citizen_request.dart';
import '../../../Components/Notification_related/notification_services.dart';

class commonbg_ngo extends StatefulWidget {
  const commonbg_ngo({super.key});

  @override
  State<commonbg_ngo> createState() => _commonbg_ngoState();
}

class _commonbg_ngoState extends State<commonbg_ngo> {
  NotificationServices notificationServices = NotificationServices();
  String fetchedState = "";
  String fetchedCity = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchNGOData();
    //for notification permission pop up
    notificationServices.requestNotificationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Just remove the 3 Positioned widgets as soon as possible
        // Positioned(
        //     width: MediaQuery.of(context).size.width * 1.7,
        //     bottom: 200,
        //     left: 100,
        //     child: Image.asset("assets/Backgrounds/Spline.png")),
        // Positioned.fill(
        //   child: BackdropFilter(
        //     filter: ImageFilter.blur(sigmaX: 78, sigmaY: 78),
        //   ),
        // ),
        // const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: const SizedBox(),
          ),
        ),

        //home page starts from here
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 80, top: 25),
              child: Row(
                children: [
                  const Icon(Icons.location_on_outlined,
                      color: Colors.redAccent, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    "$fetchedCity, $fetchedState",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.black12,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Temsting",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                child: const Text("It's NGO Home Page"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const userRequest_Screen()));
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> fetchNGOData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      // Fetch data from Firestore
      DocumentSnapshot GovtSnapshot = await FirebaseFirestore.instance
          .collection('clc_ngo')
          .doc(user?.email)
          .get();

      // Check if the document exists
      if (GovtSnapshot.exists) {
        // Access the fields from the document
        setState(() {
          fetchedState = GovtSnapshot.get('state');
          fetchedCity = GovtSnapshot.get('city');
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
}
