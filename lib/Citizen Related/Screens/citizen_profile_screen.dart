// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
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

  //profile fields
  String fetchedFname = "";
  String fetchedLname = "";
  String? fetchedGender = "";
  String? fetchedPhone = "";
  String fetchedState = "";
  String fetchedCity = "";
  String fetchedPinCode = "";
  String fetchedFullAddress = "";
  String fetchedRegTime = "";
  late Timestamp fetchedBirthDate;

  int userAge = 0;

  TextEditingController fnameTextController = TextEditingController();
  TextEditingController lnameTextController = TextEditingController();
  TextEditingController birthDateTextController = TextEditingController();
  TextEditingController addressTextController = TextEditingController();
  TextEditingController stateTextController = TextEditingController();
  TextEditingController cityTextController = TextEditingController();
  TextEditingController pincodeTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Execute fetchCitizenData and set isLoading to false when completed
    fetchCitizenData().then((_) {
      setState(() {
        isLoading = false;
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
        title: const Text("$appbar_display_name - Profile Page"),
      ),
      body: isLoading
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: CircleAvatar(
                              radius: 30,
                              //backgroundImage: AssetImage("assets/images/123.png"),
                            ),
                          ),
                          const SizedBox(height: 20),
                          //name
                          const Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 3),
                            child: Text("Username :"),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 55,
                                  child: TextFormField(
                                    controller: fnameTextController,
                                    decoration: InputDecoration(
                                        prefixIcon:
                                            const Icon(Iconsax.location_add),
                                        hintText: fetchedFname),
                                    // enabled: false,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: SizedBox(
                                  height: 55,
                                  child: TextFormField(
                                    controller: lnameTextController,
                                    decoration: InputDecoration(
                                        prefixIcon:
                                            const Icon(Iconsax.location_add),
                                        hintText: fetchedLname),
                                    // enabled: false,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          //gender
                          const Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 3),
                            child: Text("Gender :"),
                          ),

                          SizedBox(
                            //height: 55,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                      value: 'Male',
                                      groupValue: fetchedGender,
                                      onChanged: (value) {
                                        setState(() {
                                          fetchedGender = value;
                                        });
                                      },
                                    ),
                                    const Text('Male'),
                                    Radio(
                                      value: 'Female',
                                      groupValue: fetchedGender,
                                      onChanged: (value) {
                                        setState(() {
                                          fetchedGender = value;
                                        });
                                      },
                                    ),
                                    const Text('Female'),
                                    Radio(
                                      value: 'Other',
                                      groupValue: fetchedGender,
                                      onChanged: (value) {
                                        setState(() {
                                          fetchedGender = value;
                                        });
                                      },
                                    ),
                                    const Text('Other'),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 55,
                            child: TextFormField(
                              // controller: ab,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Iconsax.location_add),
                                  hintText: fetchedGender),
                              // enabled: false,
                            ),
                          ),
                          const SizedBox(height: 10),
                          //BirthDate
                          const Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 3),
                            child: Text("Birth Date :"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 5,
                              right: 5,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                _selectDate(context);
                              },
                              child: AbsorbPointer(
                                child: TextFormField(
                                  controller: birthDateTextController,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    hintText: DateFormat('MMMM dd, yyyy')
                                        .format(fetchedBirthDate.toDate()),
                                    prefixIcon: Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          20, 16, 12, 16),
                                      child: SvgPicture.asset(svg_for_calendar),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Select Birth date';
                                    }
                                    return null; // Return null if the input is valid
                                  },
                                  onEditingComplete: () {
                                    // Move focus to the next field when "Enter" is pressed
                                    FocusScope.of(context).nextFocus();
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          //phone
                          const Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 3),
                            child: Text("Phone number :"),
                          ),
                          SizedBox(
                            height: 55,
                            child: TextFormField(
                              enabled: false,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Iconsax.location_add),
                                  hintText: fetchedPhone),
                              // enabled: false,
                            ),
                          ),
                          const SizedBox(height: 10),
                          //address
                          const Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 3),
                            child: Text("Full Address :"),
                          ), //address
                          SizedBox(
                            //height: 55,
                            child: TextFormField(
                              maxLength: 100,
                              minLines: 2,
                              maxLines: 4,
                              controller: addressTextController,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Iconsax.location_add),
                                  hintText: fetchedFullAddress),
                              // enabled: false,
                            ),
                          ),

                          const SizedBox(height: 10),
                          //pincode
                          const Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 3),
                            child: Text("Pincode :"),
                          ), //pin
                          SizedBox(
                            height: 55,
                            child: TextFormField(
                              controller: pincodeTextController,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Iconsax.location_add),
                                  hintText: fetchedPinCode),
                              // enabled: false,
                            ),
                          ),
                          const SizedBox(height: 10),
                          //city
                          const Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 3),
                            child: Text("City :"),
                          ), //city
                          SizedBox(
                            height: 55,
                            child: TextFormField(
                              controller: cityTextController,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Iconsax.location_add),
                                  hintText: fetchedCity),
                              // enabled: false,
                            ),
                          ),
                          const SizedBox(height: 10),
                          //state
                          const Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 3),
                            child: Text("State :"),
                          ), //state
                          SizedBox(
                            height: 55,
                            child: TextFormField(
                              controller: stateTextController,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Iconsax.location_add),
                                  hintText: fetchedState),
                              // enabled: false,
                            ),
                          ),

                          const SizedBox(height: 20),
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              decoration: BoxDecoration(
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey.withOpacity(0.1),
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 5),
                                  Text("Citizen Age : ${userAge.toString()}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15)),
                                  const SizedBox(height: 20),
                                  Text("User registered at  : $fetchedRegTime",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600)),
                                  const SizedBox(height: 15),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 9),
                  //btn
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 2),
                      width: double.infinity,
                      child: ClipRRect(
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18)))),
                              child: const Text("Update Profile"))),
                    ),
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
          fetchedRegTime = fetchedRegTime.substring(0, 20);
          fetchedBirthDate = citizenSnapshot.get('birthDate');
          DateTime birthDate = fetchedBirthDate.toDate();
          DateTime currentDate = DateTime.now();
          userAge = currentDate.year - birthDate.year;
          if (currentDate.month < birthDate.month ||
              (currentDate.month == birthDate.month &&
                  currentDate.day < birthDate.day)) {
            userAge--;
          }
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.blue, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black, // Body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue, // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    // ignore: unrelated_type_equality_checks
    if (pickedDate != null && pickedDate != birthDateTextController.text) {
      final formattedDate = DateFormat.yMMMd()
          .format(pickedDate); // Format date to show day, month, year
      setState(() {
        fetchedBirthDate =
            Timestamp.fromDate(pickedDate); // Convert back to Timestamp
        birthDateTextController.text =
            DateFormat('MMMM dd, yyyy').format(pickedDate);
        birthDateTextController.text = formattedDate;
      });
    }
  }
}
