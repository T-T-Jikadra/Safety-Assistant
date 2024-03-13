// ignore_for_file: use_build_context_synchronously

import 'package:fff/Admin%20Related/Lower%20Level%20Admin/lower_admin.dart';
import 'package:fff/_Root/type%20of%20user/typecolumnlist_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../Govt Body Related/Screens/govt_login_screen/govt_login.dart';
import '../../../NGO Related/Screens/ngo_login_screen/ngo_login.dart';
import '../../Citizen Related/Screens/citizen_login_screen/login_screen.dart';
import '../../Components/Check for Internet/check_internet.dart';
import '../../Components/Notification_related/notification_services.dart';
import '../../Utils/Utils.dart';

class SelectOptionPageScreen extends StatefulWidget {
  const SelectOptionPageScreen({Key? key}) : super(key: key);

  @override
  State<SelectOptionPageScreen> createState() => _SelectOptionPageScreenState();
}

class _SelectOptionPageScreenState extends State<SelectOptionPageScreen> {
  NotificationServices notificationServices = NotificationServices();
  int? _selectedIndex; // Index of the selected role in the list
  String? _selectedRole; // The selected role

  @override
  void initState() {
    if (kDebugMode) {
      print(_selectedRole);
    }
    // TODO: implement initState
    super.initState();
    InternetPopup().initialize(context: context);
    notificationServices.requestNotificationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 3,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //left btn
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 5, top: 15),
                        //   child: TextButton(
                        //     onPressed: () {
                        //       // Functionality for Local Authority button
                        //     },
                        //     child: const Text('Local \nAuthority',
                        //         textAlign: TextAlign.center,
                        //         style: TextStyle(fontSize: 14)),
                        //   ),
                        // ),
                        //right btn
                        Padding(
                          padding: const EdgeInsets.only(right: 7, top: 15),
                          child: TextButton(
                            onPressed: () {
                              // Navigate to Local Admin screen
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Ad_Lower()));
                            },
                            child: const Text('Local \nAdmin',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 14)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    // const Text("Choose Role",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.deepPurple),),
                    const SizedBox(height: 30),
                    const SizedBox(
                      width: 260,
                      child: Text("Let us know who you are ..",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w200, fontSize: 24)),
                    ),
                    const SizedBox(height: 50),
                    _buildTypeColumnList(context),
                    // Building the list of roles
                    const SizedBox(height: 15),
                    // _selectedRole !=null
                    //     ? Text("Selected Role: $_selectedRole")
                    //     : const SizedBox.shrink(),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
                width: double.infinity,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: ElevatedButton(
                        onPressed: () async {
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
                              const Duration(milliseconds: 400));
                          Navigator.pop(context);
                          //showErrorDialog(context, 'Mobile number can\'t be empty.');

                          // showToastMsg("gey"),
                          // Navigate based on selected role
                          switch (_selectedRole) {
                            case "I am Citizen":
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CitizenLoginScreen()),
                              );
                              break;
                            case "I am an NGO":
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const NGOLoginPageScreen()),
                              );
                              break;
                            case "I am Government Agency":
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const GovtLoginPageScreen()),
                              );
                              break;
                            default:
                              final snackBar = TsnakeBar(
                                  context,
                                  "Please select type of user first ..",
                                  "Undo");
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                          }
                        },
                        child: const Text("Continue .."))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to build the list of roles
  Widget _buildTypeColumnList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13, right: 9),
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 30,
          );
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          String roleName;
          switch (index) {
            case 0:
              roleName = "I am Citizen";
              break;
            case 1:
              roleName = "I am an NGO";
              break;
            case 2:
              roleName = "I am Government Agency";
              break;
            default:
              roleName = "Unknown";
              break;
          }

          return TypecolumnlistItemWidget(
            isSelected: _selectedIndex == index,
            roleName: roleName,
            onChanged: (bool? newValue) {
              setState(() {
                _selectedIndex = newValue == true ? index : null;
                _selectedRole = _selectedIndex == null ? null : roleName;
              });
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    // Dispose any resources here
    super.dispose();
    _selectedRole = null;
  }

  void showErrorDialog(BuildContext context, String message) {
    // Set up the AlertDialog
    final CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: const Text('Error : '),
      content: Text('\n$message'),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text('Okay'),
          onPressed: () {
            Navigator.of(context).pop();
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
  }
}
