// import 'package:fff/Citizen%20Related/Screens/Sign_Up/temp/otp-controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
//
// class OTPScreen extends StatefulWidget {
//   const OTPScreen({super.key, required String verificationId});
//
//   @override
//   State<OTPScreen> createState() => _OTPScreenState();
// }
//
// class _OTPScreenState extends State<OTPScreen> {
//   // ignore: non_constant_identifier_names
//   String otp_entered = "123";
//
//   @override
//   Widget build(BuildContext context) {
//
//     var otp;
//     // ignore: deprecated_member_use
//     return WillPopScope(
//       onWillPop: ()async {
//         Get.back();
//         Navigator.pop(context);
//         return false;
//       },
//       child: SafeArea(
//           child: Scaffold(
//         body: SingleChildScrollView(
//           child: Container(
//             padding: const EdgeInsets.all(30),
//             child: Column(
//               //mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(
//                   height: 35,
//                 ),
//                 const Text("Check Your Inbox (●'◡'●)",
//                     style: TextStyle(fontSize: 45, fontWeight: FontWeight.w600)),
//                 const SizedBox(
//                   height: 25,
//                 ),
//                 const Text(
//                   "Enter Verification Code                    ",
//                   style: TextStyle(fontSize: 20),
//                 ),
//                 const SizedBox(
//                   height: 25,
//                 ),
//                 Lottie.asset("assets/json/otp_lottie.json",
//                     width: 300, height: 300, fit: BoxFit.fitWidth),
//
//                 //applied ..
//                 OtpTextField(
//                   numberOfFields: 6,
//                   fillColor: Colors.deepPurple.withOpacity(0.1),
//                   filled: true,
//                   onSubmit: (code) {
//                     otp = code;
//                     //OTPController.instance.verify0TP(otp);
//                     //otp_entered = code.toString();
//                   },
//                 ),
//
//                 //removedd..
//                 OtpPinField(
//                   key: _otpPinFieldKey,
//                   textInputAction: TextInputAction.done,
//                   maxLength: 6,
//                   fieldWidth: 38,
//                   otpPinFieldDecoration:
//                   OtpPinFieldDecoration.roundedPinBoxDecoration,
//                   onSubmit: (text) {
//                     smsOTP = text;
//                   },
//                   onChange: (text) {},
//                 ),
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 Container(
//                   padding: const EdgeInsets.only(bottom: 20),
//                   width: double.infinity,
//                   child: ElevatedButton(
//                       onPressed: () {
//                         //OTPController.instance.verify0TP(otp);
//
//                         Get.snackbar(
//                           "Otp is - ",
//                           otp_entered,
//                           duration: const Duration(milliseconds: 1400),
//                           backgroundColor: const Color(0xFFf5f5dc),
//                           titleText: const Text("Your Input is : "),
//                           animationDuration: const Duration(milliseconds: 1500),
//                           colorText: Colors.brown,
//                           isDismissible: true,
//                           mainButton: TextButton(
//                               onPressed: () {
//                                 Get.back();
//                               },
//                               child: const Text("Cancel")),
//                           showProgressIndicator: true,
//                           maxWidth: 320,
//                         );
//                       },
//                       child: const Text("Verify")),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       )),
//     );
//   }
// }
