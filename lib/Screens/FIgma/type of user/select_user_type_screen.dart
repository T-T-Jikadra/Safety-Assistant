import 'package:fff/Admin%20Related/Lower%20Level%20Admin/lowerAdmin.dart';
import 'package:fff/Screens/FIgma/type%20of%20user/typecolumnlist_item_widget.dart';
import 'package:flutter/material.dart';
import '../../../mobile Otp/screens/login_screen/login_screen.dart';
import '../Govt/govt_login.dart';
import '../ngo/ngo_login.dart';

class SelectOptionPageScreen extends StatefulWidget {
  const SelectOptionPageScreen({Key? key}) : super(key: key);

  @override
  State<SelectOptionPageScreen> createState() => _SelectOptionPageScreenState();
}

class _SelectOptionPageScreenState extends State<SelectOptionPageScreen> {
  int? _selectedIndex; // Index of the selected role in the list
  String? _selectedRole; // The selected role

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
                        Padding(
                          padding: const EdgeInsets.only(left: 5, top: 10),
                          child: TextButton(
                            onPressed: () {
                              // Functionality for Local Authority button
                            },
                            child: const Text('Local \nAuthority',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 14)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 7, top: 10),
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
                    const SizedBox(height: 35),
                    const Text(
                      "Choose Role",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple),
                    ),
                    const SizedBox(height: 25),
                    const SizedBox(
                      width: 260,
                      child: Text(
                          "Please select your Role to help us for\n give you your functionality",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w200)),
                    ),
                    const SizedBox(height: 50),
                    _buildTypeColumnList(context), // Building the list of roles
                    const SizedBox(height: 15),
                    _selectedRole !=
                            null // Show selected role if one is selected
                        ? Text(
                            "Selected Role: $_selectedRole",
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 20),
                      width: double.infinity,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: ElevatedButton(
                              onPressed: () {
                                // Navigate based on selected role
                                if (_selectedRole == "Citizen") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CitizenLoginScreen()));
                                } else if (_selectedRole == "NGO") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const NGOLoginPageScreen()));
                                } else if (_selectedRole == "Government Body") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const GovtLoginPageScreen()));
                                } else {
                                  final snackBar = SnackBar(
                                    dismissDirection: DismissDirection.vertical,
                                    elevation: 35,
                                    padding: const EdgeInsets.all(7),
                                    content: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                          'Please select type of user first ..'),
                                    ),
                                    duration: const Duration(seconds: 3),
                                    // Duration for which SnackBar will be visible
                                    action: SnackBarAction(
                                      label: 'Undo',
                                      onPressed: () {
                                        // Undo functionality
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                      },
                                    ),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
                              child: const Text("Continue .."))),
                    ),
                  ],
                ),
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
              roleName = 'Citizen';
              break;
            case 1:
              roleName = 'NGO';
              break;
            case 2:
              roleName = 'Government Body';
              break;
            default:
              roleName = 'Unknown';
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
}
