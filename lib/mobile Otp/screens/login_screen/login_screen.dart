import 'package:fff/mobile%20Otp/screens/login_screen/widget/country_picker.dart';
import 'package:fff/mobile%20Otp/screens/login_screen/widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../Citizen Related/Screens/Sign_Up/temp/SignUp_header_widget.dart';
import '../../../Screens/FIgma/citizen_signup/citizen_signup.dart';
import '../../../Utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _contactEditingController = TextEditingController();
  var _dialCode = '';

  // Build method for UI Representation
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: FormHeaderWidget(
                    image: splash_shape,
                    title: "Get on Board !",
                    subTitle: "Create Your Profile \nwith Mobile no ... ",
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Container(
                  padding: const EdgeInsets.all(7.0),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16.0)),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        height: 52,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 30, 188, 51),
                          ),
                          borderRadius: BorderRadius.circular(36),
                        ),
                        child: Row(
                          children: [
                            // Country picker widget
                            CountryPicker(
                              callBackFunction: _callBackFunction,
                              headerText: 'Select Country',
                              headerBackgroundColor:
                                  Theme.of(context).primaryColor,
                              headerTextColor: Colors.white,
                            ),
                            SizedBox(
                              width: screenWidth * 0.02,
                            ),
                            Expanded(
                              child: TextField(
                                cursorRadius: const Radius.circular(50),
                                cursorWidth: 3,
                                // Close keyboard on editing completed
                                onEditingComplete: () {
                                  FocusScope.of(context).unfocus();
                                },
                                decoration: const InputDecoration(
                                  hintText: 'Mobile Number',
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 13.5),
                                ),
                                controller: _contactEditingController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      // Custom login button
                      CustomButton(clickOnLogin),
                      // const SizedBox(height: 0),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const CitizenSignupPageOneScreen(),
                                ));
                          },
                          child: const Text(
                              "Don't have an Account ? \n Sign Up First",
                              textAlign: TextAlign.center))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Method called when user clicks on Login button
  Future<void> clickOnLogin(BuildContext context) async {
    // Validate if the mobile number is empty
    if (_contactEditingController.text.isEmpty) {
      showErrorDialog(context, 'Mobile number can\'t be empty.');
    }
    // Validate if the mobile number length is less than 10 digits
    else if (_contactEditingController.text.length < 10) {
      showErrorDialog(
          context, 'Mobile number must have \n  to be of 10 digits.');
    } else {
      // Navigate to OTP screen with the concatenated dial code and mobile number
      final responseMessage = await Navigator.pushNamed(context, '/otpScreen',
          arguments: '$_dialCode${_contactEditingController.text}');
      // Show error dialog if response message is not null
      if (responseMessage != null) {
        // ignore: use_build_context_synchronously
        showErrorDialog(context, responseMessage as String);
      }
    }
  }

  // Callback function of country picker
  void _callBackFunction(String name, String dialCode, String flag) {
    _dialCode = dialCode;
  }

  // Alert dialogue to show error and response
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
