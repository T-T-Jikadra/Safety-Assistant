// import 'package:fff/Citizen%20Related/Screens/Sign_Up/temp/signup_controller.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
//
// import '../../../../Screens/help_screen.dart';
// import '../../../../src/utils/constants.dart';
// import 'SignUp_header_widget.dart';
//
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   //TextEditingController mobileController = TextEditingController();
//   final controller = Get.put(SignUpController());
//   final _formkey = GlobalKey<FormState>();
//   var phone = "";
//
//   @override
//   Widget build(BuildContext context) {
//     //to change status bar BG color
//     //SystemChrome.setSystemUIOverlayStyle(
//        // const SystemUiOverlayStyle(statusBarColor: Colors.black12));
//     return Scaffold(
//       body: SingleChildScrollView(
//           child: Container(
//         padding: const EdgeInsets.all(30),
//         child: Column(
//           children: [
//             const FormHeaderWidget(
//               image: splash_shape,
//               title: "Get on Board !",
//               subTitle: "Create Your Profile \nwith Mobile no ... ",
//             ),
//             const SizedBox(
//               height: 25,
//             ),
//             Form(
//               key: _formkey,
//               child: TextFormField(
//                 onChanged: (value) {
//                   print(value);
//                   phone = value;
//                 },
//                 //autofocus: true,
//                 validator: (value) {
//                   print(value);
//                   if (value!.trim().length < 10) {
//                     return 'Mobile number less than 10';
//                   }
//                   return null; // Return null if the validation succeeds
//                 },
//                 maxLength: 15,
//                 controller: controller.phoneNo,
//                 //keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(
//                   labelText: "Mobile Number",
//                   hintText: ("   Enter Your Mobile Number"),
//                   prefix: Text("+91"),
//                   prefixIcon: Icon(Icons.call),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 50,
//             ),
//             Container(
//               padding: const EdgeInsets.only(bottom: 20),
//               width: double.infinity,
//               child: ElevatedButton(
//                   onPressed: () async {
//
//                     // if(_formkey.currentState!.validate()){
//                     //   SignUpController.instance.phoneAuthentication(controller.phoneNo.text.trim());
//                     //   Get.to(()=> const OTPScreen());
//                     // }
//                   },
//                   child: const Text("Proceed")),
//             ),
//           ],
//         ),
//       )),
//     );
//     // Scaffold
//   }
// }
