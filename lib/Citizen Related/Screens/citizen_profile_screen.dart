// ignore_for_file: library_private_types_in_public_api, depend_on_referenced_packages, unrelated_type_equality_checks, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import '../../Utils/Utils.dart';
import '../../Utils/constants.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool isLoading = true;
  bool isMale = true;
  bool isEditing = false;

  String fetchedFname = "";
  String fetchedLname = "";
  String? fetchedGender = "";
  String? fetchedPhone = "";
  String fetchedState = "";
  String fetchedCity = "";
  String fetchedPinCode = "";
  String fetchedFullAddress = "";
  String fetchedRegTime = "";
  String selectedGender = '';
  late Timestamp fetchedBirthDate = Timestamp.now();

  int userAge = 0;

  TextEditingController fnameTextController = TextEditingController();
  TextEditingController lnameTextController = TextEditingController();
  TextEditingController birthDateTextController = TextEditingController();
  TextEditingController addressTextController = TextEditingController();
  TextEditingController pincodeTextController = TextEditingController();
  TextEditingController stateTextController = TextEditingController();
  TextEditingController cityTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
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
            bottomLeft: Radius.circular(25),
          ),
        ),
        title: const Text("$appbar_display_name - Profile Page"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              icon: Icon(isEditing ? Iconsax.tick_circle4 : Iconsax.edit),
              onPressed: () {
                setState(() {
                  isEditing = !isEditing;
                });
              },
            ),
          ),
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
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
                          Center(
                            child: CircleAvatar(
                              radius: 37,
                              backgroundImage: isMale
                                  ? const AssetImage("assets/images/man.png")
                                  : const AssetImage("assets/images/woman.png"),
                            ),
                          ),
                          const SizedBox(height: 15),
                          AbsorbPointer(
                            absorbing: !isEditing,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 10, bottom: 3),
                                  child: Text("Username :"),
                                ),
                                //username
                                Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        height: 55,
                                        child: TextFormField(
                                          controller: fnameTextController,
                                          decoration: InputDecoration(
                                            prefixIcon:
                                                const Icon(Icons.person),
                                            hintText: fetchedFname,
                                          ),
                                          enabled: isEditing,
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
                                            prefixIcon: const Icon(
                                                Icons.person_outline_outlined),
                                            hintText: fetchedLname,
                                          ),
                                          enabled: isEditing,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10, bottom: 3),
                                  child: Text("Gender :"),
                                ),
                                //gender
                                SizedBox(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Radio(
                                            value: 'Male',
                                            groupValue: selectedGender,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedGender =
                                                    value.toString();
                                                isMale =
                                                    true; // Set isMale to true when Male is selected
                                              });
                                            },
                                            toggleable: isEditing,
                                          ),
                                          const Text('Male'),
                                          const SizedBox(width: 10),
                                          Radio(
                                            value: 'Female',
                                            groupValue: selectedGender,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedGender =
                                                    value.toString();
                                                isMale =
                                                    false; // Set isMale to false when Female is selected
                                              });
                                            },
                                            toggleable: isEditing,
                                          ),
                                          const Text('Female'),
                                          const SizedBox(width: 10),
                                          Radio(
                                            value: 'Other',
                                            groupValue: selectedGender,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedGender =
                                                    value.toString();
                                              });
                                            },
                                            toggleable: isEditing,
                                          ),
                                          const Text('Other'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10, bottom: 3),
                                  child: Text("Birth Date :"),
                                ),
                                //birthdate
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  child: GestureDetector(
                                    onTap: () {
                                      if (isEditing) {
                                        _selectDate(context);
                                      }
                                    },
                                    child: AbsorbPointer(
                                      absorbing: !isEditing,
                                      child: TextFormField(
                                        controller: birthDateTextController,
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                20), // Make it round
                                          ),
                                          hintText: DateFormat('MMMM dd, yyyy')
                                              .format(
                                                  fetchedBirthDate.toDate()),
                                          prefixIcon: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                20, 16, 12, 16),
                                            child: SvgPicture.asset(
                                                svg_for_calendar),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Select Birth date';
                                          }
                                          return null;
                                        },
                                        enabled:
                                            isEditing, // Always disabled for editing directly
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10, bottom: 3),
                                  child: Text("Phone number :"),
                                ),
                                //phone
                                SizedBox(
                                  height: 55,
                                  child: TextFormField(
                                    enabled: false,
                                    decoration: InputDecoration(
                                      prefixIcon:
                                          const Icon(Iconsax.location_add),
                                      hintText: fetchedPhone,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10, bottom: 3),
                                  child: Text("Full Address :"),
                                ),
                                //address
                                SizedBox(
                                  child: TextFormField(
                                    maxLength: 100,
                                    minLines: 2,
                                    maxLines: 4,
                                    controller: addressTextController,
                                    decoration: InputDecoration(
                                      prefixIcon:
                                          const Icon(Iconsax.location_add),
                                      hintText: fetchedFullAddress,
                                    ),
                                    enabled: isEditing,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10, bottom: 3),
                                  child: Text("Pincode :"),
                                ),
                                //pincode
                                SizedBox(
                                  height: 55,
                                  child: TextFormField(
                                    controller: pincodeTextController,
                                    decoration: InputDecoration(
                                      prefixIcon:
                                          const Icon(Iconsax.location_add),
                                      hintText: fetchedPinCode,
                                    ),
                                    enabled: isEditing,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10, bottom: 3),
                                  child: Text("City :"),
                                ),
                                //city
                                SizedBox(
                                  height: 55,
                                  child: TextFormField(
                                    controller: cityTextController,
                                    decoration: InputDecoration(
                                      prefixIcon:
                                          const Icon(Iconsax.location_add),
                                      hintText: fetchedCity,
                                    ),
                                    enabled: isEditing,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10, bottom: 3),
                                  child: Text("State :"),
                                ),
                                //state
                                SizedBox(
                                  height: 55,
                                  child: TextFormField(
                                    controller: stateTextController,
                                    decoration: InputDecoration(
                                      prefixIcon:
                                          const Icon(Iconsax.location_add),
                                      hintText: fetchedState,
                                    ),
                                    enabled: isEditing,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          //extra details
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
                                  const SizedBox(height: 15),
                                  Text(
                                    "Citizen Age : ${userAge.toString()}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    "User registered at  : $fetchedRegTime",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600),
                                  ),
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
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 2),
                      width: double.infinity,
                      child: ClipRRect(
                        child: ElevatedButton(
                          onPressed: () {
                            if (isEditing == false) {
                              showSnakeBar(
                                  context,
                                  "Enable editing to edit your profile ..",
                                  "Okay");
                            } else {
                              updateUserProfile();
                            }
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                          ),
                          child: const Text("Update Profile"),
                        ),
                      ),
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

      DocumentSnapshot citizenSnapshot = await FirebaseFirestore.instance
          .collection('clc_citizen')
          .doc(user?.phoneNumber)
          .get();

      if (citizenSnapshot.exists) {
        setState(() {
          fetchedFname = citizenSnapshot.get('firstName');
          fetchedLname = citizenSnapshot.get('lastName');
          fetchedGender = citizenSnapshot.get('gender');
          selectedGender = fetchedGender!;
          if (fetchedGender == 'Female') {
            setState(() {
              isMale = false;
            });
          }
          fetchedPhone = user!.phoneNumber;
          fetchedState = citizenSnapshot.get('state');
          fetchedCity = citizenSnapshot.get('city');
          fetchedPinCode = citizenSnapshot.get('pinCode');
          fetchedFullAddress = citizenSnapshot.get('fullAddress');
          fetchedRegTime = citizenSnapshot.get('registrationTime');
          fetchedRegTime = fetchedRegTime.substring(0, 20);
          fetchedBirthDate = citizenSnapshot.get('birthDate');
          birthDateTextController.text =
              DateFormat('MMMM dd, yyyy').format(fetchedBirthDate.toDate());
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
              primary: Colors.blue,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      final formattedDate = DateFormat('MMMM dd, yyyy').format(pickedDate);
      setState(() {
        fetchedBirthDate = Timestamp.fromDate(pickedDate);
        birthDateTextController.text = formattedDate;
      });
    }
  }

  Future<void> updateUserProfile() async {
    try {
      String dateString = birthDateTextController.text;
      DateTime birthDate = DateFormat('MMMM dd, yyyy').parse(dateString);

      User? user = FirebaseAuth.instance.currentUser;

      Map<String, dynamic> updatedData = {
        if (fnameTextController.text.isNotEmpty)
          'firstName': fnameTextController.text,
        if (lnameTextController.text.isNotEmpty)
          'lastName': lnameTextController.text,
        if (fetchedGender != selectedGender) 'gender': selectedGender,
        if (birthDate != fetchedBirthDate.toDate()) 'birthDate': birthDate,
        if (stateTextController.text.isNotEmpty)
          'state': stateTextController.text,
        if (cityTextController.text.isNotEmpty) 'city': cityTextController.text,
        if (pincodeTextController.text.isNotEmpty)
          'pinCode': pincodeTextController.text,
        if (addressTextController.text.isNotEmpty)
          'fullAddress': addressTextController.text,
      };

      // Check if any field is edited
      if (updatedData.isNotEmpty) {
        // Update data in Firestore only for non-empty fields
        await FirebaseFirestore.instance
            .collection('clc_citizen')
            .doc(user?.phoneNumber)
            .update(updatedData);

        setState(() {
          isEditing = false;
        });
        showSnakeBar(context, "user profile updated successfully .. ", "Okay");
      } else {
        // setState(() {isEditing = false;});
        showSnakeBar(context, "No profile data edited !", "Okay");
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error updating user profile: $e');
      }
      showSnakeBar(context, "$e!", "Okay");
    }
  }

}
