// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names, deprecated_member_use, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../Utils/Utils.dart';
import '../../Utils/constants.dart';
import '../../Utils/dropdown_Items.dart';

// ignore: camel_case_types
class Citizen_Details_Screen extends StatefulWidget {
  final DocumentSnapshot<Object?> documentSnapshot;

  const Citizen_Details_Screen({
    super.key,
    required this.documentSnapshot,
  });

  @override
  State<Citizen_Details_Screen> createState() => _Citizen_Details_ScreenState();
}

// ignore: camel_case_types
class _Citizen_Details_ScreenState extends State<Citizen_Details_Screen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = true;
  bool isMale = true;
  bool isEditing = false;
  bool isNGOExpanded = false;

  String selectedState = '';
  String selectedCity = '';
  List<String> dropdownItemCity = [];
  String? fetchedGender = "";

  String selectedGender = '';
  int userAge = 0;

  TextEditingController fnameTextController = TextEditingController();
  TextEditingController lnameTextController = TextEditingController();
  TextEditingController birthDateTextController = TextEditingController();
  TextEditingController addressTextController = TextEditingController();
  TextEditingController pincodeTextController = TextEditingController();
  TextEditingController stateTextController = TextEditingController();
  TextEditingController cityTextController = TextEditingController();

  //ngo
  bool hasNGOResponded = false;
  String fetchedNid = '';
  String fetchedNGOFid = '';
  bool hasNGOFeedbackSent = false;
  String fetchedNGOName = '';
  String fetchedNGORegNo = '';
  String fetchedNGOAddress = '';
  String fetchedNGOContact = '';
  String fetchedNGOEmail = '';
  String fetchedNGOWebsite = '';
  String fetchedNGORespondTime = '';

  //govt
  bool hasGovtResponded = false;
  String fetchedGid = '';
  String fetchedGovtFid = '';
  bool hasGovtFeedbackSent = false;
  String fetchedGovtName = '';
  String fetchedGovtRegNo = '';
  String fetchedGovtAddress = '';
  String fetchedGovtContact = '';
  String fetchedGovtEmail = '';
  String fetchedGovtWebsite = '';
  String fetchedGovtRespondTime = '';

  @override
  void initState() {
    super.initState();
    fetchNGOResponseDetails();
    fetchGovtResponseDetails();
    selectedState = widget.documentSnapshot['state'];
    selectedCity = widget.documentSnapshot['city'];
    updateCityList(selectedState);
    // Start loading
    Future.delayed(const Duration(milliseconds: 1100), () {
      setState(() {
        setState(() {
          isLoading = false;
          fnameTextController.text = widget.documentSnapshot['firstName'];
          lnameTextController.text = widget.documentSnapshot['lastName'];
          addressTextController.text = widget.documentSnapshot['fullAddress'];
          pincodeTextController.text = widget.documentSnapshot['pinCode'];
          stateTextController.text = widget.documentSnapshot['state'];
          cityTextController.text = widget.documentSnapshot['city'];

          selectedState = widget.documentSnapshot['state'];
          selectedCity = widget.documentSnapshot['city'];
          updateCityList(selectedState);
        });
      });
    });

    DateTime birthDate = widget.documentSnapshot['birthDate'].toDate();
    DateTime currentDate = DateTime.now();
    userAge = currentDate.year - birthDate.year;
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      userAge--;
    }
    birthDateTextController.text = DateFormat('MMMM dd, yyyy')
        .format(widget.documentSnapshot['birthDate'].toDate());
    fetchedGender = widget.documentSnapshot['gender'];
    selectedGender = fetchedGender!;
    if (fetchedGender == 'Female') {
      setState(() {
        isMale = false;
      });
    }
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
        title: const Text("Citizen details"),
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
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: CircleAvatar(
                                radius: 37,
                                backgroundImage: isMale
                                    ? const AssetImage("assets/images/man.png")
                                    : const AssetImage(
                                        "assets/images/woman.png"),
                              ),
                            ),
                            const SizedBox(height: 15),
                            AbsorbPointer(
                              absorbing: !isEditing,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, bottom: 3),
                                    child: Text("Username :"),
                                  ),
                                  //username
                                  Row(
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          child: TextFormField(
                                            controller: fnameTextController,
                                            decoration: InputDecoration(
                                              prefixIcon:
                                                  const Icon(Icons.person),
                                              hintText:
                                                  "${widget.documentSnapshot['firstName']}",
                                            ),
                                            enabled: isEditing,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Enter First name';
                                              }
                                              if (value.isNotEmpty &&
                                                  value.length < 3) {
                                                return 'Minimum 3 Characters required';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: SizedBox(
                                          child: TextFormField(
                                            controller: lnameTextController,
                                            decoration: InputDecoration(
                                              prefixIcon: const Icon(Icons
                                                  .person_outline_outlined),
                                              hintText:
                                                  "${widget.documentSnapshot['lastName']}",
                                            ),
                                            enabled: isEditing,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Enter last name';
                                              }
                                              if (value.isNotEmpty &&
                                                  value.length < 3) {
                                                return 'Minimum 3 Characters required';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, bottom: 3),
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
                                                  isMale = false;
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
                                    padding:
                                        EdgeInsets.only(left: 10, bottom: 3),
                                    child: Text("Birth Date :"),
                                  ),
                                  //birthdate
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: GestureDetector(
                                      onTap: () {
                                        if (isEditing) {
                                          _selectDate(context);
                                        }
                                      },
                                      child: AbsorbPointer(
                                        //absorbing: !isEditing,
                                        child: TextFormField(
                                          controller: birthDateTextController,
                                          readOnly: true,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20), // Make it round
                                            ),
                                            // hintText: DateFormat('MMMM dd, yyyy')
                                            //     .format(
                                            //         fetchedBirthDate.toDate()),
                                            prefixIcon: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  20, 16, 12, 16),
                                              child: SvgPicture.asset(
                                                  svg_for_calendar),
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
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
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Text(
                                      "Citizen age : ${userAge.toString()}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.deepPurple.shade300,
                                          fontSize: 14),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, bottom: 3),
                                    child: Text("Phone number :"),
                                  ),
                                  //phone
                                  SizedBox(
                                    // height: 55,
                                    child: TextFormField(
                                      enabled: false,
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(Iconsax.call5),
                                        hintText:
                                            "${widget.documentSnapshot['phoneNumber']}",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, bottom: 3),
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
                                            const Icon(Iconsax.location),
                                        hintText:
                                            "${widget.documentSnapshot['fullAddress']}",
                                      ),
                                      enabled: isEditing,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter full address';
                                        }
                                        if (value.isNotEmpty &&
                                            value.length < 10) {
                                          return "Too short address";
                                        }
                                        return null; // Return null if the input is valid
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, bottom: 3),
                                    child: Text("Pincode :"),
                                  ),
                                  //pincode
                                  SizedBox(
                                    child: TextFormField(
                                      controller: pincodeTextController,
                                      decoration: InputDecoration(
                                        prefixIcon:
                                            const Icon(Iconsax.location_add),
                                        hintText:
                                            "${widget.documentSnapshot['pinCode']}",
                                      ),
                                      enabled: isEditing,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter Pin code';
                                        }
                                        if (value.isNotEmpty &&
                                            value.length < 6) {
                                          return 'Enter 6 digits Pin code';
                                        }
                                        return null; // Return null if the input is valid
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, bottom: 3),
                                    child: Text("State :"),
                                  ),
                                  //state
                                  Padding(
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
                                            updateCityList(selectedState);
                                            selectedCity = '';
                                          });
                                        },
                                        decoration: InputDecoration(
                                          enabled: isEditing,
                                          // border: OutlineInputBorder(),
                                          hintText: "Select your State",
                                        ),
                                        validator: (value) {
                                          if (value == "Select your State") {
                                            return 'Select your State';
                                          }
                                          return null; // Return null if the input is valid
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, bottom: 3),
                                    child: Text("City :"),
                                  ),
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
                                        items:
                                            dropdownItemCity.map((String city) {
                                          return DropdownMenuItem<String>(
                                            value: city,
                                            child: Text(city),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            selectedCity = value!;
                                          });
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                          ),
                                          enabled: isEditing,
                                          hintText: "Select your City",
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Select your City';
                                          }
                                          return null; // Return null if the input is valid
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            //extra details
                            Align(
                              alignment: AlignmentDirectional.bottomEnd,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.85,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Text(
                                        "User registered at  : \t   \n${widget.documentSnapshot['registrationTime']}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10),
                                      ),
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
                  ),
                  const SizedBox(height: 9),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 5, left: 5, bottom: 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ElevatedButton(
                              onPressed: () async {
                                if (isEditing == false) {
                                  showSnakeBar(
                                      context,
                                      "Enable editing to edit your profile ..",
                                      "Okay");
                                } else {
                                  if (_formKey.currentState!.validate()) {
                                    //updateUserProfile();
                                  }
                                }
                                // if (_formKey.currentState!.validate()) {
                                //progress
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return const Dialog(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 35,
                                            bottom: 25,
                                            left: 20,
                                            right: 20),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(height: 15),
                                            CircularProgressIndicator(
                                                color: Colors.blue),
                                            SizedBox(height: 30),
                                            Text('Processing ...')
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                                await Future.delayed(
                                    const Duration(milliseconds: 1300));

                                try {
                                  // if (fetchedFid != widget.fid ||
                                  //     starCount != getRatingString(_starRating) ||
                                  //     serviceFulfill !=
                                  //         (_thumbsUpSelected ? 'Yes' : 'No') ||
                                  //     fetchedDesc != descController.text) {
                                  //   updateFeedback();
                                  // } else {
                                  //   showToastMsg("No change in feedback");
                                  // }

                                  //addFeedbackToDatabase(totalDocCount);
                                } catch (e) {
                                  if (kDebugMode) {
                                    print(
                                        'Error while sending citizen request : $e');
                                  }
                                } finally {
                                  Navigator.pop(context);
                                }
                                // }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    const MaterialStatePropertyAll(Colors.teal),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                )),
                              ),
                              child: const Text("Update"),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: ElevatedButton(
                              onPressed: () async {
                                final CupertinoAlertDialog alert =
                                    CupertinoAlertDialog(
                                  title: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Confirm : ',
                                        style: TextStyle(fontSize: 16)),
                                  ),
                                  content: const Text('Delete your Feedback ?'),
                                  actions: <Widget>[
                                    CupertinoDialogAction(
                                      isDefaultAction: true,
                                      child: const Text('Cancel'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    CupertinoDialogAction(
                                      isDefaultAction: true,
                                      child: const Text('Delete'),
                                      onPressed: () async {
                                        // deleteFeedback();
                                        Navigator.pop(context, true);
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
                                        Navigator.pop(context, true);
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                );
                                // Show the dialog
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return alert;
                                  },
                                );
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.red.shade400),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                )),
                              ),
                              child: const Text("Delete"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }

  Future<void> fetchNGOResponseDetails() async {
    try {
      // Fetch data from Firestore
      DocumentSnapshot NGOResponseSnapshot = await FirebaseFirestore.instance
          .collection('clc_response')
          .doc(widget.documentSnapshot['RespondId'])
          .collection("ngo")
          .doc("ngo_details")
          .get();
      //print(user!.email);
      //print(GovtSnapshot.get('GovtAgencyRegNo'));

      // Check if the document exists
      if (NGOResponseSnapshot.exists) {
        // Access the fields from the document
        setState(() {
          hasNGOResponded = true;
          fetchedNid = NGOResponseSnapshot.get('nid');
          fetchedNGOFid = NGOResponseSnapshot.get('fid');
          if (kDebugMode) {
            print(fetchedNGOFid);
          }
          if (fetchedNGOFid.isNotEmpty) {
            hasNGOFeedbackSent = true;
          }
          fetchedNGOName = NGOResponseSnapshot.get('ResponderNGOName');
          fetchedNGORegNo = NGOResponseSnapshot.get('ResponderNGORegNo');
          fetchedNGOAddress = NGOResponseSnapshot.get('ResponderNGOAddress');
          fetchedNGOContact =
              NGOResponseSnapshot.get('ResponderNGOContactNumber');
          fetchedNGOEmail = NGOResponseSnapshot.get('ResponderNGOEmail');
          fetchedNGOWebsite = NGOResponseSnapshot.get('ResponderNGOWebsite');
          fetchedNGORespondTime = NGOResponseSnapshot.get('RespondNGOTime');
        });
      } else {
        if (kDebugMode) {
          print('NGO response Document does not exist');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching NGO response data: $e');
      }
    }
  }

  Future<void> fetchGovtResponseDetails() async {
    try {
      // Fetch data from Firestore
      DocumentSnapshot GovtResponseSnapshot = await FirebaseFirestore.instance
          .collection('clc_response')
          .doc(widget.documentSnapshot['RespondId'])
          .collection("govt")
          .doc("govt_details")
          .get();

      // Check if the document exists
      if (GovtResponseSnapshot.exists) {
        // Access the fields from the document
        setState(() {
          hasGovtResponded = true;
          fetchedGid = GovtResponseSnapshot.get('gid');
          fetchedGovtFid = GovtResponseSnapshot.get('fid');
          if (kDebugMode) {
            print(fetchedGovtFid);
          }
          if (fetchedGovtFid.isNotEmpty) {
            hasGovtFeedbackSent = true;
          }
          fetchedGovtName = GovtResponseSnapshot.get('ResponderGovtName');
          fetchedGovtRegNo = GovtResponseSnapshot.get('ResponderGovtRegNo');
          fetchedGovtAddress = GovtResponseSnapshot.get('ResponderGovtAddress');
          fetchedGovtContact =
              GovtResponseSnapshot.get('ResponderGovtContactNumber');
          fetchedGovtEmail = GovtResponseSnapshot.get('ResponderGovtEmail');
          fetchedGovtWebsite = GovtResponseSnapshot.get('ResponderGovtWebsite');
          fetchedGovtRespondTime = GovtResponseSnapshot.get('RespondGovtTime');
        });
      } else {
        if (kDebugMode) {
          print('Govt response Document does not exist');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching Govt response data: $e');
      }
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    if (isEditing) {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: widget.documentSnapshot['birthDate'].toDate(),
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
          //fetchedBirthDate = Timestamp.fromDate(pickedDate);
          birthDateTextController.text = formattedDate;
          //calculateAge(pickedDate);
        });
      }
    }
  }

  void updateCityList(String state) {
    setState(() {
      dropdownItemCity = DropdownItems.cityMap[state] ?? [];
    });
  }
}
