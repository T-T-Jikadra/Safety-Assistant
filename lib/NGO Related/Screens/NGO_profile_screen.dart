// ignore_for_file: library_private_types_in_public_api, depend_on_referenced_packages, unrelated_type_equality_checks, use_build_context_synchronously, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
// import 'package:intl/intl.dart';
import '../../Utils/Utils.dart';
import '../../Utils/constants.dart';
import '../../Utils/dropdown_Items.dart';

class NGO_Profile extends StatefulWidget {
  const NGO_Profile({super.key});

  @override
  _NGO_ProfileState createState() => _NGO_ProfileState();
}

class _NGO_ProfileState extends State<NGO_Profile> {
  bool isLoading = true;
  bool isEditing = false;

  String fetchedNid = "";
  String fetchedNGOName = "";
  String? fetchedNGORegNo = "";
  String fetchedServices = '';
  String? fetchedContactNo = "";
  String fetchedWebsite = '';
  String fetchedEmail = '';
  String fetchedState = "";
  String fetchedCity = "";
  String fetchedPinCode = "";
  String fetchedFullAddress = "";
  String fetchedRegTime = "";

  TextEditingController nameTextController = TextEditingController();
  TextEditingController serviceGovtTextController = TextEditingController();
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
                    AbsorbPointer(
                      absorbing: !isEditing,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 25,left: 10, bottom: 3),
                            child: Text("Name of NGO :"),
                          ),
                          //username
                          SizedBox(
                            height: 55,
                            child: TextFormField(
                              controller: nameTextController,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.person),
                                hintText: fetchedNGOName,
                              ),
                              enabled: isEditing,
                            ),
                          ),
                          const SizedBox(height: 12),
                          //reg no
                          const Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 3),
                            child: Text("Registration Number :"),
                          ),
                          SizedBox(
                            height: 55,
                            child: TextFormField(
                              enabled: false,
                              decoration: InputDecoration(
                                prefixIcon:
                                const Icon(Iconsax.location_add),
                                hintText: fetchedNGORegNo,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          //service
                          const Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 3),
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
                              controller: serviceGovtTextController,
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: fetchedServices.isEmpty
                                    ? "Select Services Govt. can provide"
                                    : fetchedServices,
                                prefixIcon: Container(
                                  margin: const EdgeInsets.fromLTRB(
                                      20, 16, 12, 16),
                                  child:
                                  SvgPicture.asset(svg_for_calendar),
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
                          //contact
                          const Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 3),
                            child: Text("Contact Number :"),
                          ),
                          //contact
                          SizedBox(
                            height: 55,
                            child: TextFormField(
                              enabled: isEditing,
                              decoration: InputDecoration(
                                prefixIcon:
                                const Icon(Iconsax.location_add),
                                hintText: fetchedContactNo,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 3),
                            child: Text("Email Address :"),
                          ),
                          //email
                          SizedBox(
                            height: 55,
                            child: TextFormField(
                              enabled: false,
                              decoration: InputDecoration(
                                prefixIcon:
                                const Icon(Iconsax.location_add),
                                hintText: fetchedEmail,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 3),
                            child: Text("Website :"),
                          ),
                          //website
                          SizedBox(
                            height: 55,
                            child: TextFormField(
                              controller: cityTextController,
                              decoration: InputDecoration(
                                prefixIcon:
                                const Icon(Iconsax.location_add),
                                hintText: fetchedWebsite,
                              ),
                              enabled: isEditing,
                            ),
                          ),
                          const SizedBox(height: 12),
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
                          const SizedBox(height: 12),
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
                          const SizedBox(height: 12),
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
                          const SizedBox(height: 12),
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
                            const SizedBox(height: 20),
                            Text(
                              "NGO registered at  : $fetchedRegTime",
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
                            "Enable editing to edit NGO profile ..",
                            "Okay");
                      } else {
                        //updateGovtProfile();
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
        if (nameTextController.text.isNotEmpty)
          'firstName': nameTextController.text,
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
            .collection('clc_govt')
            .doc(user?.email)
            .update(updatedData);

        setState(() {
          isEditing = false;
        });
        showSnakeBar(context, "Govt profile updated successfully .. ", "Okay");
      } else {
        // setState(() {isEditing = false;});
        showSnakeBar(context, "No Govt profile data edited !", "Okay");
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error updating govt profile : $e');
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

    for (int i = 0; i < DropdownItems.dropdownItemListofServices.length; i++) {
      if (fetchedServices
          .contains(DropdownItems.dropdownItemListofServices[i])) {
        _checked[i] = true;
      }
    }

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

                          // Update the text field whenever a toggle is changed
                          _updateTextField(_checked);
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
      // This code block executes after the dialog is dismissed
      // You can use this to update the text field when the dialog is dismissed
      _updateTextField(_checked);
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
    serviceGovtTextController.text = selectedOptions;
  }
}
