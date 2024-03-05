// ignore_for_file: camel_case_types
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../Utils/constants.dart';
import '../../Utils/dropdown_Items.dart';

class userRequest_Screen extends StatefulWidget {
  const userRequest_Screen({super.key});

  @override
  State<userRequest_Screen> createState() => _userRequest_ScreenState();
}

class _userRequest_ScreenState extends State<userRequest_Screen>
    with SingleTickerProviderStateMixin {
  //profile fields
  String fetchedFname = "";
  String? fetchedPhone = "";
  String fetchedState = "";
  String fetchedCity = "";
  String fetchedPinCode = "";
  String fetchedFullAddress = "";
  String selectedService = "";
  int? selectedRadioAddress = 1;
  bool showTextField = false;
  bool isExpanded = false;
  bool isFetched = false;

  //late AnimationController _controller;
  //late Animation<double> _heightAnimation;

  TextEditingController addressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    fetchCitizenData();
    Future.delayed(const Duration(milliseconds: 1600), () {
      setState(() {
        isFetched = true;
      });
    });
    // _controller = AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 300),
    // );
    // _heightAnimation = Tween<double>(begin: 0, end: 100).animate(
    //   CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
    // );
    super.initState();
    selectedService = DropdownItems.dropdownItemRequestTypes.first;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 50,
          backgroundColor: Colors.black12,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25))),
          title: const Text("$appbar_display_name - Request  "),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 25),
                      padding: EdgeInsets.only(
                          //for fields that are covered under keyboard
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                          left: 2,
                          right: 2),
                      child: Column(
                        children: [
                          const SizedBox(height: 25),
                          const Text("Request by filling up form : ",
                              style: TextStyle(fontSize: 16)),
                          const SizedBox(height: 25),
                          //service list
                          Flex(
                            direction: Axis.horizontal,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: SizedBox(
                                    //height: 60,
                                    child: DropdownButtonFormField<String>(
                                      value: selectedService,
                                      items: DropdownItems
                                          .dropdownItemRequestTypes
                                          .map((String state) {
                                        return DropdownMenuItem<String>(
                                          // alignment: AlignmentDirectional.topStart,
                                          value: state,
                                          child: Text(state),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedService = value!;
                                          // Update city list based on the selected state
                                        });
                                      },
                                      decoration: const InputDecoration(
                                        // border: OutlineInputBorder(),
                                        hintText: "Select your service",
                                      ),
                                      validator: (value) {
                                        if (value ==
                                            "Select Govt Agency State") {
                                          return 'Select Govt Agency State';
                                        }
                                        return null; // Return null if the input is valid
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          //Home address
                          Row(
                            children: [
                              Radio(
                                value: 1,
                                groupValue: selectedRadioAddress,
                                onChanged: (value) {
                                  setState(() {
                                    selectedRadioAddress = value;
                                    showTextField = false;
                                    //_controller.forward();
                                    // isExpanded = false;
                                  });
                                },
                              ),
                              const Text('Registered Address'),
                            ],
                          ),
                          const SizedBox(height: 10),
                          //new address
                          Row(
                            children: [
                              Radio(
                                value: 2,
                                groupValue: selectedRadioAddress,
                                onChanged: (value) {
                                  setState(() {
                                    selectedRadioAddress = value;
                                    showTextField = true;
                                    isExpanded = true;
                                    // _controller.reverse();
                                  });
                                },
                              ),
                              const Text('New Address'),
                            ],
                          ),
                          const SizedBox(height: 15),
                          if (selectedRadioAddress == 1)
                            isFetched
                                ? Text(
                                    "$fetchedFname \n $fetchedFullAddress \n $fetchedPinCode \n $fetchedCity \n $fetchedState ",
                                    style: const TextStyle(fontSize: 14),
                                  )
                                : const SpinKitThreeBounce(
                                    color: Colors.blueGrey,
                                    size: 20,
                                  ),
                          if (selectedRadioAddress == 2)
                            AnimatedSize(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              //vsync: this,
                              child: SizedBox(
                                //height: isExpanded ? null : 0,
                                child: AnimatedOpacity(
                                  opacity: showTextField ? 1.0 : 0.0,
                                  duration: const Duration(milliseconds: 300),
                                  child: Column(
                                    children: [
                                      const Text(
                                          "Enter your new address location : ",
                                          style: TextStyle(fontSize: 15)),
                                      const SizedBox(height: 20),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: TextFormField(
                                          controller: addressController,
                                          decoration: const InputDecoration(
                                              hintText: 'Enter full Address',
                                              prefixIcon: Icon(Icons.location_history),
                                              labelText: 'Address'),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: TextFormField(
                                          controller: pincodeController,
                                          decoration:  const InputDecoration(
                                            prefixIcon: Icon(Icons.pin_drop_outlined),
                                              hintText: 'Enter Pincode',
                                              labelText: "Pincode"),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          //const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 15),
                    width: double.infinity,
                    child: ClipRRect(
                        child: ElevatedButton(
                            onPressed: () {
                              Fluttertoast.showToast(
                                  msg:
                                      ' $selectedService, ${addressController.text}, ${pincodeController.text}');
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18)))),
                            child: const Text("Request now"))),
                  ),
                ),
                // const Spacer(),
                // const SizedBox(height: 20),
                // scanning ? SpinKitThreeBounce(color: myColor, size: 20) : Text(coordinates, style: const TextStyle(fontSize: 16)),
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
          .collection('Citizens')
          .doc(user?.phoneNumber)
          .get();

      // Check if the document exists
      if (citizenSnapshot.exists) {
        // Access the fields from the document
        setState(() {
          fetchedFname = citizenSnapshot.get('firstName') +
              " " +
              citizenSnapshot.get('lastName');
          //fetchedLname = citizenSnapshot.get('lastName');
          fetchedPhone = user!.phoneNumber;
          fetchedState = citizenSnapshot.get('state');
          fetchedCity = citizenSnapshot.get('city');
          fetchedPinCode = citizenSnapshot.get('pinCode');
          fetchedFullAddress = citizenSnapshot.get('fullAddress');
          //fetchedRegTime = citizenSnapshot.get('registrationTime');
          //fetchedRegTime = fetchedRegTime.substring(0, 10);
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
}
