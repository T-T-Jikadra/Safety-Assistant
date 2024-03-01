// ignore_for_file: use_build_context_synchronously, file_names
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// for toast
void showToastMsg(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

//for pwd validate
String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a password';
  }

  if (value.length < 8) {
    return 'Password must be at least 8 characters long';
  }

  if (!value.contains(RegExp(r'[a-z]'))) {
    return 'Password must contain at least one lowercase letter';
  }

  if (!value.contains(RegExp(r'[A-Z]'))) {
    return 'Password must contain at least one uppercase letter';
  }

  if (!value.contains(RegExp(r'[0-9]'))) {
    return 'Password must contain at least one digit';
  }

  if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return 'Password must contain at least one special character';
  }

  return null; // Return null if the password passes all validations
}

//for circular progressbar
Future<void> showCircularProgressBar(BuildContext context) async {}

//for forgot pwd
Future<void> showForgotPasswordDialog(BuildContext context) async {
  TextEditingController forgotPwdController = TextEditingController();
  bool isValidEmail = false; // Track email validation
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.white),
      );
    },
  );
  await Future.delayed(const Duration(milliseconds: 600));
  Navigator.pop(context);
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text("Forgot Password"),
        content: Column(
          children: [
            const SizedBox(height: 15),
            const Text("Please enter email to send the reset link below :"),
            const SizedBox(height: 15),
            CupertinoTextField(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.black12),
              controller: forgotPwdController,
              placeholder: ' Email address',
              onChanged: (value) {
                // Validate email on each change
                isValidEmail = EmailValidator.validate(value.trim());
              },
            ),
          ],
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: () async {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  );
                },
              );
              await Future.delayed(const Duration(milliseconds: 800));
              Navigator.pop(context);
              if (isValidEmail) {
                try{
                  FirebaseAuth.instance.sendPasswordResetEmail(email: forgotPwdController.text.trim());
                } on FirebaseAuthException catch(e){
                  showToastMsg(e.message!);
                }
                // Implement sending email logic here
                // Send email, etc.
                // After email is sent, close the dialog
                Navigator.of(context).pop();
                // Show success message
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: const Text("Email sent !"),
                      content: const Text(
                          "We have sent a password reset link to your email check it out , In some case also check spam ."),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          onPressed: () {
                            Navigator.of(context)
                                .pop(); // Close the success message dialog
                          },
                          child: const Text("OKAY"),
                        ),
                      ],
                    );
                  },
                );
              } else {
                // Show error message if email is invalid
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: const Text("Invalid Email"),
                      content:
                          const Text("Please enter a valid email address."),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          onPressed: () {
                            Navigator.of(context)
                                .pop(); // Close the error message dialog
                          },
                          child: const Text("OKAY"),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            child: const Text("Send"),
          ),
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text("Cancel"),
          ),
        ],
      );
    },
  );
}
