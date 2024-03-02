// ignore_for_file: camel_case_types

import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../../../Components/Notification_related/message_screen.dart';

class commonbg extends StatefulWidget {
  const commonbg({super.key});

  @override
  State<commonbg> createState() => _commonbgState();
}

class _commonbgState extends State<commonbg> {
  String fetchedState = "";
  String fetchedCity = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCitizenData();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset("assets/Backgrounds/Spline.png")),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 78, sigmaY: 78),
          ),
        ),
        const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 78, sigmaY: 78),
            child: const SizedBox(),
          ),
        ),

        //home design
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
                        fontSize: 16, fontWeight: FontWeight.bold),
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
                  child: Text("Temsting"),
                ),
              ),
            ),
            const SizedBox(height: 30),

            Center(
              child: ElevatedButton(
                child: const Text("Click"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const msgScreen())
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> fetchCitizenData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      // Fetch data from Firestore
      DocumentSnapshot citizenSnapshot = await FirebaseFirestore.instance
          .collection('Citizens')
          .doc(user?.phoneNumber)
          .get();

      // Check if the document exists
      if (citizenSnapshot.exists) {
        // Access the fields from the document
        setState(() {
          fetchedState = citizenSnapshot.get('state');
          fetchedCity = citizenSnapshot.get('city');
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
