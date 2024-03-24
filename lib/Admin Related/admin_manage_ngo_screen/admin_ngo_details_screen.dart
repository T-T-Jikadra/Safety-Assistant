// ignore_for_file: camel_case_types, use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Admin_NGO_Details_Screen extends StatefulWidget {
  const Admin_NGO_Details_Screen({super.key});

  @override
  State<Admin_NGO_Details_Screen> createState() =>
      _Admin_NGO_Details_ScreenState();
}

class _Admin_NGO_Details_ScreenState extends State<Admin_NGO_Details_Screen> {
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
          title: const Text("NGO Details"),
        ),
        body: const Center(
          child: Text("It's NGO details Page"),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, bottom: 15),
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
                                  top: 35, bottom: 25, left: 20, right: 20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 15),
                                  CircularProgressIndicator(color: Colors.blue),
                                  SizedBox(height: 30),
                                  Text('Processing ...')
                                ],
                              ),
                            ),
                          );
                        },
                      );
                      await Future.delayed(const Duration(milliseconds: 1300));

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
                          print('Error while sending citizen request : $e');
                        }
                      } finally {
                        Navigator.pop(context);
                      }
                      // }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.teal),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
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
                      final CupertinoAlertDialog alert = CupertinoAlertDialog(
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
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.red.shade400),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      )),
                    ),
                    child: const Text("Delete"),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
