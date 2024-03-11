// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Citizen Related/Screens/citizen_signUp_screen/custom_checkbox_button.dart';
import '../../../Components/Notification_related/notification_services.dart';
import '../../../Models/govt_registration_model.dart';
import '../../../Utils/Utils.dart';
import '../../../Utils/constants.dart';
import '../../../Utils/dropdown_Items.dart';
import '../govt_login_screen/govt_login.dart';

// ignore: must_be_immutable
class GovtSignupPageScreen extends StatefulWidget {
  const GovtSignupPageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<GovtSignupPageScreen> createState() => _GovtSignupPageScreenState();
}

class _GovtSignupPageScreenState extends State<GovtSignupPageScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _regNoFocusNode = FocusNode();
  final FocusNode _servicesFocusNode = FocusNode();
  final FocusNode _contactNoFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _websiteFocusNode = FocusNode();

  TextEditingController nameOfGovtTextController = TextEditingController();
  TextEditingController regNoGovtTextController = TextEditingController();
  TextEditingController serviceGovtTextController = TextEditingController();
  TextEditingController contactNoGovtTextController = TextEditingController();
  TextEditingController emailIdGovtTextController = TextEditingController();
  TextEditingController websiteURLGovtTextController = TextEditingController();
  TextEditingController pinCodeGovtTextController = TextEditingController();
  TextEditingController fullAddressGovtTextController = TextEditingController();
  TextEditingController pwdGovtTextController = TextEditingController();
  TextEditingController confirmPwdGovtTextController = TextEditingController();

  String selectedState = '';
  String selectedCity = ''; // Variable to hold the selected city value
  String selectedPincode = ''; // Declare selectedPincode

  List<String> dropdownItemCity = [];

  Map<String, List<String>> pincodeMap = {
    "Port Blair": ["111", "222", "333"],
    "Adoni": ["444", "555", "666"],
  };

  List<String> fetchPinCodes(String selectedCity) {
    return pincodeMap[selectedCity] ?? [];
  }

  List<String> dropdownItemPincode = [];

  bool GovtTnC = false;
  bool _obscurePwdText = true;
  bool _obscureConfirmPwdText = true;
  NotificationServices notificationServices = NotificationServices();
  String deviceTokenFound = ""; // Global variable to store device token

  @override
  void initState() {
    super.initState();
    selectedState = DropdownItems.dropdownItemState.first;
    updateCityList(selectedState);

    // Inside a method or initState() or wherever appropriate
    notificationServices.getDeviceToken().then((value) {
      if (kDebugMode) {
        print('Device token signup : $value');
      }
      // Store the device token in the global variable
      deviceTokenFound = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                const SizedBox(height: 25),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      padding: EdgeInsets.only(
                          //for fields that are covered under keyboard
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                          left: 16,
                          right: 16),
                      //padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          const Text(
                            "Create your Account here : ",
                            style: TextStyle(fontSize: 24),
                          ),
                          const SizedBox(height: 9),
                          // const Text("Connect with your city now !",),
                          const SizedBox(height: 50),
                          SvgPicture.asset(svg_for_signup),
                          const SizedBox(height: 30),
                          //govt name
                          Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: TextFormField(
                              focusNode: _nameFocusNode,
                              textCapitalization: TextCapitalization.sentences,
                              controller: nameOfGovtTextController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.account_box_outlined,
                                    color: Colors.deepPurple),
                                hintText: "Enter name of Government Agency",
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 18,
                                ),
                                filled: true,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  _nameFocusNode.requestFocus();
                                  return 'Enter Govt Agency name';

                                }
                                if (value.isNotEmpty && value.length < 3) {
                                  _nameFocusNode.requestFocus();
                                  return 'Minimum 3 Characters required';
                                }
                                return null; // Return null if the input is valid
                              },
                              onEditingComplete: () {
                                // Move focus to the next field when "Enter" is pressed
                                FocusScope.of(context).nextFocus();
                              },
                            ),
                          ),
                          const SizedBox(height: 12),
                          //govt reg no
                          Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: TextFormField(
                              focusNode: _regNoFocusNode,
                              controller: regNoGovtTextController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.app_registration,
                                    color: Colors.deepPurple),
                                hintText:
                                    "Enter registration no. of Govt. Agency",
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 18,
                                ),
                                filled: true,
                                // fillColor: Colors.deepPurple,
                              ),
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  _regNoFocusNode.requestFocus();
                                  return 'Enter Registration No';
                                }
                                if (value.isNotEmpty && value.length < 3) {
                                  _regNoFocusNode.requestFocus();
                                  return 'Minimum 3 Characters required';
                                }
                                return null; // Return null if the input is valid
                              },
                              onEditingComplete: () {
                                // Move focus to the next field when "Enter" is pressed
                                FocusScope.of(context).nextFocus();
                              },
                            ),
                          ),
                          const SizedBox(height: 12),
                          //govt services
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 5,
                              right: 5,
                            ),
                            child: TextFormField(
                              focusNode: _servicesFocusNode,
                              onTap: () {
                                _showCupertinoDialog(context);
                              },
                              controller: serviceGovtTextController,
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: "Select Services Govt. can provide",
                                prefixIcon: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(20, 16, 12, 16),
                                  child: SvgPicture.asset(svg_for_calendar),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Select your serving Services from list';
                                }
                                return null; // Return null if the input is valid
                              },
                              onEditingComplete: () {
                                // Move focus to the next field when "Enter" is pressed
                                FocusScope.of(context).nextFocus();
                              },
                            ),
                          ),
                          const SizedBox(height: 12),
                          //govt contact
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 5,
                              right: 5,
                            ),
                            child: TextFormField(
                              focusNode: _contactNoFocusNode,
                              maxLength: 10,
                              controller: contactNoGovtTextController,
                              decoration: InputDecoration(
                                //prefixText: "+91 ",
                                hintText:
                                    "Enter contact number of Govt. Agency",
                                prefixIcon: Container(
                                  decoration: const BoxDecoration(
                                      //borderRadius: BorderRadius.all(Radius.circular(30)),
                                      ),
                                  margin:
                                      const EdgeInsets.fromLTRB(20, 16, 12, 16),
                                  child: SvgPicture.asset(svg_for_call),
                                ),
                                prefixIconConstraints: const BoxConstraints(
                                  maxHeight: 56,
                                ),
                              ),
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  _contactNoFocusNode.requestFocus();
                                  return 'Enter Contact number';
                                }
                                if (value.isNotEmpty && value.length < 10) {
                                  _contactNoFocusNode.requestFocus();
                                  return 'Contact no should be of 10 digits';
                                }
                                return null; // Return null if the input is valid
                              },
                              onEditingComplete: () {
                                // Move focus to the next field when "Enter" is pressed
                                FocusScope.of(context).nextFocus();
                              },
                            ),
                          ),
                          const SizedBox(height: 8),
                          //govt email
                          Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: TextFormField(
                              focusNode: _emailFocusNode,
                              controller: emailIdGovtTextController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.email_outlined,
                                    color: Colors.deepPurple),
                                hintText:
                                    "Enter authorized mail id of Govt. Agency",
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 18,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  _emailFocusNode.requestFocus();
                                  return 'Enter an email address';
                                }
                                // Regular expression for validating an email address
                                final emailRegex =
                                    RegExp(r'^[\w.-]+@([\w-]+\.)+[\w-]{2,4}$');
                                if (!emailRegex.hasMatch(value)) {
                                  _emailFocusNode.requestFocus();
                                  return 'Enter valid email address';
                                }
                                return null; // Return null if the input is valid
                              },
                              onEditingComplete: () {
                                // Move focus to the next field when "Enter" is pressed
                                FocusScope.of(context).nextFocus();
                              },
                            ),
                          ),
                          const SizedBox(height: 12),
                          //govt website
                          Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: TextFormField(
                              focusNode: _websiteFocusNode,
                              controller: websiteURLGovtTextController,
                              decoration: const InputDecoration(
                                prefixIcon:
                                    Icon(Icons.web, color: Colors.deepPurple),
                                hintText: "Enter website URL of Govt. Agency",
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 18,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  _websiteFocusNode.requestFocus();
                                  return 'Enter website URL';
                                }
                                // Regular expression for validating a URL
                                final urlRegex = RegExp(
                                  r'^(https?://)?'
                                  r'([a-z0-9-]+\.)*[a-z0-9-]+'
                                  r'\.[a-z]{2,}(\/\S*)?$',
                                  caseSensitive: false,
                                );
                                if (!urlRegex.hasMatch(value)) {
                                  _websiteFocusNode.requestFocus();
                                  return 'Enter valid URL';
                                }
                                return null; // Return null if the input is valid
                              },
                              onEditingComplete: () {
                                // Move focus to the next field when "Enter" is pressed
                                FocusScope.of(context).nextFocus();
                              },
                            ),
                          ),
                          const SizedBox(height: 12),
                          //state
                          Flex(
                            direction: Axis.horizontal,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 5,
                                    right: 5,
                                  ),
                                  child: SizedBox(
                                    //height: 60,
                                    child: DropdownButtonFormField<String>(
                                      value: selectedState,
                                      items: DropdownItems.dropdownItemState
                                          .map((String state) {
                                        return DropdownMenuItem<String>(
                                          // alignment: AlignmentDirectional.topStart,
                                          value: state,
                                          child: Text(state),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedState = value!;
                                          // Update city list based on the selected state
                                          updateCityList(selectedState);
                                          // Reset selected city when state changes
                                          selectedCity = '';
                                        });
                                      },
                                      decoration: const InputDecoration(
                                        // border: OutlineInputBorder(),
                                        hintText: "Select Govt Agency State",
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
                          const SizedBox(height: 12),
                          //city
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 5,
                              right: 5,
                            ),
                            child: SizedBox(
                              //height: 60,
                              child: DropdownButtonFormField<String>(
                                value: selectedCity.isNotEmpty
                                    ? selectedCity
                                    : null,
                                items: dropdownItemCity.map((String city) {
                                  return DropdownMenuItem<String>(
                                    value: city,
                                    child: Text(city),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedCity = value!;
                                    // Fetch pin codes based on the selected city
                                    dropdownItemPincode =
                                        fetchPinCodes(selectedCity);
                                    // Reset selected pincode when city changes
                                    selectedPincode = '';
                                  });
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Select Govt Agency City",
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Select Govt Agency City';
                                  }
                                  return null; // Return null if the input is valid
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: TextFormField(
                              maxLength: 6,
                              controller: pinCodeGovtTextController,
                              decoration: const InputDecoration(
                                hintText: "Enter Pin code of Govt. Agency",
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 18,
                                ),
                              ),
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Pin code';
                                }
                                if (value.isNotEmpty && value.length < 6) {
                                  return 'Enter 6 digits Pin code';
                                }
                                return null; // Return null if the input is valid
                              },
                              onEditingComplete: () {
                                // Move focus to the next field when "Enter" is pressed
                                FocusScope.of(context).nextFocus();
                              },
                            ),
                          ),
                          const SizedBox(height: 12),
                          //address
                          Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: TextFormField(
                              textCapitalization: TextCapitalization.sentences,
                              controller: fullAddressGovtTextController,
                              decoration: const InputDecoration(
                                hintText: "Enter full address of Govt. Agency",
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 18,
                                ),
                              ),
                              keyboardType: TextInputType.text,
                              maxLength: 150,
                              maxLines: 4,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter full address';
                                }
                                if (value.isNotEmpty && value.length < 10) {
                                  return "Too short address";
                                }
                                return null; // Return null if the input is valid
                              },
                            ),
                          ),
                          const SizedBox(height: 31),
                          //pwd
                          Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: TextFormField(
                              controller: pwdGovtTextController,
                              obscureText: _obscurePwdText,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.deepPurple,
                                ),
                                hintText: "Create password for Govt Agency",
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 18,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscurePwdText = !_obscurePwdText;
                                    });
                                  },
                                  child: Icon(
                                    _obscurePwdText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              validator: validatePassword,
                              onEditingComplete: () {
                                // Move focus to the next field when "Enter" is pressed
                                FocusScope.of(context).nextFocus();
                              },
                            ),
                          ),
                          const SizedBox(height: 12),
                          // Confirm pwd
                          Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: TextFormField(
                              controller: confirmPwdGovtTextController,
                              obscureText: _obscureConfirmPwdText,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.deepPurple,
                                ),
                                hintText: "Confirm password",
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 18,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureConfirmPwdText =
                                          !_obscureConfirmPwdText;
                                    });
                                  },
                                  child: Icon(
                                    _obscureConfirmPwdText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter confirm password';
                                }
                                if (value != pwdGovtTextController.text) {
                                  return "Confirm password doesn't matches";
                                }
                                return null; // Return null if the input is valid
                              },
                              onEditingComplete: () {
                                // Move focus to the next field when "Enter" is pressed
                                FocusScope.of(context).nextFocus();
                              },
                            ),
                          ),
                          const SizedBox(height: 12),
                          //t&c
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 3,
                                right: 100,
                              ),
                              child: CustomCheckboxButton(
                                alignment: Alignment.centerLeft,
                                text: "I accept term & conditions",
                                value: GovtTnC,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 1),
                                onChange: (value) {
                                  setState(() {
                                    GovtTnC = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          //btn
                          //const SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                ),
                //out of scrollbar
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    width: double.infinity,
                    child: ClipRRect(
                        // borderRadius: BorderRadius.circular(50),
                        child: ElevatedButton(
                            onPressed: () async {
                              //Circular Progress Bar
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
                                  const Duration(milliseconds: 1200));
                              Navigator.pop(context);


                              if (!GovtTnC) {
                                final tnCError = TsnakeBar(
                                    context,
                                    "Please accept terms & conditions..",
                                    "Hide");
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(tnCError);
                              }

                              if (_formKey.currentState!.validate()) {
                                if (!GovtTnC) {
                                  return;
                                } else {
                                  CollectionReference citizenRequestCollection =
                                      FirebaseFirestore.instance
                                          .collection("clc_govt");
                                  //for id
                                  QuerySnapshot snapshot =
                                      await citizenRequestCollection.get();
                                  int totalDocCount = snapshot.size;
                                  totalDocCount++;
                                  //Storing data to database
                                  GovtRegistration GovtData = GovtRegistration(
                                      gid: "g$totalDocCount",
                                      GovtAgencyName:
                                          nameOfGovtTextController.text.trim(),
                                      GovtAgencyARegNo:
                                          regNoGovtTextController.text.trim(),
                                      services:
                                          serviceGovtTextController.text.trim(),
                                      contactNumber: contactNoGovtTextController
                                          .text
                                          .trim(),
                                      email:
                                          emailIdGovtTextController.text.trim(),
                                      website: websiteURLGovtTextController.text
                                          .trim(),
                                      state: selectedState.trim(),
                                      city: selectedCity.trim(),
                                      pinCode:
                                          pinCodeGovtTextController.text.trim(),
                                      fullAddress: fullAddressGovtTextController
                                          .text
                                          .trim(),
                                      password:
                                          pwdGovtTextController.text.trim(),
                                      // confirmPassword: confirmPwdGovtTextController.text.trim(),
                                      // termsAccepted: GovtTnC,
                                      deviceToken: deviceTokenFound);

                                  // Convert the object to JSON
                                  Map<String, dynamic> GovtDataJson =
                                      GovtData.toJsonGovt();

                                  // Store data in Firestore
                                  try {
                                    String emailId =
                                        emailIdGovtTextController.text;

                                    // Check if a document with the same email ID exists
                                    var existingDoc = await FirebaseFirestore
                                        .instance
                                        .collection("clc_govt")
                                        .doc(emailId)
                                        .get();

                                    if (existingDoc.exists) {
                                      // Document already exists, do not add user to the database
                                      showToastMsg(
                                          "Account with the same email id already exists ..");
                                      return; // Exit the function
                                    } else {
                                      // DocumentReference docRef =await FirebaseFirestore.instance.collection("Govt").add(GovtDataJson);
                                      await FirebaseFirestore.instance
                                          .collection("clc_govt")
                                          .doc(emailIdGovtTextController.text)
                                          .set(GovtDataJson)
                                          .whenComplete(() {
                                        // Show a toast message upon success
                                        showToastMsg(
                                            "Government Agency registered successfully ..");
                                      }).onError((error, stackTrace) {
                                        showToastMsg(
                                            "Something went wrong, try again later ");
                                      });

                                      FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                        email: emailIdGovtTextController.text,
                                        password: pwdGovtTextController.text,
                                      );

                                      // Document successfully added
                                      if (kDebugMode) {
                                        print(
                                            'Document added with ID: ${emailIdGovtTextController.text}');
                                      }

                                      // Navigate to a new page upon success
                                      Navigator.of(context).push(
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation,
                                                  secondaryAnimation) =>
                                              const GovtLoginPageScreen(),
                                          transitionsBuilder: (context,
                                              animation,
                                              secondaryAnimation,
                                              child) {
                                            var begin = const Offset(1.0, 0.0);
                                            var end = Offset.zero;
                                            var curve = Curves.ease;
                                            var tween = Tween(
                                                    begin: begin, end: end)
                                                .chain(
                                                    CurveTween(curve: curve));
                                            var offsetAnimation =
                                                animation.drive(tween);
                                            //slight fade effect
                                            //var opacityAnimation = animation.drive(tween);
                                            return SlideTransition(
                                              position: offsetAnimation,
                                              child: child,
                                            );
                                          },
                                        ),
                                      );
                                    }
                                  } catch (e) {
                                    // An error occurred
                                    if (kDebugMode) {
                                      print('Error adding Govt document: $e');
                                    }
                                  }
                                  if (kDebugMode) {
                                    print(
                                        "Govt Agency Stored and Registered successfully [(:-==-:)]");
                                  }
                                }
                              } else {
                                // Focus on the first invalid field
                                // if (!_nameFocusNode.hasFocus && !_regNoFocusNode.hasFocus) {
                                //   _nameFocusNode.requestFocus();
                                // } else if (!_regNoFocusNode.hasFocus) {
                                //   _regNoFocusNode.requestFocus();
                                // }
                              }
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18)))),
                            child: const Text("Continue"))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Already have an account? ",
                      ),
                      SizedBox(
                        height: 35,
                        width: 89,
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const GovtLoginPageScreen(),
                                          ));
                                    },
                                    child: const Text(
                                      "Login ..",
                                      // selectionColor: Colors.blueGrey,
                                    ))),
                            SvgPicture.asset(svg_for_line, width: 65),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showCupertinoDialog(BuildContext context) {
    List<bool> checked =
        List.filled(DropdownItems.dropdownItemListofServices.length, false);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select your services from the list :'),
          content: SizedBox(
            width: double.maxFinite,
            height: 300, // Adjust the height as needed
            child: ListView.builder(
              itemCount: DropdownItems.dropdownItemListofServices.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      checked[index] = !checked[index];
                    });
                  },
                  child: ListTile(
                    title:
                        Text(DropdownItems.dropdownItemListofServices[index]),
                    trailing: CupertinoSwitch(
                      value: checked[index],
                      onChanged: (bool value) {
                        setState(() {
                          checked[index] = value;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String selectedOptions = '';
                for (int i = 0;
                    i < DropdownItems.dropdownItemListofServices.length;
                    i++) {
                  if (checked[i]) {
                    selectedOptions +=
                        '${DropdownItems.dropdownItemListofServices[i]}, ';
                  }
                }
                if (selectedOptions.isNotEmpty) {
                  selectedOptions =
                      selectedOptions.substring(0, selectedOptions.length - 2);
                }
                serviceGovtTextController.text = selectedOptions;
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void updateCityList(String state) {
    setState(() {
      dropdownItemCity = DropdownItems.cityMap[state] ?? [];
    });
  }

// void _showCupertinoDialog(BuildContext context) {
//   List<String> options = ['Option 1', 'Option 2', 'Option 3']; // Your list of options
//   List<bool> checked = List.filled(options.length, false);
//
//   showCupertinoModalPopup(
//     context: context,
//     builder: (BuildContext context) {
//       return CupertinoAlertDialog(
//         title: const Text('Select Options'),
//         content: Column(
//           children: List.generate(
//             options.length,
//                 (index) {
//               return CheckboxListTile(
//                 title: Text(options[index]),
//                 value: checked[index],
//                 onChanged: (bool? value) {
//                   if (value != null) {
//                     checked[index] = value;
//                   }
//                   setState(() {}); // Update dialog to reflect changes
//                 },
//               );
//             },
//           ),
//         ),
//         actions: <Widget>[
//           CupertinoDialogAction(
//             child: const Text('Cancel'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           CupertinoDialogAction(
//             child: const Text('OK'),
//             onPressed: () {
//               String selectedOptions = '';
//               for (int i = 0; i < options.length; i++) {
//                 if (checked[i]) {
//                   selectedOptions += options[i] + ', ';
//                 }
//               }
//               if (selectedOptions.isNotEmpty) {
//                 selectedOptions = selectedOptions.substring(0, selectedOptions.length - 2);
//               }
//               dateEditTextController.text = selectedOptions;
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }

// Future<void> _selectDate(BuildContext context) async {
//   final DateTime? pickedDate = await showDatePicker(
//     context: context,
//     initialDate: DateTime.now(),
//     firstDate: DateTime(1900),
//     lastDate: DateTime.now(),
//     builder: (BuildContext context, Widget? child) {
//       return Theme(
//         data: ThemeData.light().copyWith(
//           colorScheme: const ColorScheme.light(
//             primary: Colors.blue, // Header background color
//             onPrimary: Colors.white, // Header text color
//             onSurface: Colors.black, // Body text color
//           ),
//           textButtonTheme: TextButtonThemeData(
//             style: TextButton.styleFrom(
//               foregroundColor: Colors.blue, // Button text color
//             ),
//           ),
//         ),
//         child: child!,
//       );
//     },
//   );
//   // ignore: unrelated_type_equality_checks
//   if (pickedDate != null && pickedDate != dateEditTextController.text) {
//     final formattedDate = DateFormat.yMMMd()
//         .format(pickedDate); // Format date to show day, month, year
//     setState(() {
//       dateEditTextController.text = formattedDate;
//     });
//   }
// }

// /// Section Widget
// Widget _buildGroup38RadioGroup(BuildContext context) {
//   return Padding(
//     padding: EdgeInsets.only(left: 8.h, right: 11.h),
//     child: Row(
//       children: [
//         Padding(
//           padding: EdgeInsets.only(bottom: 2.v),
//           child: CustomRadioButton(
//             text: "male",
//             value: radioList[0],
//             groupValue: radioGroup,
//             padding: EdgeInsets.symmetric(vertical: 1.v),
//             onChange: (value) {
//               // Update the state when a radio button is selected
//               setState(() {
//                 radioGroup = value;
//               });
//             },
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(left: 24.h, bottom: 2.v),
//           child: CustomRadioButton(
//             text: "female",
//             value: radioList[1],
//             groupValue: radioGroup,
//             padding: EdgeInsets.symmetric(vertical: 1.v),
//             onChange: (value) {
//               // Update the state when a radio button is selected
//               setState(() {
//                 radioGroup = value;
//               });
//             },
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(left: 28.h, top: 2.v),
//           child: CustomRadioButton(
//             text: "others",
//             value: radioList[2],
//             groupValue: radioGroup,
//             padding: EdgeInsets.symmetric(vertical: 1.v),
//             onChange: (value) {
//               // Update the state when a radio button is selected
//               setState(() {
//                 radioGroup = value;
//               });
//             },
//           ),
//         ),
//       ],
//     ),
//   );
// }
//
// /// Section Widget
// Widget _buildPhoneNumberEditText(BuildContext context) {
//   return Padding(
//     padding: EdgeInsets.only(
//       left: 3.h,
//       right: 5.h,
//     ),
//     child: CustomTextFormField(
//       controller: phoneNumberEditTextController,
//       hintText: "Phone Number",
//       textInputType: TextInputType.phone,
//       prefix: Container(
//         margin: EdgeInsets.fromLTRB(20.h, 16.v, 12.h, 16.v),
//         child: CustomImageView(
//           imagePath: ImageConstant.imgCall,
//           height: 24.adaptSize,
//           width: 24.adaptSize,
//         ),
//       ),
//       prefixConstraints: BoxConstraints(
//         maxHeight: 56.v,
//       ),
//     ),
//   );
// }

// // Section Widget
// Widget _buildDateEditText(BuildContext context) {
//   return Padding(
//     padding: EdgeInsets.only(
//       left: 3,
//       right: 5,
//     ),
//     child: GestureDetector(
//       onTap: () {
//         _selectDate(context);
//       },
//       child: AbsorbPointer(
//         child: TextFormField(
//           controller: dateEditTextController,
//           readOnly: true,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(4.h),
//               borderSide: BorderSide(
//                 color: appTheme.gray500,
//                 width: 1,
//               ),
//             ),
//             hintText: "Birthdate",
//             prefixIcon: Container(
//               margin: EdgeInsets.fromLTRB(20.h, 16.v, 12.h, 16.v),
//               child: SvgPicture.asset(ImageConstant.imgCalendar),
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }
// /// Section Widget
// Widget _buildZipcodeEditText(BuildContext context) {
//   return Padding(
//     padding: EdgeInsets.only(
//       left: 3.h,
//       right: 4.h,
//     ),
//     child: CustomTextFormField(
//       controller: zipcodeEditTextController,
//       hintText: "Zip Code",
//       textInputType: TextInputType.number,
//       contentPadding: EdgeInsets.symmetric(
//         horizontal: 20.h,
//         vertical: 18.v,
//       ),
//     ),
//   );
// }
// /// Section Widget
// Widget _buildFieldsColumn(BuildContext context) {
//   return Padding(
//     padding: EdgeInsets.only(
//       left: 0,
//       right: 0,
//     ),
//     child: Column(
//       children: [
//         _buildAddressEditText(context),
//       ],
//     ),
//   );
// }
// /// Section Widget
// Widget _buildAddressEditText(BuildContext context) {
//   return CustomTextFormField(
//     controller: addressEditTextController,
//     hintText: "Address",
//     textInputAction: TextInputAction.done,
//     suffix: Container(
//       margin: EdgeInsets.only(
//         left: 30,
//         top: 30,
//       ),
//       child: CustomImageView(
//         imagePath: ImageConstant.imgSettings,
//         height: 24.adaptSize,
//         width: 24.adaptSize,
//       ),
//     ),
//     suffixConstraints: BoxConstraints(
//       maxHeight: 120,
//     ),
//     maxLines: 3,
//     contentPadding: EdgeInsets.symmetric(
//       horizontal: 20,
//       vertical: 18,
//     ),
//   );
// }
// // Section Widget
// Widget _buildCheckboxCheckBox(BuildContext context) {
//   return Align(
//     alignment: Alignment.centerLeft,
//     child: Padding(
//       padding: EdgeInsets.only(
//         left: 3.h,
//         right: 67.h,
//       ),
//       child: CustomCheckboxButton(
//         alignment: Alignment.centerLeft,
//         text: "I accept term & conditions",
//         value: checkboxCheckBox,
//         padding: EdgeInsets.symmetric(vertical: 1.v),
//         onChange: (value) {
//           checkboxCheckBox = value;
//         },
//       ),
//     ),
//   );
// }
// // Section Widget
// Widget _buildSignUpButton(BuildContext context) {
//   return ElevatedButton(
//     onPressed: () {
//       // if (_formKey.currentState!.validate()) {
//       //   // Form is valid, do something
//       // } else {
//       //   // Find the first field with an error and move focus to it
//       //   if (_firstNameFocusNode.hasFocus &&
//       //       createCitizenAccountTextController.text.isEmpty) {
//       //     FocusScope.of(context).requestFocus(_firstNameFocusNode);
//       //   } else if (_lastNameFocusNode.hasFocus &&
//       //       connectWithYourTextController.text.isEmpty) {
//       //     FocusScope.of(context).requestFocus(_lastNameFocusNode);
//       //   }
//       // }
//     },
//     child: Text('Submit'),
//   );
// }
}
