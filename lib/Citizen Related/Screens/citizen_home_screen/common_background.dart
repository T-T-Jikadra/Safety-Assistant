// ignore_for_file: camel_case_types
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../Components/Notification_related/message_screen.dart';
import '../../../Components/Notification_related/notification_services.dart';

class commonbg extends StatefulWidget {
  const commonbg({super.key});

  @override
  State<commonbg> createState() => _commonbgState();
}

class _commonbgState extends State<commonbg> {
  NotificationServices notificationServices = NotificationServices();
  String fetchedState = "";
  String fetchedCity = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCitizenData();
    //for notification permission pop up
    notificationServices.requestNotificationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white12,
        body: Stack(
          children: [
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
            // const Rive Animation.asset("assets/RiveAssets/shapes.riv"),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
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
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    // height: 150,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.black12,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                              "Need any help in any disaster ? \n TAP HERE ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16)),
                          const SizedBox(height: 20),
                          OutlinedButton(
                            style: const ButtonStyle(
                                enableFeedback: true,
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                                foregroundColor:
                                    MaterialStatePropertyAll(Colors.red)),
                            child: const Text("Request for any Emergency"),
                            onPressed: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const msgScreen(),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    var begin = const Offset(1.0, 0.0);
                                    var end = Offset.zero;
                                    var curve = Curves.ease;

                                    var tween = Tween(begin: begin, end: end)
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ),
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
