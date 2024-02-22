import 'dart:async';
import 'package:fff/Screens/entry_point.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

// ignore: must_be_immutable
class OtpScreen extends StatefulWidget {
  bool _isInit = true;
  var _contact = '';

  OtpScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late String phoneNo;
  late String smsOTP;
  late String verificationId;
  String errorMessage = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _otpPinFieldKey = GlobalKey<OtpPinFieldState>();

  //this is method is used to initialize data
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Load data only once after screen load
    if (widget._isInit) {
      final arguments = ModalRoute.of(context)?.settings.arguments;
      if (arguments != null && arguments is String) {
        widget._contact = arguments;
        generateOtp(widget._contact);
        widget._isInit = false;
      } else {
        if (kDebugMode) {
          print("!!! Mobile number not correctly passed to this screen !!!");
        }
      }
    }
  }

  //dispose controllers
  @override
  void dispose() {
    super.dispose();
  }

  //build method for UI
  @override
  Widget build(BuildContext context) {
    //Getting screen height width
    final screenHeight = MediaQuery.of(context).size.height;
    //final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                const Text("Check Your Inbox ... (●'◡'●)",
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 2,
                ),
                Lottie.asset("assets/json/otp_lottie.json",
                    width: 300, height: 300, fit: BoxFit.fitWidth),
                const Text(
                  'Verification process : ',
                  style: TextStyle(fontSize: 28),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Text(
                  'Enter 6 digit number that was \nsent to : ${widget._contact}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    //color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.all(5.0),
                  // decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     // ignore: prefer_const_literals_to_create_immutables
                  //     boxShadow: [
                  //       const BoxShadow(
                  //         color: Colors.grey,
                  //         offset: Offset(0.0, 1.0), //(x,y)
                  //         blurRadius: 6.0,
                  //       ),
                  //     ],
                  //     borderRadius: BorderRadius.circular(16.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OtpPinField(
                        key: _otpPinFieldKey,
                        textInputAction: TextInputAction.done,
                        maxLength: 6,
                        fieldWidth: 38,
                        otpPinFieldDecoration:
                            OtpPinFieldDecoration.roundedPinBoxDecoration,
                        onSubmit: (text) {
                          smsOTP = text;
                        },
                        onChange: (text) {},
                      ),
                      SizedBox(
                        height: screenHeight * 0.04,
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        width: double.infinity,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: ElevatedButton(
                                onPressed: () {
                                  verifyOtp();
                                },
                                child: const Text("Verify .."))),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Method for generate otp from firebase
  Future<void> generateOtp(String contact) async {
    // final PhoneCodeSent smsOTPSent = (verId, forceResendingToken) {
    //   verificationId = verId;
    // };
    smsOTPSent(verId, forceResendingToken) {
      verificationId = verId;
    }
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: contact,
        codeAutoRetrievalTimeout: (String verId) {
          verificationId = verId;
        },
        codeSent: smsOTPSent,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (AuthCredential phoneAuthCredential) {},
        verificationFailed: (error) {
          if (kDebugMode) {
            print(error);
          }
        },
      );
    } catch (e) {
      //for testing :
      Get.snackbar(
        "Got an Error : ",
        "$e",
        duration: const Duration(milliseconds: 1400),
        backgroundColor: const Color(0xFFf5f5dc),
        titleText: const Text("Got an Error : "),
        animationDuration: const Duration(milliseconds: 1500),
        colorText: Colors.brown,
        isDismissible: true,
        mainButton: TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("Cancel")),
        showProgressIndicator: true,
        maxWidth: 320,
      );
      handleError(e as PlatformException);
    }
  }

  //Method for verify otp entered by user
  Future<void> verifyOtp() async {
    if (smsOTP.isEmpty || smsOTP == '') {
      showAlertDialog(context, 'Please enter 6 digit otp ..');
      return;
    }
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsOTP,
      );
      final UserCredential user = await _auth.signInWithCredential(credential);
      final User? currentUser = _auth.currentUser;
      assert(user.user?.uid == currentUser?.uid);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const EntryPoint(),
          ));
    } on PlatformException catch (e) {
      handleError(e);
    } catch (e) {
      //for test :
      Get.snackbar(
        "Got an Error - ",
        "$e",
        duration: const Duration(milliseconds: 1400),
        backgroundColor: const Color(0xFFf5f5dc),
        titleText: const Text("Got an Error - "),
        animationDuration: const Duration(milliseconds: 1500),
        colorText: Colors.brown,
        isDismissible: true,
        mainButton: TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("Cancel")),
        showProgressIndicator: true,
        maxWidth: 320,
      );
      if (kDebugMode) {
        print('Got An Error :- $e');
      }
    }
  }

  //Method for handle the errors
  void handleError(PlatformException error) {
    switch (error.code) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        FocusScope.of(context).requestFocus(FocusNode());
        setState(() {
          errorMessage = 'Invalid Code';
        });
        showAlertDialog(context, 'Invalid Code');
        break;
      default:
        showAlertDialog(context, error.message ?? 'Error');
        break;
    }
  }

  //Basic alert dialogue for alert errors and confirmations
  void showAlertDialog(BuildContext context, String message) {
    // set up the AlertDialog
    final CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: const Text('Error : '),
      content: Text('\n$message'),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
