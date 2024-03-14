import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../Utils/constants.dart';

//
// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});
//
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   @override
//   Widget build(BuildContext context) => const Scaffold(
//         body: UserProfile(),
//       );
// }
class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool isLoading = true;

  TextEditingController ab = TextEditingController();

  //profile fields
  String fetchedFname = "";
  String fetchedLname = "";
  String fetchedGender = "";
  String? fetchedPhone = "";

  //String fetchedBirthDate = "";
  String fetchedState = "";
  String fetchedCity = "";
  String fetchedPinCode = "";
  String fetchedFullAddress = "";
  String fetchedRegTime = "";
  DateTime birthDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    fetchCitizenData();
    // Simulate a delay to show the progress indicators
    Future.delayed(const Duration(milliseconds: 1100), () {
      setState(() {
        isLoading = false; // Set to false to hide the progress indicators
      });
    });
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
        title: const Text("$appbar_display_name - Profile  Page"),
      ),
      body: isLoading
          ? const Center(
              // Display circular progress indicators
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        //backgroundImage: AssetImage("assets/images/123.png"),
                      ),
                      const SizedBox(height: 20),
                      //name
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          // controller: ab,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Iconsax.location_add),
                              hintText: "$fetchedFname $fetchedLname"),
                          // enabled: false,
                        ),
                      ),
                      const SizedBox(height: 20),
                      //gender
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          // controller: ab,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Iconsax.location_add),
                              hintText: fetchedGender),
                          // enabled: false,
                        ),
                      ),
                      const SizedBox(height: 20),
                      //phone
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          // controller: ab,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Iconsax.location_add),
                              hintText: fetchedPhone),
                          // enabled: false,
                        ),
                      ),
                      const SizedBox(height: 20),
                      //address
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          // controller: ab,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Iconsax.location_add),
                              hintText: fetchedFullAddress),
                          // enabled: false,
                        ),
                      ),
                      const SizedBox(height: 20),
                      //state
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          // controller: ab,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Iconsax.location_add),
                              hintText: fetchedState),
                          // enabled: false,
                        ),
                      ),
                      const SizedBox(height: 20),
                      //city
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          // controller: ab,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Iconsax.location_add),
                              hintText: fetchedCity),
                          // enabled: false,
                        ),
                      ),
                      const SizedBox(height: 20),
                      //pin
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          // controller: ab,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Iconsax.location_add),
                              hintText: fetchedPinCode),
                          // enabled: false,
                        ),
                      ),
                      const SizedBox(height: 20),
                      //reg time
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          // controller: ab,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Iconsax.location_add),
                              hintText: fetchedRegTime),
                          // enabled: false,
                        ),
                      ),

                      // const SizedBox(height: 20),
                      // TextFormField(
                      //   initialValue: fetchedLname,
                      //   enabled: false,
                      // ),
                      // const SizedBox(height: 20),
                      // TextFormField(
                      //   initialValue: fetchedGender,
                      //   enabled: false,
                      // ),
                      // const SizedBox(height: 20),
                      // TextFormField(
                      //   initialValue: fetchedPhone,
                      //   enabled: false,
                      // ),
                      // const SizedBox(height: 20),
                      // TextFormField(
                      //   initialValue: fetchedAge,
                      //   enabled: false,
                      // ),
                      // const SizedBox(height: 20),
                      // TextFormField(
                      //   initialValue: fetchedState,
                      //   enabled: false,
                      // ),
                      const SizedBox(height: 20),

                      // const SizedBox(height: 24),
                      // ElevatedButton(
                      //   onPressed: _updateProfile,
                      //   child: const Text('Update Profile'),
                      // ),
                      // const SizedBox(height: 16),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     // Implement logout logic here
                      //     // For simplicity, navigate to the login screen
                      //     Navigator.of(context).pop();
                      //   },
                      //   child: const Text('Logout'),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

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
          fetchedFname = citizenSnapshot.get('firstName');
          fetchedLname = citizenSnapshot.get('lastName');
          fetchedGender = citizenSnapshot.get('gender');
          fetchedPhone = user!.phoneNumber;
          fetchedState = citizenSnapshot.get('state');
          fetchedCity = citizenSnapshot.get('city');
          fetchedPinCode = citizenSnapshot.get('pinCode');
          fetchedFullAddress = citizenSnapshot.get('fullAddress');
          fetchedRegTime = citizenSnapshot.get('registrationTime');
          fetchedRegTime = fetchedRegTime.substring(0, 10);
          // String? fetchedBirthDate = citizenSnapshot.get('birthDate');
          // if (fetchedBirthDate != null) {
          //   birthDate = DateTime.parse(fetchedBirthDate);
          //   //fetchedAge = calculateAge(birthDate).toString();
          // }
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

// int calculateAge(DateTime birthDate) {
//   final now = DateTime.now();
//   int age = now.year - birthDate.year;
//   if (now.month < birthDate.month ||
//       (now.month == birthDate.month && now.day < birthDate.day)) {
//     age--;
//   }
//   return age;
// }
}
