// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../Utils/Utils.dart';
import '../../Utils/dropdown_Items.dart';

class Admin_Govt_Agency_Details_Screen extends StatefulWidget {
  final DocumentSnapshot GovtSnapshot;

  const Admin_Govt_Agency_Details_Screen(
      {super.key, required this.GovtSnapshot});

  @override
  State<Admin_Govt_Agency_Details_Screen> createState() =>
      _Admin_Govt_Agency_Details_ScreenState();
}

class _Admin_Govt_Agency_Details_ScreenState
    extends State<Admin_Govt_Agency_Details_Screen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = true;
  bool isEditing = false;
  String fetchedRegTime = '';

  String selectedState = '';
  String selectedCity = '';
  List<String> dropdownItemCity = [];

  TextEditingController nameTextController = TextEditingController();
  TextEditingController regNoTextController = TextEditingController();
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
    isLoading = false;
    selectedState = widget.GovtSnapshot['state'];
    selectedCity = widget.GovtSnapshot['city'];
    updateCityList(selectedState);
    setState(() {
      nameTextController.text = widget.GovtSnapshot['GovtAgencyName'];
      regNoTextController.text = widget.GovtSnapshot['GovtAgencyRegNo'];
      serviceTextController.text = widget.GovtSnapshot['services'];
      phoneTextController.text = widget.GovtSnapshot['contactNumber'];
      emailTextController.text = widget.GovtSnapshot['email'];
      websiteTextController.text = widget.GovtSnapshot['website'];
      addressTextController.text = widget.GovtSnapshot['fullAddress'];
      pincodeTextController.text = widget.GovtSnapshot['pinCode'];
      cityTextController.text = widget.GovtSnapshot['city'];
      stateTextController.text = widget.GovtSnapshot['state'];
      fetchedRegTime = widget.GovtSnapshot['registrationTime'];

      selectedState = widget.GovtSnapshot['state'];
      selectedCity = widget.GovtSnapshot['city'];
      updateCityList(selectedState);

      for (int i = 0;
          i < DropdownItems.dropdownItemListofServices.length;
          i++) {
        if (widget.GovtSnapshot['services']
            .contains(DropdownItems.dropdownItemListofServices[i])) {
          _checked[i] = true;
        }
      }
      isLoading = false;
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
        title: const Text("Govt Agency Details"),
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
                                    child: Text("Name of Govt Agency :"),
                                  ),
                                  //username
                                  SizedBox(
                                    child: TextFormField(
                                      controller: nameTextController,
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                            CupertinoIcons.person_alt),
                                        hintText:
                                            "${widget.GovtSnapshot['GovtAgencyName']}",
                                      ),
                                      enabled: isEditing,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter NGO name';
                                        }
                                        if (value.isNotEmpty &&
                                            value.length < 2) {
                                          return 'Minimum 2 Characters required';
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
                                        hintText:
                                            "${widget.GovtSnapshot['GovtAgencyRegNo']}",
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
                                            "Select Services Agency can provide",
                                        prefixIcon: Icon(
                                            CupertinoIcons.square_list_fill),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Select your services from list';
                                        }
                                        return null;
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
                                        hintText:
                                            "${widget.GovtSnapshot['contactNumber']}",
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
                                        return null;
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
                                        hintText:
                                            "${widget.GovtSnapshot['email']}",
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
                                        hintText:
                                            "${widget.GovtSnapshot['website']}",
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
                                        return null;
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
                                        hintText:
                                            "${widget.GovtSnapshot['fullAddress']}",
                                      ),
                                      enabled: isEditing,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter full address';
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
                                        hintText:
                                            "${widget.GovtSnapshot['pinCode']}",
                                      ),
                                      enabled: isEditing,
                                      keyboardType: TextInputType.phone,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter pin code ';
                                        }
                                        if (value.isNotEmpty &&
                                            value.length < 6) {
                                          return 'Enter 6 digits Pin code';
                                        }
                                        return null;
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
                                      "Govt Agency registered at  : \t   "
                                      "\n${fetchedRegTime.substring(0, 20)}",
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
                                if (isEditing == false) {
                                  showSnakeBar(
                                      context,
                                      "Enable editing to govt agency profile ..",
                                      "okay");
                                } else {
                                  if (_formKey.currentState!.validate()) {
                                    updateGovtProfile();
                                  }
                                }
                                try {} catch (e) {
                                  if (kDebugMode) {
                                    print(
                                        'Error while updating govt profile : $e');
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
                                  content:
                                      const Text('Delete this Govt Agency ?'),
                                  actions: <Widget>[
                                    CupertinoDialogAction(
                                      isDefaultAction: true,
                                      child: const Text('cancel'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    CupertinoDialogAction(
                                      isDefaultAction: true,
                                      child: const Text('Delete'),
                                      onPressed: () async {
                                        //delete
                                        deleteGovtAgency();
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
                                            const Duration(milliseconds: 1100));
                                        Navigator.pop(context);
                                        Navigator.pop(context, true);
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

  void deleteGovtAgency() async {
    try {
      // Delete user
      DocumentReference userRef = FirebaseFirestore.instance
          .collection('clc_govt')
          .doc(widget.GovtSnapshot['email']);
      await userRef
          .delete()
          .then((value) => showToastMsg("govt agency deleted successfully"));
    } catch (error) {
      if (kDebugMode) {
        print("Error deleting govt agency: $error");
      }
      showToastMsg("Failed to delete govt agency");
    }
  }

  Future<void> updateGovtProfile() async {
    try {
      Map<String, dynamic> updatedData = {
        if (nameTextController.text.trim() !=
            widget.GovtSnapshot['GovtAgencyName'])
          'GovtAgencyName': nameTextController.text.trim(),
        if (widget.GovtSnapshot['services'] !=
            serviceTextController.text.trim())
          'services': serviceTextController.text.trim(),
        if (phoneTextController.text.trim() !=
            widget.GovtSnapshot['contactNumber'])
          'contactNumber': phoneTextController.text,
        if (emailTextController.text.trim() != widget.GovtSnapshot['email'])
          'email': emailTextController.text,
        if (websiteTextController.text.trim() != widget.GovtSnapshot['website'])
          'website': websiteTextController.text.trim(),
        if (selectedState != widget.GovtSnapshot['state'])
          'state': selectedState,
        if (selectedCity != widget.GovtSnapshot['city']) 'city': selectedCity,
        if (pincodeTextController.text != widget.GovtSnapshot['pinCode'])
          'pinCode': pincodeTextController.text.trim(),
        if (addressTextController.text.trim() !=
            widget.GovtSnapshot['fullAddress'])
          'fullAddress': addressTextController.text.trim(),
      };

      // Check if any field is edited
      if (updatedData.isNotEmpty) {
        // Update data in Firestore only for non-empty fields
        await FirebaseFirestore.instance
            .collection('clc_govt')
            .doc(widget.GovtSnapshot['email'])
            .update(updatedData);

        setState(() {
          isEditing = false;
        });
        showSnakeBar(context, "Govt profile updated successfully .. ", "okay");
      } else {
        // setState(() {isEditing = false;});
        showSnakeBar(context, "No Govt profile data edited !", "close");
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error updating govt profile : $e');
      }
      showSnakeBar(context, "$e!", "Okay");
    }
  }

// void deleteGovtAgency() async {
//   try {
//     // Delete user
//     DocumentReference userRef = FirebaseFirestore.instance
//         .collection('clc_citizen')
//         .doc(widget.GovtSnapshot['phoneNumber']);
//     await userRef
//         .delete()
//         .then((value) => showToastMsg("User deleted successfully"));
//
//   } catch (error) {
//     if (kDebugMode) {
//       print("Error deleting user: $error");
//     }
//     showToastMsg("Failed to delete citizen");
//   }
// }
}
