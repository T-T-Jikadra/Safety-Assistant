// ignore_for_file: library_private_types_in_public_api, depend_on_referenced_packages, unrelated_type_equality_checks, use_build_context_synchronously, camel_case_types
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../Utils/Utils.dart';
import '../../Utils/constants.dart';
import '../../Utils/dropdown_Items.dart';

class NGO_Profile extends StatefulWidget {
  const NGO_Profile({super.key});

  @override
  _NGO_ProfileState createState() => _NGO_ProfileState();
}

class _NGO_ProfileState extends State<NGO_Profile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = true;
  bool isEditing = false;

  String fetchedNid = "";
  String fetchedNGOName = "";
  String fetchedNGORegNo = "";
  String fetchedServices = '';
  String fetchedContactNo = "";
  String fetchedWebsite = '';
  String fetchedEmail = '';
  String fetchedState = "";
  String fetchedCity = "";
  String fetchedPinCode = "";
  String fetchedFullAddress = "";
  String fetchedRegTime = "";

  String selectedState = '';
  String selectedCity = '';
  List<String> dropdownItemCity = [];

  TextEditingController nameTextController = TextEditingController();
  TextEditingController serviceTextController = TextEditingController();
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController websiteTextController = TextEditingController();
  TextEditingController addressTextController = TextEditingController();
  TextEditingController pincodeTextController = TextEditingController();
  TextEditingController cityTextController = TextEditingController();
  TextEditingController stateTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchNGOData().then((_) {
      setState(() {
        nameTextController.text = fetchedNGOName.trim();
        serviceTextController.text = fetchedServices;
        phoneTextController.text = fetchedContactNo.trim();
        emailTextController.text = fetchedEmail.trim();
        websiteTextController.text = fetchedWebsite.trim();
        addressTextController.text = fetchedFullAddress.trim();
        pincodeTextController.text = fetchedPinCode.trim();
        cityTextController.text = fetchedCity.trim();
        stateTextController.text = fetchedState.trim();

        selectedState = fetchedState.trim();
        selectedCity = fetchedCity.trim();
        updateCityList(selectedState);

        for (int i = 0;
            i < DropdownItems.dropdownItemListofServices.length;
            i++) {
          if (fetchedServices
              .contains(DropdownItems.dropdownItemListofServices[i])) {
            _checked[i] = true;
          }
        }
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 50,
        backgroundColor: color_AppBar,
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
                          Form(
                            key: _formKey,
                            child: AbsorbPointer(
                              absorbing: !isEditing,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        top: 25, left: 10, bottom: 3),
                                    child: Text("Name of NGO :"),
                                  ),
                                  //username
                                  SizedBox(
                                    child: TextFormField(
                                      controller: nameTextController,
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                            CupertinoIcons.person_alt),
                                        hintText: fetchedNGOName,
                                      ),
                                      enabled: isEditing,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter NGO name';
                                        }
                                        if (value.isNotEmpty &&
                                            value.length < 3) {
                                          return 'Minimum 3 Characters required';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  //reg no
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, bottom: 3),
                                    child: Text("Registration Number :"),
                                  ),
                                  SizedBox(
                                    height: 55,
                                    child: TextFormField(
                                      enabled: false,
                                      decoration: InputDecoration(
                                        prefixIcon:
                                            const Icon(Icons.app_registration),
                                        hintText: fetchedNGORegNo,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  //service
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, bottom: 3),
                                    child: Text("Services :"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 5,
                                      right: 5,
                                    ),
                                    child: TextFormField(
                                      enabled: isEditing,
                                      onTap: () {
                                        _showCupertinoDialog(
                                          context,
                                        );
                                      },
                                      controller: serviceTextController,
                                      readOnly: true,
                                      decoration: const InputDecoration(
                                        hintText:
                                            "Select Services NGO can provide",
                                        prefixIcon: Icon(
                                            CupertinoIcons.square_list_fill),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Select your services from list';
                                        }
                                        return null; // Return null if the input is valid
                                      },
                                      onEditingComplete: () {
                                        FocusScope.of(context).nextFocus();
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, bottom: 3),
                                    child: Text("Contact Number :"),
                                  ),
                                  //contact
                                  SizedBox(
                                    // height: 55,
                                    child: TextFormField(
                                      controller: phoneTextController,
                                      enabled: isEditing,
                                      maxLength: 13,
                                      decoration: InputDecoration(
                                        prefixIcon:
                                            const Icon(CupertinoIcons.phone),
                                        hintText: fetchedContactNo,
                                      ),
                                      keyboardType: TextInputType.phone,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter contact number';
                                        } else if (value.isNotEmpty &&
                                            value.length < 13) {
                                          //_contactNoFocusNode.requestFocus();
                                          return 'Contact no should be of 10 digits + country code';
                                        }
                                        return null; // Return null if the input is valid
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, bottom: 3),
                                    child: Text("Email Address :"),
                                  ),
                                  //email
                                  SizedBox(
                                    child: TextFormField(
                                      controller: emailTextController,
                                      decoration: InputDecoration(
                                        prefixIcon:
                                            const Icon(Icons.email_outlined),
                                        hintText: fetchedEmail,
                                      ),
                                      enabled: isEditing,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter an email address';
                                        }
                                        // Regular expression for validating an email address
                                        final emailRegex = RegExp(
                                            r'^[\w.-]+@([\w-]+\.)+[\w-]{2,4}$');
                                        if (!emailRegex.hasMatch(value)) {
                                          return 'Enter valid email address';
                                        }
                                        return null; // Return null if the input is valid
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, bottom: 3),
                                    child: Text("Website :"),
                                  ),
                                  //website
                                  SizedBox(
                                    child: TextFormField(
                                      controller: websiteTextController,
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                            Icons.dataset_linked_outlined),
                                        hintText: fetchedWebsite,
                                      ),
                                      enabled: isEditing,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter website URL';
                                        }
                                        // Regular expression for validating a URL
                                        final urlRegex = RegExp(
                                          r'^(https?://)?'
                                          r'([a-z0-9-]+\.)*[a-z0-9-]+'
                                          r'\.[a-z]{2,}(\/\S*)?$',
                                          caseSensitive: false,
                                        );
                                        if (websiteTextController
                                                .text.isNotEmpty &&
                                            !urlRegex.hasMatch(value)) {
                                          // _websiteFocusNode.requestFocus();
                                          return 'Enter valid URL';
                                        }
                                        return null; // Return null if the input is valid
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 12),
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
                                        prefixIcon: const Icon(CupertinoIcons
                                            .pencil_ellipsis_rectangle),
                                        hintText: fetchedFullAddress,
                                      ),
                                      enabled: isEditing,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter NGO full address';
                                        }
                                        if (value.isNotEmpty &&
                                            value.length < 10) {
                                          return 'Too short address';
                                        }
                                        return null; // Return null if the input is valid
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 12),
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
                                            const Icon(Icons.pin_rounded),
                                        hintText: fetchedPinCode,
                                      ),
                                      enabled: isEditing,
                                      keyboardType: TextInputType.phone,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter pin code of an NGO';
                                        }
                                        if (value.isNotEmpty &&
                                            value.length < 6) {
                                          return 'Enter 6 digits Pin code';
                                        }
                                        return null; // Return null if the input is valid
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 12),
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
                                            // Update city list based on the selected state
                                            updateCityList(selectedState);
                                            // Reset selected city when state changes
                                            selectedCity = '';
                                          });
                                        },
                                        decoration: InputDecoration(
                                          enabled: isEditing,
                                          // border: OutlineInputBorder(),
                                          hintText: "Select your State",
                                          prefixIcon: const Icon(
                                              CupertinoIcons.map_pin_ellipse),
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
                                          prefixIcon: const Icon(
                                              Icons.location_city_rounded),
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
                                      "NGO registered at  : \t   \n$fetchedRegTime",
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
                                  "Enable editing to edit NGO profile ..",
                                  "Okay");
                            } else {
                              if (_formKey.currentState!.validate()) {
                                updateNGOProfile();
                              }
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

  Future<void> fetchNGOData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      DocumentSnapshot govtSnapshot = await FirebaseFirestore.instance
          .collection('clc_ngo')
          .doc(user?.email)
          .get();

      if (govtSnapshot.exists) {
        setState(() {
          fetchedNid = govtSnapshot.get('nid');
          fetchedNGOName = govtSnapshot.get('nameOfNGO');
          fetchedNGORegNo = govtSnapshot.get('NGORegNo');
          fetchedServices = govtSnapshot.get('services');
          fetchedContactNo = govtSnapshot.get('contactNumber');
          fetchedWebsite = govtSnapshot.get('website');
          fetchedEmail = govtSnapshot.get('email');
          fetchedState = govtSnapshot.get('state');
          fetchedCity = govtSnapshot.get('city');
          fetchedPinCode = govtSnapshot.get('pinCode');
          fetchedFullAddress = govtSnapshot.get('fullAddress');
          fetchedRegTime = govtSnapshot.get('registrationTime');
          fetchedRegTime = fetchedRegTime.substring(0, 20);
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

  Future<void> updateNGOProfile() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      Map<String, dynamic> updatedData = {
        if (nameTextController.text.trim() != fetchedNGOName)
          'nameOfNGO': nameTextController.text.trim(),
        if (fetchedServices != serviceTextController.text.trim())
          'services': serviceTextController.text.trim(),
        if (phoneTextController.text.trim() != fetchedContactNo)
          'contactNumber': phoneTextController.text,
        if (emailTextController.text.trim() != fetchedEmail)
          'email': emailTextController.text,
        if (websiteTextController.text.trim() != fetchedWebsite)
          'website': websiteTextController.text.trim(),
        if (selectedState != fetchedState) 'state': selectedState,
        if (selectedCity != fetchedCity) 'city': selectedCity,
        if (pincodeTextController.text != fetchedPinCode)
          'pinCode': pincodeTextController.text.trim(),
        if (addressTextController.text.trim() != fetchedFullAddress)
          'fullAddress': addressTextController.text.trim(),
      };

      // Check if any field is edited
      if (updatedData.isNotEmpty) {
        // Update data in Firestore only for non-empty fields
        await FirebaseFirestore.instance
            .collection('clc_ngo')
            .doc(user?.email)
            .update(updatedData);

        setState(() {
          isEditing = false;
        });
        showSnakeBar(context, "NGO profile updated successfully .. ", "okay");
      } else {
        // setState(() {isEditing = false;});
        showSnakeBar(context, "No NGO profile data edited !", "close");
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error updating ngo profile : $e');
      }
      showSnakeBar(context, "$e!", "Okay");
    }
  }

  //for services selection //
  final List<bool> _checked = List.filled(
    DropdownItems.dropdownItemListofServices.length,
    false,
  );

  void _showCupertinoDialog(BuildContext context) {
    List<bool> initialChecked =
        List.from(_checked); // Make a copy of the initial state

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Select your services from the list :'),
              content: SizedBox(
                width: double.maxFinite,
                height: 300, // Adjust the height as needed
                child: ListView.builder(
                  itemCount: DropdownItems.dropdownItemListofServices.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title:
                          Text(DropdownItems.dropdownItemListofServices[index]),
                      trailing: CupertinoSwitch(
                        value: _checked[index],
                        onChanged: (bool value) {
                          setState(() {
                            _checked[index] = value;
                          });
                        },
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
                  child: const Text('Cancel',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                TextButton(
                  onPressed: () {
                    // Dismiss the dialog
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            );
          },
        );
      },
    ).then((value) {
      // Check if the selection has changed before updating text field
      if (!listEquals(initialChecked, _checked)) {
        _updateTextField(_checked);
      }
    });
  }

  void _updateTextField(List<bool> checked) {
    String selectedOptions = '';
    for (int i = 0; i < DropdownItems.dropdownItemListofServices.length; i++) {
      if (checked[i]) {
        selectedOptions += '${DropdownItems.dropdownItemListofServices[i]}, ';
      }
    }
    if (selectedOptions.isNotEmpty) {
      selectedOptions =
          selectedOptions.substring(0, selectedOptions.length - 2);
    }
    serviceTextController.text = selectedOptions;
  }

  void updateCityList(String state) {
    setState(() {
      dropdownItemCity = DropdownItems.cityMap[state] ?? [];
    });
  }
}
