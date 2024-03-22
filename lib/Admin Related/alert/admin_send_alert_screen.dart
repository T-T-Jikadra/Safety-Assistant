// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously, camel_case_types

import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../Models/alert_notification_model.dart';
import '../../Utils/Utils.dart';
import '../../Utils/dropdown_Items.dart';
import '../../Components/Notification_related/notification_services.dart';
import 'package:http/http.dart' as http;

class Admin_Send_Alert_Screen extends StatefulWidget {
  const Admin_Send_Alert_Screen({super.key});

  @override
  State<Admin_Send_Alert_Screen> createState() =>
      _Admin_Send_Alert_ScreenState();
}

class _Admin_Send_Alert_ScreenState extends State<Admin_Send_Alert_Screen> {
  NotificationServices notificationServices = NotificationServices();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //profile fields
  // String fetchedCid = "";
  // String fetchedFname = "";
  // String? fetchedPhone = "";
  // String fetchedState = "";
  // String fetchedCity = "";
  // String fetchedPinCode = "";
  // String fetchedFullAddress = "";

  String selectedDisaster = "";
  String selectedState = '';
  String selectedCity = '';
  bool alertSent = false;
  String? fetchedDid = '';
  String? did = '';
  String? fetchedDos = '';
  String? fetchedDonts = '';

  TextEditingController descController = TextEditingController();

  // bool isFetched = false;
  //TextEditingController pincodeController = TextEditingController();

  List<String> dropdownItemCity = [];

  double _value = 0.0;

  final List<String> _levels = ["Low", "Severe", "Critical"];

  @override
  void initState() {
    // Future.delayed(const Duration(milliseconds: 1600), () {
    //   setState(() {
    //     isFetched = true;
    //   });
    // });
    super.initState();
    selectedDisaster = DropdownItems.dropdownItemTypeOfDisaster.first;
    selectedState = DropdownItems.dropdownItemState.first;
    updateCityList(selectedState);
    //listen to  incoming msg...
    notificationServices.firebaseInit(context);

    //for notification when background and terminated case of application
    notificationServices.setupInteractMessage(context);
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
        title: const Text("Alert"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: RefreshIndicator(
          onRefresh: _refreshData,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 25),
                      padding: const EdgeInsets.only(
                          //for fields that are covered under keyboard ..
                          // bottom: MediaQuery.of(context).viewInsets.bottom,
                          left: 2,
                          right: 2),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            const Text(
                                "Broadcast to all the users through an alert : ",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 20),
                            //service list
                            Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    child: SizedBox(
                                      height: 60,
                                      child: DropdownButtonFormField<String>(
                                        value: selectedDisaster,
                                        items: DropdownItems
                                            .dropdownItemTypeOfDisaster
                                            .map((String state) {
                                          return DropdownMenuItem<String>(
                                            // alignment: AlignmentDirectional.topStart,
                                            value: state,
                                            child: Text(state),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            selectedDisaster = value!;
                                            // Update city list based on the selected state
                                          });
                                        },
                                        decoration: const InputDecoration(
                                          filled: true,
                                          // border: OutlineInputBorder(),
                                          hintText: "Select alert type",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            //slider
                            Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  //alignment: Alignment.center,
                                  children: [
                                    const Text(
                                      "\t\t  Alert level : ",
                                    ),
                                    SizedBox(
                                      child: Slider(
                                        value: _value,
                                        min: 0.0,
                                        max: 2.0,
                                        divisions: 2,
                                        activeColor: _getColorForValue(_value),
                                        onChanged: (newValue) {
                                          setState(() {
                                            _value = newValue;
                                          });
                                        },
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Center(
                                          child: Text(
                                            _levels[_value.toInt()],
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // if (selectedRadioAddress == 1)
                            //   isFetched
                            //       ? Container(
                            //     padding: const EdgeInsets.symmetric(
                            //         horizontal: 20, vertical: 8),
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(19.0),
                            //       border: Border.all(
                            //         color: Colors.grey,
                            //         width: 1.0,
                            //       ),
                            //     ),
                            //     child: DataTable(
                            //       columnSpacing: 10.0,
                            //       columns: const [
                            //         DataColumn(
                            //             label: Text('Field',
                            //                 style: TextStyle(
                            //                     fontWeight: FontWeight.bold,
                            //                     color: colorPrimary))),
                            //         DataColumn(
                            //             label: Text('Data',
                            //                 style: TextStyle(
                            //                     fontWeight: FontWeight.bold,
                            //                     color: colorPrimary))),
                            //       ],
                            //       rows: [
                            //         buildDataRow('Name', fetchedFname),
                            //         buildDataRow(
                            //             'Address', fetchedFullAddress),
                            //         buildDataRow(
                            //             'Pin Code', fetchedPinCode),
                            //         buildDataRow('City', fetchedCity),
                            //         buildDataRow('State', fetchedState),
                            //       ],
                            //     ),
                            //   )
                            //   // Text(
                            //   //         "$fetchedFname \n $fetchedFullAddress \n $fetchedPinCode \n $fetchedCity \n $fetchedState ",
                            //   //         style: const TextStyle(fontSize: 14),
                            //   //       )
                            //       : const SpinKitThreeBounce(
                            //     color: Colors.blueGrey,
                            //     size: 20,
                            //   ),
                            // if (selectedRadioAddress == 2)
                            const SizedBox(height: 18),
                            //desc
                            SizedBox(
                              child: Column(
                                children: [
                                  const Text(
                                      "Give brief information regarding alert : ",
                                      style: TextStyle(fontSize: 15)),
                                  const SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: TextFormField(
                                      controller: descController,
                                      minLines: 2,
                                      maxLines: 4,
                                      maxLength: 100,
                                      decoration: const InputDecoration(
                                          hintText: 'Brief description',
                                          prefixIcon: Icon(Icons.description),
                                          labelText: 'Description'),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          //_fnameFocusNode.requestFocus();
                                          return 'Description required';
                                        }
                                        if (value.isNotEmpty &&
                                            value.length < 3) {
                                          //_fnameFocusNode.requestFocus();
                                          return "Too short description";
                                        }
                                        return null; // Return null if the input is valid
                                      },
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.symmetric(
                                  //       horizontal: 15.0),
                                  //   child: TextFormField(
                                  //     controller: pincodeController,
                                  //     decoration: const InputDecoration(
                                  //         prefixIcon:
                                  //         Icon(Icons.pin_drop_outlined),
                                  //         hintText: 'Enter Pincode',
                                  //         labelText: "Pincode"),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 18),
                            //state
                            Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      right: 10,
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
                                          hintText: "Select State",
                                        ),
                                        validator: (value) {
                                          if (value == "Select your state") {
                                            return 'Select State';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            // city
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
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
                                    });
                                  },
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Select your City",
                                  ),
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'Select City';
                                  //   }
                                  //   return null;
                                  // },
                                ),
                              ),
                            ),
                          ],
                        ),
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
                            onPressed: () async {
                              CollectionReference alertCollection =
                                  FirebaseFirestore.instance
                                      .collection("clc_alert");

                              QuerySnapshot snapshot =
                                  await alertCollection.get();
                              int totalDocCount = snapshot.size;
                              totalDocCount++;
                              //to get dos anf donts document id
                              fetchDid(selectedDisaster, totalDocCount);

                              if (fetchedDid != null) {
                                if (kDebugMode) {
                                  print(fetchedDid);
                                }
                              }
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
                              Navigator.pop(context);
                              //For Rid
                              if (_formKey.currentState!.validate()) {
                                if (!alertSent) {
                                  try {
                                    if (selectedCity.isEmpty) {
                                      //to selected state
                                      var CitywiseCitizenSnap =
                                          await FirebaseFirestore.instance
                                              .collection('clc_citizen')
                                              .where('state',
                                                  isEqualTo: selectedState)
                                              .get();

                                      for (var doc
                                          in CitywiseCitizenSnap.docs) {
                                        String deviceToken =
                                            doc.data()['deviceToken'];
                                        broadcastAlert(
                                            deviceToken, totalDocCount);
                                      }

                                      //sends alert to only NGO
                                      var CitywiseNGOSnap = await FirebaseFirestore
                                          .instance
                                          .collection('clc_ngo')
                                          //added new ***
                                          // .where('services', whereIn: selectedServiceWords)
                                          .where('state',
                                              isEqualTo: selectedState)
                                          .get();

                                      for (var ngoDoc in CitywiseNGOSnap.docs) {
                                        String deviceToken =
                                            ngoDoc.data()['deviceToken'];
                                        broadcastAlert(
                                            deviceToken, totalDocCount);
                                      }

                                      var CitywiseGovtSnap =
                                          await FirebaseFirestore
                                              .instance
                                              .collection('clc_govt')
                                              .where('state',
                                                  isEqualTo: selectedState)
                                              .get();

                                      for (var doc in CitywiseGovtSnap.docs) {
                                        String deviceToken =
                                            doc.data()['deviceToken'];
                                        broadcastAlert(
                                            deviceToken, totalDocCount);
                                      }
                                    } else {
                                      //to selected city
                                      var CitywiseCitizenSnap =
                                          await FirebaseFirestore.instance
                                              .collection('clc_citizen')
                                              .where('city',
                                                  isEqualTo: selectedCity)
                                              .get();

                                      for (var doc
                                          in CitywiseCitizenSnap.docs) {
                                        String deviceToken =
                                            doc.data()['deviceToken'];
                                        broadcastAlert(
                                            deviceToken, totalDocCount);
                                      }

                                      //sends alert to only NGO
                                      var CitywiseNGOSnap = await FirebaseFirestore
                                          .instance
                                          .collection('clc_ngo')
                                          //added new ***
                                          // .where('services', whereIn: selectedServiceWords)
                                          .where('city',
                                              isEqualTo: selectedCity)
                                          .get();

                                      for (var ngoDoc in CitywiseNGOSnap.docs) {
                                        String deviceToken =
                                            ngoDoc.data()['deviceToken'];
                                        broadcastAlert(
                                            deviceToken, totalDocCount);
                                      }

                                      var CitywiseGovtSnap =
                                          await FirebaseFirestore
                                              .instance
                                              .collection('clc_govt')
                                              .where('city',
                                                  isEqualTo: selectedCity)
                                              .get();

                                      for (var doc in CitywiseGovtSnap.docs) {
                                        String deviceToken =
                                            doc.data()['deviceToken'];
                                        broadcastAlert(
                                            deviceToken, totalDocCount);
                                      }
                                    }
                                    //sends alert to citizen

                                    // });
                                    addAlertToDatabase(totalDocCount);
                                  } catch (e) {
                                    if (kDebugMode) {
                                      print('Error while sending alert : $e');
                                    }
                                  } finally {
                                    //Navigator.pop(context);
                                  }
                                  alertSent = true;
                                } else {
                                  //Navigator.pop(context);
                                  showMsgDialog(context,
                                      'You have already sent alert in a while !');
                                }
                              }
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18)))),
                            child: const Text("Broadcast now"))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void fetchDid(String typeOfDisaster, int totalCount) async {
    try {
      // Reference to the Firestore collection
      CollectionReference clcDosDontsCollection =
          FirebaseFirestore.instance.collection('clc_dos_donts');

      // Query for documents where typeOfDisaster matches with selected disaster
      QuerySnapshot queryClcSnap = await clcDosDontsCollection
          .where('typeOfDisaster', isEqualTo: typeOfDisaster)
          .get();

      // If there's at least one document retrieved
      if (queryClcSnap.docs.isNotEmpty) {
        did = queryClcSnap.docs.first.id;
        fetchedDid = queryClcSnap.docs.first.id;
        clcDosDontsCollection.doc(fetchedDid).get();

        DocumentSnapshot dosSnap =
            await clcDosDontsCollection.doc(fetchedDid).get();
        try {
          if (dosSnap.exists) {
            fetchedDos = dosSnap.get("dos");
            fetchedDonts = dosSnap.get("donts");

            await FirebaseFirestore.instance
                .collection("clc_alert")
                .doc("Alert_$totalCount")
                .update({
              'did': "Dos_$totalCount",
            });
          } else {
            if (kDebugMode) {
              print('Dos document does not exist');
            }
          }
        } catch (e) {
          // Handle any errors that occur during the process
          if (kDebugMode) {
            print('Error fetching dos/donts: $e');
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching did : $e');
      }
    }
    return null;
  }

  void broadcastAlert(String deviceToken, int totalDocCount) async {
    var data = {
      'to': deviceToken,
      'priority': 'high',
      'notification': {'title': selectedDisaster, 'body': descController.text},
      'android': {
        'notification': {'notification_count': 23},
      },
      'data': {
        'type': 'alert',
        'title': selectedDisaster,
        'desc': descController.text,
        'level': _levels[_value.toInt()],
        'dos': fetchedDos,
        'donts': fetchedDonts,
        'AlertId': totalDocCount.toString(),
      }
    };

    // Send the notification to the device
    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'key=AAAAqhgqKGQ:APA91bEi_iwrEhn8BbQOG7pfFwUikl3Kp0K1sKAoOadF9Evb8Off1U5EqwljkoMprm5uO-aS_wctndIRoJum30YbvyJIBA5W4TF-EBmL8DRTrY1kHTTsDXaW8wWPLBSrbcgPobzzm8No'
      },
    );
  }

  void addAlertToDatabase(int totalDocCount) async {
    //Storing data to database
    AlertNotificationRegistration alertData = AlertNotificationRegistration(
      AlertId: "Alert_${totalDocCount.toString()}",
      did: "$did",
      typeofDisaster: selectedDisaster,
      desc: descController.text.trim(),
      level: _levels[_value.toInt()],
      state: selectedState,
      city: selectedCity,
    );

    Map<String, dynamic> adminAlertJson = alertData.toJsonAlert();

    try {
      await FirebaseFirestore.instance
          .collection("clc_alert")
          .doc("Alert_${totalDocCount.toString()}")
          .set(adminAlertJson);

      Timer(const Duration(milliseconds: 800), () {
        showMsgDialog(context, 'Alert broadcast success ..');
      });
    } catch (e) {
      // An error occurred
      if (kDebugMode) {
        print('Error adding admin alert : $e');
      }
    }
  }

  Future<void> _refreshData() async {
    // Simulate a delay for refreshing data
    await Future.delayed(const Duration(milliseconds: 1200));
    setState(() {
      selectedDisaster = DropdownItems.dropdownItemTypeOfDisaster.first;
      selectedState = DropdownItems.dropdownItemState.first;
      descController.clear();
      alertSent = false;
    });
  }

  void updateCityList(String state) {
    setState(() {
      dropdownItemCity = DropdownItems.cityMap[state] ?? [];
    });
  }

  Color _getColorForValue(double value) {
    // Define color transitions based on the slider value
    if (value < 1.0) {
      return Colors.yellow;
    } else if (value < 2.0) {
      return Colors.orange;
    } else if (value < 3.0) {
      return Colors.red;
    } else {
      return Colors.red;
    }
  }
}
